float OUTLANDER_LEGS_ALL = 0;
float OUTLANDER_LEGS_TPOSE = 1;
float OUTLANDER_LEGS_STAND_IDLE = 2;
float OUTLANDER_LEGS_RUN_FORWARD = 3;
float OUTLANDER_LEGS_RUN_BACK = 4;
float OUTLANDER_LEGS_RUN_LEFT = 5;
float OUTLANDER_LEGS_RUN_RIGHT = 6;
float OUTLANDER_LEGS_STAND_TO_CROUCH = 7;
float OUTLANDER_LEGS_CROUCH_IDLE = 8;
float OUTLANDER_LEGS_CROUCH_TO_STAND = 9;
float OUTLANDER_LEGS_CROUCH_FORWARD = 10;
float OUTLANDER_LEGS_CROUCH_BACK = 11;
float OUTLANDER_LEGS_CROUCH_LEFT = 12;
float OUTLANDER_LEGS_CROUCH_RIGHT = 13;
float OUTLANDER_LEGS_JUMP_START = 14;
float OUTLANDER_LEGS_JUMP_LOOP = 15;
float OUTLANDER_LEGS_JUMP_LAND = 16;
float OUTLANDER_LEGS_DASH_LOOP = 17;
float OUTLANDER_LEGS_DASH_LAND = 18;

float OUTLANDER_UPPER_ALL = 0;
float OUTLANDER_UPPER_TPOSE = 1;
float OUTLANDER_UPPER_RIFLE = 2;
float OUTLANDER_UPPER_DASH_START = 3;
float OUTLANDER_UPPER_DASH_LOOP = 4;
float OUTLANDER_UPPER_MELEE_ATTACK = 5;
float OUTLANDER_UPPER_MELEE_IDLE = 6;
float OUTLANDER_UPPER_DASH_FIRE = 7;
float OUTLANDER_UPPER_WEAPON_SWITCH = 8;
float OUTLANDER_UPPER_PISTOL_IDLE = 9;
float OUTLANDER_UPPER_PISTOL_ATTACK = 10;
float OUTLANDER_UPPER_RIFLE_ATTACK = 11;
float OUTLANDER_UPPER_RIFLE_RELOAD = 12;

float PLAYER_CROUCHED_IDLE = 0;
float PLAYER_CROUCHED_FORWARD = 1;
float PLAYER_CROUCHED_LEFT = 2;
float PLAYER_CROUCHED_RIGHT = 3;
float PLAYER_CROUCHED_BACKWARD = 4;

float PLAYER_STANDING_IDLE = 5;
float PLAYER_STANDING_FORWARD = 6;
float PLAYER_STANDING_BACKWARD = 7;
float PLAYER_STANDING_LEFT = 8;
float PLAYER_STANDING_RIGHT = 9;


void weapon_think() {
	if (self.owner.weapon != self.weapon) {
		self.colormod = self.owner.vweapon.colormod;
		if (self.owner.weapon == IT_MELEE)
			setmodel(self, "models/weapons/melee/v_blade.md3");
		if (self.owner.weapon == IT_REVOLVER)
			setmodel(self, "models/weapons/revolver/w_revolver.md3");
		if (self.owner.weapon == IT_SHOTGUN)
			setmodel(self, "models/weapons/shotgun/w_shotgun.md3");
		if (self.owner.weapon == IT_SPITTER)
			setmodel(self, "models/weapons/spitter/w_spitter.md3");
		if (self.owner.weapon == IT_RETCHER)
			setmodel(self, "models/weapons/retcher/w_retcher.md3");
		if (self.owner.weapon == IT_CANNON)
			setmodel(self, "models/weapons/cannon/w_cannon.md3");
		if (self.owner.weapon == IT_LANCE)
			setmodel(self, "models/weapons/lance/w_lance.md3");

		self.weapon = self.owner.weapon;
	}
	self.think = weapon_think;
	self.nextthink = time + 0.05;
}


.float onground_time;
void legs_think() {
	if ((self.owner.vhud != 3) && (self.exteriormodeltoclient != self.owner)) {
		self.exteriormodeltoclient = self.owner;
		self.effects = 0;
	}

	// Hide the player model during cutscenes
	if ((self.owner.vhud == 3) && (self.exteriormodeltoclient == self.owner)) {
		self.exteriormodeltoclient = world;
		self.effects = EF_NODRAW;
	}

	if (self.owner.crouch) {
		// stop the player going into the floor
		// this is the min z-axis change between crouched and standing
		self.origin_z = 16;
	}
	else {
		self.origin_z = 0;
	}

	if (self.owner.onground_time > time) {
		float speed = vlen(self.owner.velocity);
		if (speed > 30) {
			// Running
			if(self.owner.crouch)
				// self.frame = 6;
				self.frame = OUTLANDER_LEGS_CROUCH_FORWARD;
			else
				// self.frame = 8;
				self.frame = OUTLANDER_LEGS_RUN_FORWARD;
		}
		else {
			if(self.owner.crouch)
				// self.frame = 14;
				self.frame = OUTLANDER_LEGS_CROUCH_IDLE;
			else
				// self.frame = 13;
				self.frame = OUTLANDER_LEGS_TPOSE;
		}
	}
	else {
			// self.frame = 11;
			self.frame = OUTLANDER_LEGS_JUMP_LOOP;
	}

	self.angles_x = -self.owner.angles_x;  // Negate the player pitch angle to stop the legs from angling forward and backwards
	self.think = legs_think;
	self.nextthink = time + 0.01;

	// float tag_index = gettagindex(self, "tag_mid");
	// vector waist_origin = gettaginfo(self, tag_index);
	// te_beam(self, waist_origin, waist_origin + (v_forward * 64));
};


.entity torso_model;
void torso_think() {
	if ((self.owner.button0) || (self.owner.button3)) {
		if (self.owner.weapon == IT_MELEE) {
			// self.frame = 11;
			self.frame = OUTLANDER_UPPER_MELEE_ATTACK;
		}
		else {
			// self.frame = 16;
			self.frame = OUTLANDER_UPPER_RIFLE_ATTACK;
		}
	}
	else {
		if (self.frame != 25) {
			// self.frame = 25;
			self.frame = OUTLANDER_UPPER_RIFLE;
		}
	}

	self.angles_x = self.owner.angles_x * 2;
	self.think = torso_think;
	self.nextthink = time + 0.025;
}


void spawn_player_model(entity player) {
	// Entities get "wrathflags |= FL_GARBAGE" so they get garbage collected when the player dies

	entity legs = spawn();
	legs.owner = player;
	legs.wrathflags = FL_GARBAGE;
	legs.exteriormodeltoclient = player;  // Stop the model showing up in cutscenes?
	setattachment(legs, player, "");
	legs.frame = OUTLANDER_LEGS_STAND_IDLE;
	setmodel(legs, "models/player/outlander/outlander_new_lower.md3");
	legs.think = legs_think;
	legs.nextthink = time + 0.05;

	entity torso = spawn();
	torso.owner = player;
	torso.wrathflags = FL_GARBAGE;
	setmodel(torso, "models/player/outlander/outlander_new_upper.md3");
	setattachment(torso, legs, "tag_mid");
	torso.frame = OUTLANDER_UPPER_RIFLE;
	torso.think = torso_think;
	torso.nextthink = time + 0.05;

	entity weapon = spawn();
	weapon.owner = player;
	weapon.wrathflags = FL_GARBAGE;
	setmodel(weapon, "models/weapons/shotgun/w_shotgun.md3");
	setattachment(weapon, torso, "tag_weapon");
	weapon.scale = 0.5;
	weapon.think = weapon_think;
	weapon.nextthink = time + 0.05;
}



void corpse_dead_think() {
	self.think = SUB_Remove;
	self.nextthink = time + 30;
}

void spawn_dead_model(vector org, vector ang) {
	entity corpse = spawn();
	setmodel(corpse, "models/misc/null.md3");
	corpse.origin = org;
	corpse.angles_y = ang_y;

	float r = random();
	if (r < 1)
		corpse.frame = 0;
	if (r < 0.65)
		corpse.frame = 2;
	if (r < 0.35)
		corpse.frame = 4;

	entity legs = spawn();
	legs.owner = corpse;
	legs.wrathflags = EF_LOWPRECISION;
	setattachment(legs, corpse, "");
	setmodel(legs, "models/player/outlander/lower.md3");
	legs.think = corpse_dead_think;
	legs.nextthink = time + 1.55;
	legs.frame = corpse.frame;

	entity torso = spawn();
	torso.owner = corpse;
	setmodel(torso, "models/player/outlander/upper.md3");
	setattachment(torso, legs, "tag_torso");
	torso.frame = corpse.frame;
	torso.think = corpse_dead_think;
	torso.nextthink = time + 1.55;

	entity head = spawn();
	head.owner = corpse;
	setmodel(head, "models/player/outlander/head.md3");
	setattachment(head,torso, "tag_head");
	head.think = corpse_dead_think;
	head.nextthink = time + 1.55;
}
