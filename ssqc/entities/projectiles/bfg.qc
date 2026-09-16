// self.macevweapon_x = 4			//	x (forward)
// self.macevweapon_y = -7			//	y (side)
// self.macevweapon_z = -7			//	z (up )
// self.macevweapon_scale = 1			//	scale
// mace_damage = 250          // primary fire damage
// mace_additional_damage = 100          // additional fire damage per ammo
// mace_proj_damage = 1500          // projectile impact damage
// mace_proj_splashdamage = 150          // projectile splash damage
// mace_proj_splashradius = 256          // projectile splash radius
// mace_proj_speed = 256          // projectile speed
// mace_proj_homingfactor = 1           // projectile homing strength /*?????????*/ 0 to 1
// mace_proj_acelerationfactor = 1.15           // projectile aceleration factor


float PROJ_BFG_DAMAGE = 1500;
float PROJ_BFG_SPLASH_DAMAGE = 150;
float PROJ_BFG_SPLASH_RADIUS = 256;
float PROJ_BFG_SPEED = 256;
float PROJ_BFG_LIFETIME = 12;
float PROJ_BFG_HOMING_STRENGTH = 1;
float PROJ_BFG_ACCELERATION = 1;

.float max_homing_projectile;


void projectile_bfg() {
	self.modelflags  = MF_TRACER3;
	setmodel(self, "models/projectiles/proj_mace.md3");
	self.solid = SOLID_TRIGGER;
	setsize(self, '-5 -5 -5', '5 5 5');

	self.movetype = MOVETYPE_FLY;
	self.solid = SOLID_NOT;
	self.dphitcontentsmask = DPCONTENTSMASK_WEAPON;
	self.touch = projectile_bfg_touch;
	self.pflags = PFLAGS_FULLDYNAMIC;
	self.wrathflags += FL_PROJECTILE;
	self.effects = EF_NODRAW;
	self.classname = "projectile_bfg";
	self.scale = 0.25;
	self.light_lev = 64;
	self.color = '3 1 1';
	self.traileffectnum = particleeffectnum("mace_projectile_trail");
	self.think = pre_mace_projectiles;
	self.nextthink = time + 0.15;
	self.lifetime = time + PROJ_BFG_LIFETIME;
}


void pre_mace_projectiles() {
	self.oldorigin = self.origin;
	self.angles = vectoangles(self.velocity);  // Look where you're going?
	if (self.scale < 1.5)
		self.scale += 0.15;
	self.solid = SOLID_CORPSE;
	self.effects = 0;
	self.velocity = normalize(self.velocity) * PROJ_BFG_SPEED;

	self.think = mace_bfg_drunk;
	self.nextthink = time + 0.025 + (self.ammo_bfg * 0.025);
}


void mace_bfg_drunk() {
	// self is a projectile_bfg
	vector oldvel = self.velocity;
	vector nextvel;
	if (!self.enemy) {
		self.velocity_x = self.velocity_x * 1.05;
		self.velocity_y = self.velocity_y * 1.05;
		self.velocity_z = self.velocity_z * 1.05;
		if (time > self.drunktime) {
			self.drunktime = time + random(0.3, 1);	// screw up fast
			bfg_search_enemy();
		}
	}
	else {
		float speed = vlen(self.velocity);
		vector venemyorg = self.enemy.origin + self.originoffset;
		vector vtemp = venemyorg + '0 0 0';
		float dist = vlen(self.origin - venemyorg);
		if (self.enemy.health > 0) {
			if (dist > 128) {
				vector dir = normalize(vtemp - self.origin);
				vector wishvel = dir * speed;
				nextvel = wishvel;
			}
			else {
				dir = normalize (venemyorg - self.origin);
				nextvel = dir * speed * 3;
			}
		}
		self.velocity_x = ((oldvel_x) *(1- mace_proj_homingfactor)) + (nextvel_x * mace_proj_homingfactor);
		self.velocity_y = ((oldvel_y) *(1- mace_proj_homingfactor)) + (nextvel_y * mace_proj_homingfactor);
		self.velocity_z = ((oldvel_z) *(1- mace_proj_homingfactor)) + (nextvel_z * mace_proj_homingfactor);
		self.velocity_x = self.velocity_x * 1.15;
		self.velocity_y = self.velocity_y * 1.15;
		self.velocity_z = self.velocity_z * 1.15;
	}

	self.angles = vectoangles(self.velocity);

	if (self.origin ==  self.oldorigin) {
		self.think = projectile_bfg_touch;
	}
	else {
		if (self.lifetime > time)
			self.think = mace_bfg_drunk;
		else
			self.think = SUB_Remove;
	}

	if(self.scale < 1.5)
		self.scale += 0.15;

	self.oldorigin = self.origin;

	if(self.cnt != 1)
		self.nextthink = time + 0.1;
	else
		self.nextthink = time + 0.025;
}


void projectile_bfg_touch() {
	vector org = self.origin;

	if (other == self.owner)
		return;
	if (other.wrathflags & FL_PROJECTILE)
		return;
	if (other.solid == SOLID_TRIGGER)
		return;	// trigger field, do nothing
	if (pointcontents(self.origin) == CONTENT_SKY) {
		remove(self);
		return;
	}

	spawn_shaker(self,15,1,512);
	makevectors(self.angles);
	setorigin(self, self.origin - (v_forward * 32));
	if (other.takedamage) {
		T_Damage(other, self, self.owner,mace_proj_damage);
		T_SplashDamage(self, self.owner,mace_proj_splashdamage, other, mace_proj_splashradius);
	}
	else {
		T_SplashDamage(self, self.owner,mace_proj_splashdamage, world, slagsplashradius);
	}

	// shockwave
	entity sw = spawn();
	sw.origin = self.origin;
	setmodel(sw,"models/artifacts/effects/orb_shockwave1.md3");
	sw.scale = 0.1;
	sw.alpha = 0.25;
	sw.colormod = '7 0 0';
	sw.think = projectile_bfg_explosion_think;
	sw.nextthink = time;

	// slag explosion
	entity se = spawn();
	float skinn = ceil(random() * 4);
	if (skinn == 4)
		skinn = 0;
	se.origin = self.origin - v_forward * 16;
	se.skin = skinn * 10;
	se.alpha = 0.5;
	se.scale = random(1.5,2);
	se.colormod = '5 1 1';
	setmodel(se, "particles/explo/explo_slag2.md3");
	se.think = slag2_explode1;
	se.nextthink = time + 0.1;

	// gib pusher
	entity gp = spawn();
	setmodel(gp, "");
	gp.origin = se.origin - '0 0 32';
	gp.cnt = 16;
	gp.count = 256; // radius
	gp.think = gibpusher_think;
	gp.nextthink = time + 0.25;


	vector old_impact = trace_endpos;
	traceline(self.origin, self.origin + v_forward * 1024, MOVE_HITMODEL, self);
	if (trace_ent != other)
		trace_endpos = old_impact;
	if (other.bloody == 2) {
		makevectors2(self.angles);
		if ((bossvulnerable == 1)) {
			if(other == trace_ent) {
				float r = random();
				if (other.classname == "boss_guardian2")
					explo_blood_sprite(2, trace_endpos);
				else
					explo_blood_sprite(5, trace_endpos);
			}
		}
		SpawnBlood(org, '0 0 0', 21, BLOOD_WHITE, 1);
	}
	if (other.bloodimpact)
		explo_blood_sprite(other.bloodimpact, trace_endpos);

	pointparticles(
		particleeffectnum("mace_projectile_explosion"),  // effect number
		org,  // origin
		'0 0 0',  // velocity
		1 + (3.5 * (10 - self.ammo_bfg))  // how many particles
	);
	remove(self);
}


void bfg_search_enemy() {
	entity near;
	float low = 999999;
	float score, maxproj;

	if(!self.enemy)
	{
		local entity head;
		head = findradius(self.origin, 2048);


		while (head)
		{

		if(head.health >= 0)
			maxproj = 1;
		if(head.health >= 1500)
			maxproj = 2;
		if(head.health > 3000)
			maxproj = 3;

		if ((head.classname == "boss_guardian1") || (head.classname == "boss_guardian2") || (head.classname == "boss_guardian3"))
			maxproj = 10;

			if ((visibleinfront(head, 2048)) && ((head.flags & FL_MONSTER) || ((head.classname == "boss_guardian1") || (head.classname == "boss_guardian2") || ((head.classname == "boss_guardian3") && !(head.flags & FL_NOTARGET))))&& (head.health > 0)&&(head.max_homing_projectile < maxproj))
			{
				score = vlen(head.origin - self.origin);
				if (score < 192) // if it's TOO close, choose a slightly further target
					score += 384;
				score -= head.health * 2;

				if (score < low)
				{
					low = score;
					near = head;
				}
			}

			head = head.chain;
		}
	}

	if (near)
	{
		self.enemy = near;
		if(self.enemy.classname == "boss_guardian3")
		{
			self.originoffset_x = random(-64,64);
			self.originoffset_y = random(-64,64);
			self.originoffset_z = random(-128,128);
		}
		else
		self.originoffset = '0 0 0';
		self.enemy.max_homing_projectile ++;
	}
}


void projectile_bfg_explosion_think() {
	// self is an explosion
	self.alpha -= 0.0065;
	self.scale += 0.1;
	if (self.scale >= 10)
		self.think = SUB_Remove;
	self.nextthink = time + 0.01;
}
