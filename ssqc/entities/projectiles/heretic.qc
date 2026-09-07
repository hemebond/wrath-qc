float PROJECTILE_HERETIC_VELOCITY = 1200;
float PROJECTILE_HERETIC_DAMAGE = 30;


void projectile_heretic_explode() {
	self.alpha -= 0.1;
	self.frame += 1;
	if (self.alpha < 0)
		self.think = SUB_Remove;
	else
		self.think = projectile_heretic_explode;
	self.nextthink = time + 0.05;
}


void projectile_heretic_touch() {
	if (other == self.owner)
		return;

	if(other.solid == SOLID_TRIGGER)
		return;

	self.solid = SOLID_NOT;

	if (pointcontents(self.origin) == CONTENT_SKY) {
		remove(self);
		return;
	}

	if (other.health) {
		T_Damage(other, self, self.owner, PROJECTILE_HERETIC_DAMAGE);
	}

	if (
		(other.classname == "player") &&
		(other == self.owner.enemy) &&
		(self.owner.health > 0) &&
		(self.owner.classname != "boss_guardian3" )
	) {
		if (self.owner.chasing != 1) {
			local entity oself;
			oself = self;
			self = self.owner;
			monstersound6("enemies/heretic/chase_start", 5, CHAN_AUTO);
			self.think = heretic_prechase;
			self.nextthink = time;
			self = oself;
		}
	}
	randomsound2("enemies/heretic/proj_impact", 3, 1, CHAN_WEAPON, 0, 0.25);
	setmodel(self, "models/projectiles/proj_heretic_explo.md3");
	pointparticles(particleeffectnum("proj_heretic_impact"), self.origin, '0 0 0', 1);
	self.movetype = MOVETYPE_NONE;
	self.alpha = 1;
	self.touch = SUB_Null;
	self.nextthink = time;
	self.think = projectile_heretic_explode;
}


void projectile_heretic_think() {
	if(self.origin ==  self.oldorigin)
	{
		self.think = projectile_heretic_explode;
	}
	else
	{
		if(self.lifetime < time)
			self.think = projectile_heretic_explode;
		else
			self.think = projectile_heretic_think;
	}
	self.oldorigin = self.origin;
	self.nextthink = time + 0.1;
}


void launch_projectile_heretic(vector org, vector dir, entity ownerproj) {
	entity projectile;
	projectile = spawn();
	projectile.owner = ownerproj;
	projectile.movetype = MOVETYPE_FLYMISSILE;
	projectile.solid = SOLID_TRIGGER;
	projectile.scale = 1;
	projectile.angles = vectoangles(dir);
	projectile.touch = projectile_heretic_touch;
	projectile.traileffectnum = particleeffectnum("proj_heretic_trail");
	projectile.classname = "projectile";
	projectile.think = projectile_heretic_think;
	projectile.nextthink = time + 0.1;
	projectile.lifetime = time + 12;
	projectile.classentity = "projectiles";
	projectile.wrathflags += FL_PROJECTILE;

	// FIXME: Testing
	projectile.pflags |= PFLAGS_FULLDYNAMIC;
	projectile.light_lev = 320;
	projectile.color = '1 0.5 0.5';

	entity oself = self;
	self = projectile;
	randomsound2("enemies/heretic/proj_loop", 3, 1, CHAN_WEAPON, 0, 0.25);
	self = oself;

	setmodel(projectile, "models/projectiles/proj_heretic.md3");
	setsize(projectile, '-6 -6 -6', '6 6 6');
	setorigin(projectile, org);
	projectile.velocity = dir * PROJECTILE_HERETIC_VELOCITY;
	projectile.oldvelocity = projectile.velocity;
}
