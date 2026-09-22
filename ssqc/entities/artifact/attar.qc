/*FGD
@PointClass
	size(-12 -12 -44, 12 12 0)
	model({"path": "models/artifacts/artifact_attar.md3"})
= artifact_attar : "Artifact: Confounding Attar ( monster infighting potion )" []
*/

void artifact_attar() {
	precache_model("models/artifacts/artifact_attar.md3");
	precache_model("models/artifacts/effects/confounding_attar_cloud.md3");

	radial();

	self.noise = "items/artifacts/artifactD_pickup.ogg";
	self.noise1 = "items/artifacts/artifactD_use.ogg";
	self.noise2 = "items/artifacts/artifactD_end.ogg";
	precache_sound(self.noise);
	precache_sound(self.noise1);
	precache_sound(self.noise2);

	self.modelflags = MF_ROTATE;
	self.Attar = 1;

	if (self.secret)
		{total_secrets++;	self.wrathflags += FL_SECRET;}

	setmodel(self, "models/artifacts/artifact_attar.md3");
	setsize(self, artifact_nsize, artifact_size);
	self.msg = 104;
	self.msg_icon = "artifactD";
	self.msg_text = "$NOTIFY_ARTIFACT_ATTAR";
	self.touch = artifact_touch;
	self.oldtouch = self.touch;
}




.entity exenemy;
.float turret;

void() remove_attar_enemy =
{

	if((self.owner.health > 0) && (self.owner.alreadykilled != 1))
	{
		self.owner.enemy = self.exenemy;
		self.owner.friendly_monster = 0;
		if(self.owner.classname == "monster_stricken")
		{
			self.owner.turret = self.owner.oldturret;
			if(self.owner.turret == 1)
			self.owner.th_run = stricken_preattack1;
			else
			self.owner.th_run = stricken_run1;
		}

		else
		{
			entity oself = self;
			self = self.owner;
			FoundTarget();
			entity pl;
			pl = find(world, classname, "player");
			self.enemy = pl;
			ai_face();
			self.think = self.th_run;
			self.nextthink = time;
			self.goalentity = self.enemy;
			self = oself;
		}
	}
	self.think = alphafade;
	self.nextthink = time;
};
void() spawn_attar_enemy_think =
{
	if(self.owner.health <= 0)
	{
	self.think = alphafade;
	self.nextthink = time;
	return;
	}
	if(self.frame < 4)
		self.frame ++;

	if(self.lifetime < time)
	{
		self.alphatime = 1;
		self.think = remove_attar_enemy;
	}
	else
	self.think = spawn_attar_enemy_think;
	self.nextthink = time + 0.05;
};


void() find_next_enemy =
{
	next_enemy();
	self.nextthink = time;
	self.think = self.th_run;
};

void(entity ownr)spawn_attar_enemy =
{
	entity mark;
	mark = spawn();
	mark.owner = ownr;
	ownr.attached_cloud = mark;
	setmodel(mark,"models/artifacts/effects/confounding_attar_enemy.md3");
	mark.nextthink = time + 0.01;
	mark.lifetime = time + attar_effect_time;
	mark.think = spawn_attar_enemy_think;
	setattachment (mark,ownr,"");
};


void make_monster_friendly(entity friend) {
	if(friend.warped == 1)
		return;

	friend.friendly_monster = 1;

	if(friend.enemy)
		friend.exenemy = friend.enemy;

	friend.enemy = 0;
	friend.attar_timem = time  + 1;

	// FIXME: What is this for?
	// if(friend.classname == "monster_heretic") {
	// 	if(friend.movetype != MOVETYPE_STEP)
	// 		friend.movetype = MOVETYPE_STEP;
	// }

	friend.think = find_next_enemy;
	friend.nextthink = time;
	spawn_attar_enemy(friend);
	entity oself;
	oself = self;
	self = friend;
	ai_face();
	self = oself;
};


void attar_cloud_think() {
	if(self.frame < 4)
		self.frame ++;

	if(time > self.lifetime)
	{
		self.think = alphafade;
		self.alphatime = 1.5;
	}
	else
		self.think = attar_cloud_think;
	self.nextthink = time + 0.1;
}


void attar_touch() {
	//
	// The attar jar has touched something
	// TODO: Replace the model with a regular particle cloud
	//

	if ((other == self.owner))
		return;	// don't explode on owner

	if((other == world) || (other.flags & FL_MONSTER) || (other.solid == SOLID_BSP)) {
		sound(self, CHAN_AUTO, "items/artifacts/artifactD_end.ogg", 1, 0.25);

		pointparticles(particleeffectnum("attarparimpact"), self.origin, '0 0 0', 1);

		makevectors(self.angles);
		vector org = self.origin +'0 0 16';

		// Spawn a cloud at the impact point
		spawn_attar_cloud(self.origin);


		// Create four clouds around the impact point

		traceline(org, org + v_forward * 64, FALSE, self);
		spawn_attar_cloud(trace_endpos);

		traceline(org, org + v_forward * -64, FALSE, self);
		spawn_attar_cloud(trace_endpos);

		traceline(org, org + v_right * 64, FALSE, self);
		spawn_attar_cloud(trace_endpos);

		traceline(org, org + v_right * -64, FALSE, self);
		spawn_attar_cloud(trace_endpos);

		remove(self);
	}
}


float ATTAR_CLOUD_LIFETIME = 20;  // AOE duration

void spawn_attar_cloud(vector org) {
	entity cloud = spawn();
	setorigin(cloud, org);
	setmodel(cloud, "models/artifacts/effects/confounding_attar_cloud.md3");
	cloud.solid = SOLID_TRIGGER;
	// setsize(cloud, attar_bboxn, attar_bbox);
	setsize(cloud, '-64 -64 -64', '64 64 64');
	cloud.touch = attar_cloud_touch;
	cloud.lifetime = time + ATTAR_CLOUD_LIFETIME;
	cloud.nextthink = time + 0.1;
	cloud.think = attar_cloud_think;
	cloud.alphatime = 1.5;
}


void attar_cloud_touch() {
	if (
		(other.classentity == "monsters") &&
		(other.friendly_monster != 1) &&
		(other.warped_time < time)
	)
	make_monster_friendly(other);
}



void attar_think_fly() {
	entity head = findradius(self.origin, 16);
	float fm = 0;
	while (head) {
		if ((head.classentity ==  "monsters") && (head.warped_time < time) && (head.friendly_monster != 1)) {
			fm = 1;
		}
		head = head.chain;
	}

	if (fm == 1)
		self.think = attar_touch;
	else
		self.think = attar_think_fly;
	self.nextthink = time + 0.05;
}


void Attar_selected() {
	//
	// Throw the purple jar
	//

	if (!self.Attar)
		return;

	entity missile = spawn();
	self.Attar--;
	self.radial_time = time + 1;
	missile.owner = self;
	missile.movetype = MOVETYPE_BOUNCE;
	missile.solid = SOLID_TRIGGER;
	missile.classname = "grenade";
	sound(self, CHAN_AUTO, "items/artifacts/artifactD_use.ogg", 1, 0.25);
	Controller_Rumble(self, 0, 0.8, 120);
	makevectors(self.v_angle);
	if (self.v_angle_x) {
		missile.velocity = v_forward * attar_vel + v_up * attar_velz + crandom() * v_right * 1 + crandom() * v_up * 1;
	}
	else {
		missile.velocity = normalize(self.cursor_trace_endpos - missile.origin) * attar_vel;
		missile.velocity_z += attar_velz;
	}
	missile.angles = vectoangles(missile.velocity);
	missile.gravity = attar_grav;
	missile.touch = attar_touch;
	missile.think = attar_think_fly;
	missile.avelocity_y = 360;
	missile.avelocity_z = random( -250,250);
	missile.traileffectnum = particleeffectnum("attarparticle");
	missile.nextthink = time + 0.05;
	setmodel(missile, "models/artifacts/effects/confounding_attar_proj.md3");
	setsize(missile, attar_pbboxn,attar_pbbox);
	setorigin(missile, self.origin);
}
