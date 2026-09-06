void() misc_cyst_die =
{
	T_SplashDamage(self, self, self.dmg, world, self.sradius);
	aoe_spawn(self);
	pointparticles(particleeffectnum("retcher"), self.origin, '0 0 0', 1);
	CyExplosionBody();
};

void() misc_cyst_wait_die =
{
	self.takedamage = 0;
	self.think  = misc_cyst_die;

	float delaytodie;

	if(self.enemy.classname != "player")
		delaytodie = 0.5 +random() * 0.5;

	self.think = misc_cyst_die;
	self.nextthink = time + delaytodie;
};


/*FGD
@PointClass
	color(0 1 0)
	size(-8 -8 -8, 8 8 8)
	model("models/items/cysts.md3")
= misc_cyst : "A solid cyst entity that explodes when triggered" [
	targetname(target_source) : "Target Name" : : "Cyst can explode it with func_button or trigger"
	dmg(float) : "Damage Inflicted" : "16" : "Damage caused by explosion"
	sradius(float) : "Radius" : "16" : "Radius of explosion"
	health(float) : "Health" : "16" : "Health of the cyst. if health is 0 it should be triggered to explode"
	scale(float) : "Model Scale" : "2" : "Scale of the model, it will affect collisions box size"
	type(float) : "Model Type" : "1" : "Values from 1 to 4, it will change the default cyst model"
]
*/
void misc_cyst() {
	if(!self.type)
		self.type = 1;
	if(!self.scale)
		self.scale = 2;
	if(!self.dmg)
		self.dmg = 16;
	if(!self.sradius)
		self.sradius = 64;

	if (self.type == 1)
		setmodel(self, "models/enemies/afflicted/cyst_a.md3");
	else if (self.type == 2)
		setmodel(self, "models/enemies/afflicted/cyst_b.md3");
	else if (self.type == 3)
		setmodel(self, "models/enemies/afflicted/cyst_c.md3");
	else if (self.type == 4)
		setmodel(self, "models/enemies/afflicted/cyst_d.md3");
	else
		setmodel(self, "models/enemies/afflicted/cyst_a.md3");

	self.solid = SOLID_BBOX;

	if(self.health > 0)
		self.takedamage = DAMAGE_AIM;

	self.use = misc_cyst_die;

	vector sizepositive = '8 8 8' * self.scale;
	vector sizenegative = '-8 -8 -8' * self.scale;
	setsize(self, sizenegative, sizepositive);

	self.th_die = misc_cyst_wait_die;
};
