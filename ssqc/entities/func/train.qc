/*FGD
@SolidClass
	color(0 .4 1)
= func_train : "Trains are moving solids that follow a string of path_corner entities. Trains in Q3A are very basic, they also require an origin brush (see notes)." [
	color(color1) : "Model Light Color" : "1 1 1" : "ConstantLight color of .md3 model included with entity. Has no effect on the entity's brushes (default 1 1 1)."
	light(float) : "Model Light Intensity" : "0" : "ConstantLight radius of .md3 model included with entity. Has no effect on the entity's brushes (default 0)."
	model2(string) : "Model File" : "" : "Path/name of model to include (.md3 files only, e.g. models/mapobjects/pipe/pipe02.md3)."
	speed(float) : "Move Speed" : "100" : "Speed of displacement of train (default 100 or overridden by speed value of path)."
	target(target_destination) : "Target" : "" : "This points to the first path_corner of the path which is also the spawn location of the train's origin."
	targetname(target_source) : "Target Name" : "" : "Used to attach a misc_model entity to this entity."
	// -------- NOTES --------
	// 1. Trains always start on in the game.
	// 2. Trains do not damage the player when blocked.
	// 3. Trains cannot emit sound.
	// 4. Trains are not triggerable or toggle-able.
	// 5. Trains cannot be block-stopped just by getting in their way, the player must be wedged between the train and another obstacle to block it.
	//
	// You need to have an origin brush as part of this entity. When using the model2 key, the origin point of the model will correspond to the origin point defined by the origin brush.
	//
	// Target this entity with a misc_model to have the model attached to the entity (set the model's "target" key to the same value as this entity's "targetname").
]
*/
void func_train() {
	if (!self.speed) {
		self.speed = CAM_ORG_X;
	}
	if (!self.target) {
		objerror("func_train without a target");
	}
	if (!self.dmg) {
		self.dmg = FL_SWIM;
	}

	if (!(self.noise))
		self.noise = "misc/null.wav";
	if (!(self.noise2))
		self.noise2 = "misc/null.wav";

	precache_sound(self.noise);
	precache_sound(self.noise2);

	self.cnt = TRUE;
	self.solid = MOVETYPE_STEP;
	self.movetype = MOVETYPE_PUSH;
	self.blocked = train_blocked;
	self.use = train_use;
	self.classname = "func_train";
	setmodel(self, self.model);
	setsize(self, self.mins, self.maxs);
	setorigin(self, self.origin);
	self.oldtarget = self.target;
	if (!(self.spawnflags & TRUE)) {
		self.nextthink = (self.ltime + 0.2);
		self.think = func_train_find;
	}

	if (self.fake_lighted == -1)
		self.effects = 0;

	if (self.fake_lighted == 1) {
		if (!(self.effects & EF_DYNAMICMODELLIGHT))
			self.effects += EF_DYNAMICMODELLIGHT;
	}
	if (self.fake_lighted == 2) {
		self.fake_origin = 0.5 *(self.absmax + self.absmin);
		self.fake_origin_z = self.absmax_z + 8;

		entity attachedmodel;
		attachedmodel = spawn();
		setmodel (attachedmodel, "models/misc/null.md3");
		attachedmodel.solid = SOLID_NOT;
		setsize (attachedmodel,'0 0 0', '3 3 3');
		attachedmodel.owner = self;
		attachedmodel.origin = self.fake_origin ;
		attachedmodel.movetype = MOVETYPE_FOLLOW;
		attachedmodel.aiment = attachedmodel.owner;
		attachedmodel.view_ofs = attachedmodel.origin - self.origin; // relative origin
		attachedmodel.think = attached_think;
		attachedmodel.nextthink = time + 0.025;
	}
}


void() train_blocked =
{
	if ((time < self.attack_finished))
	{
		return;
	}
	self.attack_finished = (time + 0.5);
	T_Damage(other, self, self, self.dmg);
};

void() train_use =
{
	if ((self.spawnflags & TRUE))
	{
		train_next();
		return;
	}
	else
	{
		if (((self.think == train_next) && (self.wait == CONTENT_EMPTY)))
		{
			train_next();
			return;
		}
		if (((self.think != func_train_find) && (self.wait != CONTENT_EMPTY)))
		{
			return;
		}
		train_next();
	}
};

void() train_stop =
{
	local entity targ;

	soundwrath(self, FL_SWIM, self.noise2, TRUE, 0.15,100,0.5, FALSE);
	targ = find(world, targetname, self.target);
	self.target = targ.target;
	self.velocity = VEC_ORIGIN;
};

void() train_wait =
{

	if (self.wait)
	{
		self.nextthink = (self.ltime + self.wait);
		soundwrath(self, FL_SWIM, self.noise2, 1, 0.15, 100, 0.5, FALSE);
	}
	else
	{
		self.nextthink = (self.ltime + 0.1);
	}
	self.state = 1;
	self.think = train_next;
};

void() train_next =
{
	local vector fang;
	local entity targ;

	targ = find(world, targetname, self.target);
	if (!(self.spawnflags & TRUE))
	{
		self.target = targ.target;
	}
	if (!self.target)
	{
		objerror("train_next: no next target");
	}
	if (targ.wait)
	{
		self.wait = targ.wait;
	}
	else
	{
		self.wait = FALSE;
	}
	self.state = 0;
	//void(entity e, float chan, string samp, float vol, float atten, float speed, float flags, float trapezoid) soundwrath = #8;

	soundwrath(self, FL_SWIM, self.noise, TRUE, 0.15,100,0.5);
	if ((self.spawnflags & TRUE))
	{
		SUB_CalcMove(targ.origin, self.speed, train_stop);
	}
	else
	{
		SUB_CalcMove((targ.origin - self.mins), self.speed, train_wait);
	}
	if (((self.classname == "place_model") || (self.classname == "test_afflicted")))
	{
		fang = normalize((targ.origin - self.origin));
		makevectors(self.angles);
		self.angles = vectoangles(fang);
	}
};

void() func_train_find =
{
	local entity targ;

	targ = find(world, targetname, self.target);
	self.target = targ.target;
	setorigin(self, (targ.origin - self.mins));
	if (!self.targetname)
	{
		self.nextthink = (self.ltime + 0.1);
		self.think = train_next;
	}
};
