void null() {}


void attach_it() {
	entity twin = spawn();
	setmodel(twin, self.model);
	setattachment(twin, self.owner, "tag_hand");
	remove(self);
}


.string attached_model;
.string attached_model2;
.string attached_model3;
.string attached_model4;
.string attached_model5;

.string tag_name;
.string tag_name2;
.string tag_name3;
.string tag_name4;
.string tag_name5;


void() attach_place_model =
{
	entity t;
	vector org;

	t = find(world, targetname, self.target);
	org = tag_origin(self.tag_name, t);
	setorigin(self, org);
	self.owner = t;
	self.think = attach_it;
	self.nextthink = (time + 0.05);
};

void() spawn_attached_models =
{
	entity s_model;
	entity s_model2;
	entity s_model3;
	entity s_model4;
	entity s_model5;

	s_model = spawn();
	setmodel(s_model, self.attached_model);
	setattachment(s_model, self, self.tag_name);
	if (self.attached_model2 != "")
	{
		s_model2 = spawn();
		setmodel(s_model2, self.attached_model2);
		setattachment(s_model2, self, self.tag_name2);
	}
	if (self.attached_model3 != "")
	{
		s_model3 = spawn();
		setmodel(s_model3, self.attached_model3);
		setattachment(s_model3, self, self.tag_name3);
	}
	if (self.attached_model4 != "")
	{
		s_model4 = spawn();
		setmodel(s_model4, self.attached_model4);
		setattachment(s_model4, self, self.tag_name4);
	}
	if (self.attached_model5 != "")
	{
		s_model5 = spawn();
		setmodel(s_model5, self.attached_model5);
		setattachment(s_model5, self, self.tag_name5);
	}
	self.think = SUB_Null;
	self.nextthink = (time + 0.1);
};


void boat_frames() {
	if(self.frame == 1) {
		self.frame = 2;
		self.nextthink = time;
		self.think = null;
	}
	else {
		self.think = boat_frames;
		self.nextthink = time + 1;
		self.frame = 1;
	}
}


void boat_check() {
	if (self.owner.state == 1) {
		self.movetype = 0;
		self.velocity = '0 0 0';
		self.think = boat_frames;
		self.nextthink = time + 1.5;
	}
	else {
		self.think = boat_check;
		self.nextthink = time + 0.05;
	}
}


void place_model_checkowner() {
	entity realt;
	entity e = nextent(world);
	while (e) {
		if ((e.classname == "func_train") && (e.targetname == self.target)) {
			realt = e;
		}
		e = nextent(e);
	}

	if (realt) {
		self.movetype = MOVETYPE_FOLLOW; // make the hole follow
		self.solid = SOLID_NOT; // MOVETYPE_FOLLOW is always non-solid
		self.aiment = realt; // make the hole follow bmodel
		self.punchangle = self.angles; // the original angles of bmodel
		self.view_ofs = self.origin - realt.origin; // relative origin
		self.v_angle = self.angles - realt.angles; // relative angles

		if (self.spawnflags & 2) {
			self.frame = 0;
			self.owner = realt;
			self.think = boat_check;
			vector xyorigin = (realt.absmin + realt.absmax) * 0.5;
			xyorigin_z = self.origin_z;
			setorigin (self,xyorigin);
			self.nextthink = time + 0.05;
			return;
		}
		else {
			self.think = null;
		}

		self.nextthink = time + 0.5;
	}
}


/*FGD
@PointClass
	color(1 .5 .25)
	size(-16 -16 -16, 16 16 16)
	model({"path": model})
= place_model : "Generic placeholder for inserting MD3 models in game. Doesnt require compilation of map geometry to be added to level." [
	model(string) : "Model File" : : "Path/name of model to use (e.g. models/mapobjects/teleporter/teleporter.md3)."
	angles(vector) : "Pitch Yaw Roll" : "0 0 0" : "Individual control of PITCH, YAW, and ROLL (default 0 0 0)."
	scale(float) : "Uniform Scale" : "1" : "Floating-point value used to scale a model up or down (default 1.0)."
	spawnflags(flags) = [
		1 : "Check Owner"
		2 : "Boat"
	]
	target(target_destination) : "Target" : : "Attach to this entity"
]
*/
void place_model() {
	precache_model(self.model);
	setmodel(self, self.model);

	if (self.target != "") {
		if (self.spawnflags & 1) {
			self.nextthink = time + 0.1;
			self.think = place_model_checkowner;
		}
		else {
			if (!self.speed) {
				self.speed = CAM_ORG_X;
			}
			self.cnt = TRUE;
			self.movetype = MOVETYPE_PUSH;
			self.blocked = train_blocked;
			self.use = train_use;
			self.bloody = 1;
			self.solid = MOVETYPE_WALK;
			self.takedamage = TRUE;
			precache_sound("misc/null.wav");
			self.noise = "misc/null.wav";
			self.noise2 = "misc/null.wav";
			self.health = 999999984306749440;
			self.th_die = null;
			setsize(self, '-24 -24 0', '24 24 96');
			setorigin(self, self.origin);
			self.nextthink = (self.ltime + 0.15);
			self.think = func_train_find;
		}
		return;
	}
	if (self.attached_model != "") {
		self.think = spawn_attached_models;
		self.nextthink = (time + 0.1);
	}
}


void() TorchAmbient =
{
	ambientsound(self.origin, self.noise, TRUE, 0.5);
};


/*FGD
@PointClass
	color(0 1 1)
	size(-4 -4 -8, 4 4 8)
	model({{
		episode == 1 -> {"path": "models/objects/fixtures/torch1.md3"},
		episode == 2 -> {"path": "models/objects/fixtures/e2_torch.md3"},
		episode == 3 -> {"path": "models/objects/fixtures/e3_torch.md3"},
		episode == 4 -> {"path": "models/objects/fixtures/e2_torch_2.md3"},
		"models/objects/fixtures/torch1.md3"
	}})
= object_torch1 : "flamey wall torch" [
	episode(choices) : "Episode" : 1 = [
		1 : "Episode 1"
		2 : "Episode 2"
		3 : "Episode 3"
		4 : "Episode 4"
	]
	skin(integer) : "Alternate" : 1 : "(ALTERNATE) uses an alternate flame pattern and sound effect.  Use this every other torch placement to reduce syncing of sound/animation of multiple visible torches"
]
*/
void object_torch1() {
	if(!self.episode)
		self.episode = world.episode;
	self.classname = "object_torch1";
	if(self.episode == 1) {
		precache_model("models/objects/fixtures/torch1.md3");
		setmodel(self, "models/objects/fixtures/torch1.md3");
	}
	if(self.episode == 2) {
		precache_model("models/objects/fixtures/e2_torch.md3");
		setmodel(self, "models/objects/fixtures/e2_torch.md3");
		makevectors2 (self.angles);
	}
	if(self.episode == 3) {
		// FIXME: This model does not exist
		precache_model("models/objects/fixtures/e3_torch.md3");
		setmodel(self, "models/objects/fixtures/e3_torch.md3");
	}
	if(self.episode == 4) {
		precache_model("models/objects/fixtures/e2_torch_2.md3");
		setmodel(self, "models/objects/fixtures/e2_torch_2.md3");
		makevectors2 (self.angles);
	}

	precache_sound("fx/fire1.ogg");
	precache_sound("fx/fire2.ogg");
	setsize(self, '-4 -4 -8', '4 4 8');

	if (self.episode == 2) {
		self.solid = SOLID_BBOX;
		self.wrathflags += FL_NOONTOP;
		setsize(self, '-4 -4 -30', '4 4 12');
	}

	if (!self.skin) {
		float r = random();
		if ( r > 0.5)
			self.skin = 1;
	}

	if(self.episode == 1)
		self.skin = floor(random(0,3.99));

	if (self.skin != 1) {
		self.noise = "fx/fire1.ogg";
	}
	else {
		self.noise = "fx/fire2.ogg";
	}
	TorchAmbient();
}


/*FGD
@PointClass model("models/objects/fixtures/e2_torch.md3") = object_torch2 []
*/
void object_torch2() {
	self.episode = 2;
	precache_model("models/objects/fixtures/e2_torch.md3");
	object_torch1();
}


/*FGD
@PointClass model("models/objects/fixtures/e2_torch_2.md3") = object_torch2b []
*/
void object_torch2b() {
	self.episode = 4;
	precache_model("models/objects/fixtures/e2_torch_2.md3");
	object_torch1();
}


void CyExplosionBody() {
	entity newcyst;
	vector tagorg;
	if(self.owner.flags & FL_MONSTER)
		tagorg = gettaginfo(self.tag_entity, self.tag_index);
	else
		tagorg = self.origin;
	remove(self);

	newcyst = spawn();
	setorigin(newcyst, tagorg);
	newcyst.scale = 0.25;
	setmodel(newcyst, "particles/explo/explo_cyst.md3");
	local float skinn;
	skinn = ceil(random() *4);
	if (skinn == 4)
		skinn = 0;
	newcyst.skin = skinn * 10;
	local string snd;
	snd = strcat("impact/projectiles/cyst_explo", ftos(floor(random() *5) + 1), ".ogg");
	sound(newcyst, CHAN_AUTO, snd, 1, 0.25);


	if(self.owner.flags & FL_MONSTER)
	{
		makevectors(self.owner.angles);
		if (self.owner.health > 0)
			pointparticles(particleeffectnum("cystbody"), tagorg, (v_forward *16), 1);
	}
	newcyst.think = cys_explode1b;
	newcyst.nextthink = time + 0.1;
};


.float cyst_flag;
.float cyst_rate_scale;
.float cyst_rate_glowmod;


void cyst_think() {
	if ((self.owner.wrathflags & FL_ALWAYSTOUCH)) {
		remove(self);
		return;
	}

	if (self.cyst_flag) {
		if(self.owner.classname != "monster_fallen")
			self.scale = (self.scale - (self.cyst_rate_glowmod / 2));
		self.glowmod_x = (self.glowmod_x - self.cyst_rate_glowmod);
		self.glowmod_y = (self.glowmod_y - self.cyst_rate_glowmod);
		self.glowmod_z = (self.glowmod_z - self.cyst_rate_glowmod);
		if ((self.glowmod_x <= 0.5)) {
			self.cyst_flag = FALSE;
		}
	}
	else {
		if (self.owner.classname != "monster_fallen")
			self.scale = (self.scale + (self.cyst_rate_glowmod / 2));
		self.glowmod_x = (self.glowmod_x + self.cyst_rate_glowmod);
		self.glowmod_y = (self.glowmod_y + self.cyst_rate_glowmod);
		self.glowmod_z = (self.glowmod_z + self.cyst_rate_glowmod);
		if ((self.glowmod_x >= TRUE)) {
			self.cyst_flag = TRUE;
		}
	}
	if ((self.cnt == TRUE)) {
		if ((self.owner.health < (afflictedhealth - ((afflictedhealth / 100) * 20)))) {
			self.think = CyExplosionBody;
		}
		else {
			self.think = cyst_think;
		}
	}
	if ((self.cnt == 2)) {
		if ((self.owner.health < (afflictedhealth - ((afflictedhealth / 100) * 40)))) {
			self.think = CyExplosionBody;
		}
		else {
			self.think = cyst_think;
		}
	}
	if ((self.cnt == 3)) {
		if ((self.owner.health < (afflictedhealth - ((afflictedhealth / 100) * 60)))) {
			self.think = CyExplosionBody;
		}
		else {
			self.think = cyst_think;
		}
	}
	if ((self.cnt == 4)) {
		if ((self.owner.health < (afflictedhealth - ((afflictedhealth / 100) * 80)))) {
			self.think = CyExplosionBody;
		}
		else {
			self.think = cyst_think;
		}
	}
	self.nextthink = (time + 0.05);
}


void spawn_cysts(entity e) {
	entity cst1 = spawn();
	entity cst2 = spawn();
	entity cst3 = spawn();
	entity cst4 = spawn();
	cst1.owner = e;
	cst2.owner = e;
	cst3.owner = e;
	cst4.owner = e;
	cst1.cyst_rate_glowmod = (0.025 + (0.025 * random()));
	cst2.cyst_rate_glowmod = (0.025 + (0.025 * random()));
	cst3.cyst_rate_glowmod = (0.025 + (0.025 * random()));
	cst4.cyst_rate_glowmod = (0.025 + (0.025 * random()));
	cst1.cyst_rate_scale = 0.025;
	cst2.cyst_rate_scale = 0.025;
	cst3.cyst_rate_scale = 0.025;
	cst4.cyst_rate_scale = 0.025;
	cst1.count = 1;
	cst2.count = 2;
	cst3.count = 3;
	cst4.count = 4;
	setmodel(cst1, "models/enemies/afflicted/cyst_a.md3");
	setmodel(cst2, "models/enemies/afflicted/cyst_b.md3");
	setmodel(cst3, "models/enemies/afflicted/cyst_c.md3");
	setmodel(cst4, "models/enemies/afflicted/cyst_d.md3");
	float pos = ceil(((random() * 5) + 1));
	if ((pos > 5)) {
		pos = 5;
	}
	if ((pos == 1)) {
		cst1.cnt = 4;
		cst2.cnt = 3;
		cst3.cnt = 2;
		cst4.cnt = 1;
	}
	if ((pos == 2)) {
		cst1.cnt = 3;
		cst2.cnt = 4;
		cst3.cnt = 2;
		cst4.cnt = 1;
	}
	if ((pos == 3)) {
		cst1.cnt = 2;
		cst2.cnt = 3;
		cst3.cnt = 4;
		cst4.cnt = 1;
	}
	if ((pos == 4)) {
		cst1.cnt = 1;
		cst2.cnt = 2;
		cst3.cnt = 4;
		cst4.cnt = 3;
	}
	if ((pos == 5)) {
		cst1.cnt = 1;
		cst2.cnt = 2;
		cst3.cnt = 3;
		cst4.cnt = 4;
	}
	cst1.think = cyst_think;
	cst2.think = cyst_think;
	cst3.think = cyst_think;
	cst4.think = cyst_think;
	cst1.scale = 0.75;
	cst2.scale = 0.75;
	cst3.scale = 0.75;
	cst4.scale = 0.75;
	cst1.glowmod = '0.5 0.5 0.5';
	cst2.glowmod = '0.5 0.5 0.5';
	cst3.glowmod = '0.5 0.5 0.5';
	cst4.glowmod = '0.5 0.5 0.5';

	if (e.classname == "monster_fallen") {
		cst1.scale = 0.15;
		cst2.scale = 0.15;
		cst3.scale = 0.15;
		cst4.scale = 0.15;
		setattachment(cst1, e, "tag_leg_b_r");
		setattachment(cst2, e, "tag_knee_l");
		setattachment(cst3, e, "tag_arm_b_r");
		setattachment(cst4, e, "tag_arm_a_l");
	}
	else {
		setattachment(cst1, e, "tag_a");
		setattachment(cst2, e, "tag_b");
		setattachment(cst3, e, "tag_c");
		setattachment(cst4, e, "tag_d");
	}
	cst1.nextthink = (time + random());
	cst2.nextthink = (time + random());
	cst3.nextthink = (time + random());
	cst4.nextthink = (time + random());
}


.float sizeflag;
.string dmodel;
.string gibmodel1;
.string gibmodel2;
.string gibmodel3;
.string gibmodel4;
.vector tagorigin;


void setoriginbytag(string tagname, entity e) {
	float tagindex = gettagindex(e, tagname);
	vector tagorg = gettaginfo(e, tagindex);
	e.tagorigin = tagorg;
}


void smallbonetouch() {
	if ((other.solid == SOLID_BSP) && (self.cnt < 7)) {
		//self.effects = 1024;
		self.cnt ++;
		self.velocity_x += random(-90,90);
		self.velocity_y += random(-90,90);

		sound7 (self, CHAN_AUTO, self.noise, 1, 0.5,random(70,200),0);
	}
}


void spawngibs(string gibtagname, string gibmodel, entity ownr, vector gvel) {
	entity gib = spawn();
	gib.owner = ownr;
	setmodel(gib, gibmodel);
	gib.solid = TRUE;
	gib.skin = ownr.skin;
	gib.wrathflags += FL_GIB;
	gib.movetype = MOVETYPE_BOUNCE;
	gib.bouncefactor = 0.35;
	setoriginbytag(gibtagname, ownr);
	setsize(gib, '-1 -1 -1', '0 0 0');
	gib.angles = ownr.angles;
	gib.origin = ownr.tagorigin;
	gib.velocity = gvel;
	gib.alpha = TRUE;
	gib.think = gibalphafade4;
	float r = random();
	if ((gib.owner.classentity == "wrathbreakableskull") && (r < 0.75)) {
		gib.touch = smallbonetouch;
		gib.noise = "impact/destruct/skullbreak.ogg";
	}
	gib.nextthink = time + 3 + random() * 5;
}


/*FGD
@PointClass
	color(.8 .6 .4)
	size(-8 -8 -8, 8 8 8)
	model({"path": model, "scale": scale})
= place_modelb : "Places a model on the gound" [
	model(string) : "Model" : : ""
	scale(float) : "Scale" : : ""
]
*/
void place_modelb() {
	precache_model(self.model);
	setmodel(self, self.model);
	droptofloor();
}
