/*FGD
@PointClass
	color(0 1 1)
	size(-32 -32 0, 32 32 64)
	model({{
		episode == 1 -> {"path": "models/objects/coffers/coffer1_locked.md3"},
		episode == 2 -> {"path": "models/objects/coffers/coffer2_locked.md3"},
		episode == 3 -> {"path": "models/objects/coffers/coffer3_locked.md3"},
		"models/objects/coffers/coffer1_locked.md3"
	}})
= object_coffer : "object_coffer"[
	displacement(boolean) : "Displacement" : 0
	episode(choices) : "Episode" : 1 = [
		1 : "Episode 1"
		2 : "Episode 2"
		3 : "Episode 3"
	]
	coffer_artifacts(choices) : "Artifacts" : 0 = [
		1 : "Mark of Revelation"
		2 : "Drowners Apparatus"
		3 : "Flask Of Rage"
		4 : "Confounding Attar"
		5 : "Soul Tether"
		6 : "Life Siphon"
		7 : "Orb Of Deflection"
		8 : "Cruel Aegis"
		9 : "Vicious Animus"
		10 : "Shockwave"
		11 : "Void Grenade"
	]
	coffer_ammo(choices) : "Ammo" : 0 = [
		1 : "Slugs"
		2 : "Shells"
		3 : "Fangs"
		4 : "Cysts"
	]
	coffer_armor(choices) : "Armor" : 0 = [
		1 : "Armor shard"
		2 : "Armor helm"
		3 : "Armor"
		4 : "Dark armor shard"
		5 : "Dark helm"
		6 : "Dark armor"
	]
	coffer_health(choices) : "Health" : 0 = [
		1 : "Vial of lifeblood"
		2 : "Beaker of lifeblood"
		3 : "Chalice of lifeblood"
	]
	type(choices) : "Type" : 0 = [
		2 : "Jump scare"
		3 : "Invisible when opened"
	]
]
*/
void object_coffer() {
	string mdl, collisionmodel;

	if (!self.episode)
		self.episode = world.episode;

	if (self.episode == 1) {
		mdl = "models/objects/coffers/coffer1_locked.md3";
		collisionmodel = "models/objects/coffers/coffer1_collision.md3";
	}
	if (self.episode == 2) {
		mdl = "models/objects/coffers/coffer2_locked.md3";
		collisionmodel = "models/objects/coffers/coffer2_collision.md3";
	}
	if (self.episode == 3) {
		mdl = "models/objects/coffers/coffer3_locked.md3";
		collisionmodel = "models/objects/coffers/coffer3_collision.md3";
	}
	precache_model(mdl);
	precache_model(collisionmodel);
	precache_sound ("objects/coffers/coffer2_locked.ogg");

	self.glowmod = '1 1 1';
	self.noise2 = "objects/coffers/coffer1_locked.ogg";
	self.classname = "coffer";
	self.frame = 0;
	self.usable = 1;
	self.keyrequired = 1;
	self.alpha = -1;

	entity coffer_model = spawn();
	coffer_model.usable = 1;
	coffer_model.owner = self;
	setmodel(coffer_model, mdl);
	setattachment(coffer_model, self, "");
	coffer_model.think = coffer_model_think;
	coffer_model.nextthink = time + 0.05;

	self.pipes = coffer_model;
	self.solid = SOLID_BSP;

	if(self.displacement == 1) {
		self.wrathflags += FL_INVISIBLE;
		self.effects = EF_NODRAW;
		self.solid = 0;
	}

	setmodel(self, collisionmodel);
	self.use = use_coffer;
}


void use_coffer() {
	float ft;
	self.frame += 1;

	if (self.frame <= 10) {
		self.glowmod_x -= 0.11;
		self.glowmod_y -= 0.11;
		self.glowmod_z -= 0.11;
	}

	if (self.frame < 1)
		ft = 0.1;

	if (self.frame == 1) {
		sound(self, CHAN_AUTO, "objects/coffers/coffer1_unlocked.ogg", 1, ATTN_NORM);
		self.use = null;
		self.classname = "coffer_open";
		single_player.opened_coffers++; // Reki (July 24 2023): increment global opened coffer counter
		coffers_checkperfect(single_player);
	}

	if ((self.frame >= 1) && (self.frame <= 15)) {
		ft = 0.1;
	}

	if (self.frame == 16) {
		if (self.type == 2) {
			self.coffer_artifacts = 1;
			self.coffer_ammo = 1;
			self.coffer_armor = 1;
			self.coffer_health = 1;
			self.solid = 0;

			self.think = coffer_jumpscare;
			self.nextthink = time + 0.3;
			return;
		}
		if (self.episode == 1)
			ft = 0.4;
		else
			ft = 0.1;
	}

	if (self.frame > 16)
		ft = 0.1;

	if ((self.frame == 17) && (self.type == 2)) {
		sound7(self, CHAN_AUTO, "enemies/widow/sight2.ogg", 1, 0,90,0);
		sound7(self, CHAN_AUTO, "enemies/widow/sight1.ogg", 1, 0,120,0);

		vector tagorg = self.origin + '0 0 32';
		explo_blood(2, tagorg);
		explo_blood(9, tagorg);
		chattersound("impact/gibs/gib_explo", 3, 1);

		ThrowGib3(self, "models/gibs/gib_small.md3", 0, 0.75, 1, 2, tagorg, relvel('164 0 164', self), 0, 3);	// relvel: forward, right, up
		ThrowGib3(self, "models/gibs/gib_med.md3", 0, 0.75, 1, 2, tagorg, relvel('132 132 164', self), 0, 3);	// relvel: forward, right, up
		ThrowGib3(self, "models/gibs/gib_med.md3", 0, 0.75, 1, 2, tagorg, relvel('0 164 164', self), 0, 3);	// relvel: forward, right, up
		ThrowGib3(self, "models/gibs/gib_large.md3", 0, 0.75, 1, 2, tagorg, relvel('-132 132 164', self), 0, 3);	// relvel: forward, right, up
		ThrowGib3(self, "models/gibs/gib_small.md3", 0, 0.75, 1, 2, tagorg, relvel('-164 0 164', self), 0, 3);	// relvel: forward, right, up
		ThrowGib3(self, "models/gibs/gib_med.md3", 0, 0.75, 1, 2, tagorg, relvel('-132 -132 164', self), 0, 3);	// relvel: forward, right, up
		ThrowGib3(self, "models/gibs/gib_med.md3", 0, 0.75, 1, 2, tagorg, relvel('0 -164 164', self), 0, 3);	// relvel: forward, right, up
		ThrowGib3(self, "models/gibs/gib_large.md3", 0, 0.75, 1, 2, tagorg, relvel('132 -132 164', self), 0, 3);	// relvel: forward, right, up
	}

	if (self.frame == 18) {
		SUB_UseTargets();
	}

	self.nextthink = time + ft;
	self.think = use_coffer;

	if (self.frame >= 19) {
		if((self.episode == 2) && (self.episode == 3))
			ft = 0.4;
		if (self.coffer_artifacts)
			self.counter_coffer_ammount ++;
		if (self.coffer_ammo)
			self.counter_coffer_ammount ++;
		if (self.coffer_armor)
			self.counter_coffer_ammount ++;
		if (self.coffer_health)
			self.counter_coffer_ammount ++;
		self.nextthink = time + ft;
		self.think = trigger_coffer_use;
	}
}


void coffer_model_think() {
	self.frame = self.owner.frame;
	self.glowmod = self.owner.glowmod;
	self.think = coffer_model_think;
	self.nextthink = time + 0.01;

	if (self.frame == 1)
		self.usable = 0;

	if (self.owner.frame >= 19) {
		if(self.owner.type == 2) {
			self.nextthink = time + 0.5;
			self.think = alphafade;
		}
		if(self.owner.type == 3) {
			self.nextthink = time;
			self.think = SUB_Remove;
		}
	}
}


void coffer_jumpscare() {
	life_siphon_effect(self.origin + '0 0 12', self);
	self.nextthink = time + 0.1;
	self.think = use_coffer;
}


void coffer_use_next() {
	if (custom_infront(self, self.enemy.v_angle + '0 180 0', self.enemy.origin,90))
		self.ammo_shotgun++;
	else
		self.ammo_shotgun = 0;

	if (self.ammo_shotgun > 30) {
		sound(self, CHAN_AUTO, "objects/coffers/coffer2_locked.ogg", 1, 0.125);
		self.type = 3;
		remove(self.pipes);
		self.think = SUB_Remove;
		self.nextthink = time + 0.5;
	}
	else {
		self.think = coffer_use_next;
	}

	self.nextthink = time + 0.025;
}


void trigger_coffer_use() {
	entity ca, ch;
	self.classname = "coffer";


	if(self.counter_coffer_use == self.counter_coffer_ammount)
	{
		if(self.type == 2)
			self.think = SUB_Remove;
		else
		{
			self.noise = "objects/coffers/coffer2_locked.ogg";
			if((self.episode == 3))
			{
				self.enemy = single_player;
				self.think = coffer_use_next;
			}
			else
				self.think = SUB_Null;
		}
		self.nextthink = time + 3;
	}
	else
		self.think = trigger_coffer_use ;
	self.nextthink = time + 0.25;

	vector tagorg = tag_origin("tag_items", self);

	if (self.coffer_artifacts) {
		self.counter_coffer_use ++;
		ca = spawn();
		if(self.type != 2) {
			if (self.coffer_artifacts == 1)
				drop_item(tagorg, "mark", 1, self);
			if (self.coffer_artifacts == 2)
				drop_item(tagorg, "apparatus", 1, self);
			if (self.coffer_artifacts == 3)
				drop_item(tagorg, "flaskrage", 1, self);
			if (self.coffer_artifacts == 4)
				drop_item(tagorg, "attar", 1, self);
			if (self.coffer_artifacts == 11)
				drop_item(tagorg, "grenade", 1, self);
			if (self.coffer_artifacts == 6)
				drop_item(tagorg, "siphon", 1, self);
			if (self.coffer_artifacts == 7)
				drop_item(tagorg, "trinket", 1, self);
			if (self.coffer_artifacts == 8)
				drop_item(tagorg, "aegis", 1, self);
			if (self.coffer_artifacts == 9)
				drop_item(tagorg, "vicious", 1, self);
			if (self.coffer_artifacts == 10)
				drop_item(tagorg, "shockwave", 1, self);
			if (self.coffer_artifacts == 5)
				drop_item(tagorg, "tether", 1, self);
		}
		else {
			drop_item(tagorg, "helm_dark", 1, self);
		}

		self.coffer_artifacts = 0;
		return;
	}
	if (self.coffer_ammo) {
		self.counter_coffer_use ++;
		if(self.type != 2) {
			if (self.coffer_ammo == 1)
				drop_item(tagorg, "ammo_revolver", 15, self);
			else if (self.coffer_ammo == 2)
				drop_item(tagorg, "ammo_shotgun", 10, self);
			else if (self.coffer_ammo == 3)
				drop_item(tagorg, "ammo_spitter", 20, self);
			else if (self.coffer_ammo == 4)
				drop_item(tagorg, "ammo_retcher", 10, self);
			else if (self.coffer_ammo == 5)
				drop_item(tagorg, "ammo_cannon", 5, self);
			else if (self.coffer_ammo == 6)
				drop_item(tagorg, "ammo_lance", 5, self);
			else if (self.coffer_ammo == 7)
				drop_item(tagorg, "ammo_crystal", 10, self);
			else if (self.coffer_ammo == 8)
				drop_item(tagorg, "ammo_soul", 1, self);
		}
		else {
			drop_item(tagorg, "armor_dark", 1, self);
		}

		self.coffer_ammo = 0;
		return;
	}
	if (self.coffer_armor) {
		self.counter_coffer_use ++;
		if(self.type != 2) {
			if (self.coffer_armor == 1)
				drop_item(tagorg, "shard", 1, self);
			if (self.coffer_armor == 2)
				drop_item(tagorg, "armor", 1, self);
			if (self.coffer_armor == 3)
				drop_item(tagorg, "helm", 1, self);
			if (self.coffer_armor == 4)
				drop_item(tagorg, "shard_dark", 1, self);
			if (self.coffer_armor == 5)
				drop_item(tagorg, "armor_dark", 1, self);
			if (self.coffer_armor == 6)
				drop_item(tagorg, "helm_dark", 1, self);
		}
		else {
			drop_item(tagorg, "shard_dark", 1, self);
		}
		self.coffer_armor = 0;
		return;
	}
	if (self.coffer_health) {
		self.counter_coffer_use ++;
		if(self.type != 2) {
			ch = spawn();
			if (self.coffer_health == 1)
				drop_item(tagorg, "vial", 1, self);
			if (self.coffer_health == 2)
				drop_item(tagorg, "beaker", 1, self);
			if (self.coffer_health == 3)
				drop_item(tagorg, "chalice", 1, self);
		}
		else {
			drop_item(tagorg, "shard_dark", 1, self);
		}
		self.coffer_health = 0;
		return;
	}
}


/*FGD
@PointClass
	color(0 1 1)
	size(-32 -32 0, 32 32 64)
	model("models/objects/coffers/coffer1_locked.md3")
= object_fakecoffer : "A trick coffer to scare the player. Gives nothing." [
	type(integer) : "Type" : 0 : "A value of 1 launches shooting heads when opened"
]
*/

.entity ent_light;

void object_fakecoffer() {
	precache_model("models/objects/coffers/coffer1_collision.md3");

	self.glowmod = '1 1 1';
	self.noise2 = "objects/coffers/coffer1_locked.ogg";
	self.classname = "coffer_trap";
	self.usable = 1;
	self.alpha = -1;

	entity coffer_model = spawn();
	self.attached_cloud = coffer_model;
	randomsound2("enemies/wraith/proj_loop", 3, 0.25, CHAN_WEAPON, 0, 0.75);

	entity selflight = spawn();
	selflight.origin = self.origin + '0 0 48';
	selflight.pflags = 129;
	selflight.light_lev = 128;
	selflight.style = 11;
	self.ent_light = self;
	coffer_model.usable = 1;
	coffer_model.owner = self;

	if (self.type == 1) {
		selflight.color =  '0.75 0.75 1';
		coffer_model.colormod = '0.75 0.75 1';
	}
	else {
		selflight.color =  '1 0.85 0.85';
		coffer_model.colormod = '1 0.85 0.85';
	}
	setmodel(coffer_model, "models/objects/coffers/coffer1_locked.md3");
	setattachment(coffer_model, self, "");
	coffer_model.think = coffer_model_think;
	coffer_model.nextthink = time + 0.05;
	self.solid = SOLID_BSP;
	setmodel(self, "models/objects/coffers/coffer1_collision.md3");
	self.use = use_fakecoffer;
	droptofloor();
}


void use_fakecoffer() {
/*
FIXME:
VM_remove: tried to remove an already freed entity!
s91480: ssqc/entities/object_coffer.qc:503: STOREP_FNC alphafade (=alphafade()), GLOBAL20281
s91481: ssqc/entities/object_coffer.qc:504: FIELD_ENT  self (=entity 128), attached_cloud (=.attached_cloud), GLOBAL20280
s91482: ssqc/entities/object_coffer.qc:504: ADDRESS    GLOBAL20280, nextthink (=.nextthink), GLOBAL20281
s91483: ssqc/entities/object_coffer.qc:504: STOREP_F   time (=31.1015129), GLOBAL20281
s91484: ssqc/entities/object_coffer.qc:505: FIELD_F    self (=entity 128), ent_light (=.ent_light), GLOBAL4
s91485: ssqc/entities/object_coffer.qc:505: CALL1      remove (=remove())
s91486: ssqc/entities/object_coffer.qc:506: STORE_F    self (=entity 128), GLOBAL4
s91487: ssqc/entities/object_coffer.qc:506: CALL1      remove (=remove())
ssqc/entities/object_coffer.qc:506 : use_fakecoffer : statement 284
*/
	float ft;
	self.frame += 1;

	if (self.frame <= 10) {
		self.glowmod_x -= 0.11;
		self.glowmod_y -= 0.11;
		self.glowmod_z -= 0.11;
	}

	if (self.frame < 1)
		ft = 0.1;

	if (self.frame == 1) {
		sound(self, CHAN_AUTO, "objects/coffers/coffer1_unlocked.ogg", 1, ATTN_NORM);
		self.use = null;
		self.classname = "coffer_open";
	}

	if ((self.frame >= 1) && (self.frame <= 15)) {
		ft = 0.1;
	}

	if (self.frame == 16) {
		if (self.type != 1) {
			makevectors(self.angles);
			life_siphon_effect(self.origin + '0 0 12', self);
			life_siphon_effect(self.origin + '0 0 16' + v_right * 12, self);
			life_siphon_effect(self.origin + '0 0 8' + v_right * -12, self);
			sound7(self, CHAN_AUTO, "enemies/widow/sight2.ogg", 1, 0,90,0);
			sound7(self, CHAN_AUTO, "enemies/widow/sight2.ogg", 1, 0,112,0);
			sound7(self, CHAN_AUTO, "enemies/widow/sight2.ogg", 1, 0,120,0);
			sound7(self, CHAN_AUTO, "enemies/widow/sight1.ogg", 1, 0,105,0);
			sound7(self, CHAN_AUTO, "enemies/widow/sight1.ogg", 1, 0,120,0);
		}
		self.solid = SOLID_NOT;
	}

	if (self.frame > 16)
		ft = 0.1;

	if (self.frame == 17) {
		vector tagorg = self.origin + '0 0 32';
		pointparticles(particleeffectnum("wretch_bloodshower"), tagorg , '0 0 0', 1);
		explo_blood(2, tagorg);
		explo_blood(9, tagorg);
		chattersound("impact/gibs/gib_explo", 3, 1);

		ThrowGib3(self, "models/gibs/gib_small.md3", 0, 0.75, 1, 2, tagorg, relvel('164 0 164', self), 0, 3);	// relvel: forward, right, up
		ThrowGib3(self, "models/gibs/gib_med.md3", 0, 0.75, 1, 2, tagorg, relvel('132 132 164', self), 0, 3);	// relvel: forward, right, up
		ThrowGib3(self, "models/gibs/gib_med.md3", 0, 0.75, 1, 2, tagorg, relvel('0 164 164', self), 0, 3);	// relvel: forward, right, up
		ThrowGib3(self, "models/gibs/gib_large.md3", 0, 0.75, 1, 2, tagorg, relvel('-132 132 164', self), 0, 3);	// relvel: forward, right, up
		ThrowGib3(self, "models/gibs/gib_small.md3", 0, 0.75, 1, 2, tagorg, relvel('-164 0 164', self), 0, 3);	// relvel: forward, right, up
		ThrowGib3(self, "models/gibs/gib_med.md3", 0, 0.75, 1, 2, tagorg, relvel('-132 -132 164', self), 0, 3);	// relvel: forward, right, up
		ThrowGib3(self, "models/gibs/gib_med.md3", 0, 0.75, 1, 2, tagorg, relvel('0 -164 164', self), 0, 3);	// relvel: forward, right, up
		ThrowGib3(self, "models/gibs/gib_large.md3", 0, 0.75, 1, 2, tagorg, relvel('132 -132 164', self), 0, 3);	// relvel: forward, right, up

		if(self.type == 1)
			spawn_spining_head(1);
	}

	if (self.frame == 18) {
		if(self.type == 1)
		spawn_spining_head(1.5);
		ft = 0.4;
	}

	if (self.frame >= 19) {
		if (self.type == 1)
			spawn_spining_head(2);

		sound(self, CHAN_WEAPON, "misc/null.wav", 1, 1);
		self.attached_cloud.think = alphafade;
		self.attached_cloud.nextthink = time;
		remove(self.ent_light);
		remove(self);

	}
	else {
		self.think = use_fakecoffer;
	}

	self.nextthink = time + ft;
}


void spawn_spining_head(float velf) {
	makevectors(self.angles);
	vector revel = v_forward *(64 + random(32, 64)) * velf * 2;
	revel += v_right * random (-64 ,64) * velf;
	revel_z += (32 + random(16,32)) * velf;
	entity new = spawn();
	new.origin = self.origin + ' 0 0 16';
	setmodel(new,"models/enemies/wretch/gibs/gib_head_spin.md3");
	new.wrathflags += FL_GIB;
	new.bouncefactor = 0;
	new.touch = gib_touch2;
	new.time2 = time + random(3,5); // timing for nextthink alternative
	new.lifetime = time + wretch_sht;
	new.movetype = MOVETYPE_BOUNCE;
	new.bouncefactor = 1;
	new.velocity = revel;
	new.solid = SOLID_CORPSE;
	new.think = wretch_spining_head;
	new.nextthink = time + 0.05;
	new.frame = 0;
	new.flags = 0;
}
