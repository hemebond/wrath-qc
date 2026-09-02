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


void misc_cyst() {
	//
	// Static cysts that can't be interacted with directly
	// but explode when used
	//

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
