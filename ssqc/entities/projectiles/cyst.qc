
void CyExplosion() {
	self.movetype = MOVETYPE_NONE;

	self.classname = "explosion_retcher";
	self.velocity = '0 0 0';
	self.touch = SUB_Null;
	setmodel(self, "particles/explo/explo_cyst.md3");
	self.solid = SOLID_NOT;

	local float skinn;
	skinn = ceil(random() *4);
	if (skinn == 4)
		skinn = 0;
	self.skin = skinn * 10;
	local string snd;
	snd = strcat("impact/projectiles/cyst_explo", ftos(floor(random() *5) + 1), ".ogg");
	sound(self, CHAN_AUTO, snd, 1, 0.25);
	pointparticles(particleeffectnum("retcher"), self.origin, v_forward *(-550), 1);
	cys_explode1();
}


void PreCyExplosion() {
	Cyxplode(self.cnt, 1, world);
	self.lifetime = 0;
}


void CheckCys() {
	if (self.flags & FL_ONGROUND) {
		self.traileffectnum = particleeffectnum("null");
	}
	else {
		self.oldvelocity = self.velocity;
		if (self.owner.classname != "monster_stricken")
			self.traileffectnum = particleeffectnum("retchertrail");
	}

	if (self.magnetized >= 1) {
		float dist = vlen (self.enemy.origin - self.origin);

		if (dist < 128) {
			vector dir = normalize ((self.enemy.origin -'0 0 16') - self.origin) * 768;
			self.velocity_z = (self.velocity_z + dir_z) * 0.5;
			self.movetype = MOVETYPE_FLY;
			self.magnetized -= 0.05;
		}
	}

	if (self.solid == SOLID_NOT)
		self.solid = SOLID_BBOX;

	if (self.lifetime < time)
		self.think = PreCyExplosion;
	else
		self.think = CheckCys;

	self.nextthink = time + 0.01;
}


void Cyxplode(float cdmg, float aoe, entity ignore) {
	self.classname = "explosion_retcher";

	if (self.owner.classname == "monster_stricken")
		T_SplashDamage(self, self.owner, stricken_splashdmg, ignore, stricken_splashradius);
	else
		T_SplashDamage(self, self.owner, retchersplashdamage, ignore, retchersplashradius);

	CyExplosion();

	if (aoe == 1)
		aoe_spawn(self);

	self.traileffectnum = particleeffectnum("null");
}


void cyst_field_think() {
	setorigin (self, self.owner.origin);

	if (self.oldorigin != self.origin) {
		self.owner.lifetime =  0;
		self.think = SUB_Remove;
	}

	if(self.owner.lifetime < time)
		self.think = SUB_Remove;
	else
		self.think = cyst_field_think;

	self.nextthink = time + 0.01;
}


void cyst_field_touch() {
	if (other.classname == "func_blade")
		self.owner.lifetime =  0;

	if (other.classname == "func_trap")
		self.owner.lifetime =  0;

	if ((other.health) && (other.flags & FL_MONSTER))
		self.owner.lifetime =  0;
}


void cyst_field_die() {
	if (self.ammo_shotgun == 1)
		self.owner.lifetime =  time + random (0.25, 0.5);
	else
		self.owner.lifetime =  0;

	remove(self);
}


void cyst_touch() {
	// Cyst has touched something

	if (GetSkyMaterial()) {
		// Hit the sky or a no-impact surface
		remove(self);
		sound(self, CHAN_WEAPON, "misc/null.wav", 0, ATTN_NORM);	// stop loop sound
		return;
	}

	pointparticles(particleeffectnum("retcherdecal"), self.origin, '0 0 0', 1);

	if (other == self.owner)
		return;	// don't explode on owner

	if(other.solid == SOLID_TRIGGER)
		return;

	if (self.cnt == 2) {
		if (other.takedamage > 0) {
			if(deathmatch == 1)
				T_Damage(other, self, self.owner, retcherdamg2_mp);
			else
				T_Damage(other, self, self.owner, retcherdamg2);

			Cyxplode(self.cnt, 0, other);
			return;
		}

		self.bouncefactor -= 0.05;
		self.velocity_x = self.velocity_x + random(-120, 120);
		self.velocity_y = self.velocity_y + random(-120, 120);
		self.velocity_z = self.velocity_z + random(0, 120);
		string snd = strcat("impact/projectiles/cyst_bounce", ftos(floor(random() * 5) + 1), ".ogg");
		sound(self, CHAN_AUTO, snd, 1, 0.25);
	}

	if (self.cnt == 1) {
		if ((other.takedamage > 0) && (other.classname != "cystfield")) {
			if(deathmatch == 1)
				T_Damage(other, self, self.owner, retcherdamg_mp);
			else
				T_Damage(other, self, self.owner, retcherdamg);

			Cyxplode(self.cnt, 0, other);
			return;
		}
		else {
			if (other.wrathflags & FL_INVISIBLE)
				self.wrathflags += FL_INVISIBLE;

			entity cyst_field = spawn();
			cyst_field.owner = self;
			cyst_field.oldorigin = self.origin;
			cyst_field.origin = self.origin;
			setsize(cyst_field, '-16 -16 -16', '16 16 16');
			cyst_field.solid = SOLID_TRIGGER;
			cyst_field.takedamage = DAMAGE_AIM;
			cyst_field.health = 5;
			cyst_field.th_die = cyst_field_die;
			cyst_field.touch = cyst_field_touch;

			entity cyst_solid_field = spawn();
			cyst_solid_field.owner = self;
			cyst_solid_field.origin = self.origin;
			setsize(cyst_solid_field, '-12 -12 -12', '12 12 12');
			cyst_solid_field.solid = SOLID_BBOX;
			cyst_solid_field.clipgroup = 1;
			cyst_solid_field.classname = "cystfield";
			cyst_solid_field.takedamage = DAMAGE_AIM;
			cyst_solid_field.health = 1;
			cyst_solid_field.th_die = cyst_field_die;
			cyst_solid_field.th_pain = th_paintodeath;
			cyst_field.nextthink = time + 0.1;
			cyst_field.think = cyst_field_think;

			self.clipgroup = CLIPGROUP_CYSTS;

			force_retouch = 2;

			self.pain_finished = time; // Reki: added this to track for achievement
			if (other != world) {
				self.movetype = MOVETYPE_FOLLOW;
				self.solid = SOLID_BBOX;
				self.aiment = other;
				self.punchangle = other.angles;
				self.view_ofs = self.origin - other.origin;
				self.v_angle = self.angles - other.angles;
			}
			else {
				self.solid = SOLID_BBOX;
				self.movetype = MOVETYPE_FLY;
				self.velocity = '0 0 0';
			}
		}
	}
}


void explo_model_retcher() {
	self.frame += 1;
	self.alpha -= 0.2;
	if (self.frame < 5)
		self.think = explo_model_retcher;
	else
		self.think = SUB_Remove;
	self.nextthink = time + 0.05;
}


void explo_retcher(vector org) {
	entity giblood = spawn();
	giblood.alpha = 1;
	giblood.origin = org;
	setmodel(giblood, "particles/explo/explo_retcher.md3");
	giblood.think = explo_model_retcher;
	giblood.nextthink = time;
}


void() cys_explode1 = {self.skin += 0;self.think = cys_explode2;self.nextthink = time + 0.05; explo_retcher(self.origin);};
void() cys_explode1b = {self.skin += 0;self.think = cys_explode2;self.nextthink = time + 0.05;};
void() cys_explode2 = {self.skin += 1;self.think = cys_explode3;self.nextthink = time + 0.05;};
void() cys_explode3 = {self.skin += 1;self.think = cys_explode4;self.nextthink = time + 0.05;};
void() cys_explode4 = {self.skin += 1;self.think = cys_explode5;self.nextthink = time + 0.05;};
void() cys_explode5 = {self.skin += 1;self.think = cys_explode6;self.nextthink = time + 0.05;};
void() cys_explode6 = {self.skin += 1;self.think = cys_explode7;self.nextthink = time + 0.05;};
void() cys_explode7 = {self.skin += 1;self.think = cys_explode8;self.nextthink = time + 0.05;};
void() cys_explode8 = {self.skin += 1;self.think = cys_explode9;self.nextthink = time + 0.05;};
void() cys_explode9 = {self.skin += 1;self.think = cys_explode10;self.nextthink = time + 0.05;};
void() cys_explode10 = {self.skin += 1;self.think = SUB_Remove;self.nextthink = time + 0.05;};


.float aoe_big;
void aoe_think() {
	float rdamage, radiusretcher;
	float vcnt = self.cnt / self.oldcnt;

	if (self.aoe_big == 1) {
		rdamage = vcnt * retcheraoedamage *1.5 + 10;
		radiusretcher = vcnt * retcheraoeradius *1.5 + 10;
		T_SplashDamage(self, self.owner, rdamage *1.25, world, radiusretcher);
		self.cnt -= 0.5;
	}
	else {
		rdamage = vcnt * retcheraoedamage + 10;
		radiusretcher = vcnt * retcheraoeradius + 10;
		T_SplashDamage(self, self.owner, rdamage, world, radiusretcher);
		self.cnt -= 1;
	}

	self.light_lev = self.light_lev * vcnt + 10;

	if (self.cnt > 0)
		self.think = aoe_think;
	else
		self.think = SUB_Remove;

	self.nextthink = time + retcheraoeframetime;
}


void aoep_think() {
	if (self.owner.cnt > 0)
		self.think = aoep_think;
	else
		self.think = SUB_Remove;
	self.origin = self.owner.origin;

	if (self.aoe_big == 1) {
		if ((self.owner.cnt) < (self.cnt / 5)) {
			pointparticles(particleeffectnum("retcheraoebig5"), self.origin, v_forward * -550, 3);
			dprint("Playing particle retcheraoebig5\n");
		}
		else if ((self.owner.cnt) < (self.cnt / 4)) {
			pointparticles(particleeffectnum("retcheraoebig4"), self.origin, v_forward * -550, 3);
			dprint("Playing particle retcheraoebig4\n");
		}
		else if ((self.owner.cnt) < (self.cnt / 3)) {
			pointparticles(particleeffectnum("retcheraoebig3"), self.origin, v_forward * -550, 3);
			dprint("Playing particle retcheraoebig3\n");
		}
		else if ((self.owner.cnt) < (self.cnt / 2)) {
			pointparticles(particleeffectnum("retcheraoebig2"), self.origin, v_forward * -550, 3);
			dprint("Playing particle retcheraoebig2\n");
		}
		else {
			pointparticles(particleeffectnum("retcheraoebig1"), self.origin, v_forward * -550, 3);
			dprint("Playing particle retcheraoebig1\n");
		}
	}
	else {
		pointparticles(particleeffectnum("retcheraoe"), self.origin, v_forward * -550, 2);
	}

	self.nextthink = time + 0.1;
}

void aoe_spawn(entity e) {
	dprint("aoe_spawn()\n");
	dprint("e.classname = ", e.classname, "\n");

	entity aoe = spawn();
	aoe.wrathflags += FL_GARBAGE;
	aoe.owner = e.owner;
	aoe.origin = e.origin;
	aoe.classname = "aoe";
	aoe.gravity = 0;  //.25;
	aoe.cnt = 3.5 / 0.5;
	aoe.oldcnt = aoe.cnt;
	aoe.think = aoe_think;
	aoe.nextthink = time;

	entity aoep = spawn();
	aoep.wrathflags += FL_GARBAGE;
	aoep.owner = aoe;
	aoep.origin = e.origin;
	aoep.classname = "aoep";
	aoep.cnt = aoe.cnt;
	aoep.oldcnt = aoe.cnt;
	aoep.think = aoep_think;
	aoep.nextthink = time;

	if (e.classname == "afflicted") {
		aoe.origin = e.origin - '0 0 32';

		aoep.aoe_big = 1;
		aoep.origin = e.origin - '0 0 32';
	}
	if (e.classname == "stricken")
		aoep.aoe_big = 1;
	if (e.classname == "misc_cyst")
		aoep.aoe_big = 1;

	string snd = strcat("impact/projectiles/cyst_aoe", ftos(floor(random() * 5) + 1), ".ogg");
	sound(aoe, CHAN_WEAPON, snd, 1, 0.5);
}
