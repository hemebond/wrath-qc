.string link;
.string linked;
.entity followner;


void() object_switch_fire_wait = { self.skin = 0;
	self.usable = 1;
	self.think = SUB_Null;
};


void() object_switch_fire1 = { self.skin = 1;
	self.usable = 0;
	if (self.spawnflags == 1)
		self.think = SUB_Null;
	else
		self.think = object_switch_fire_wait;
	self.nextthink = time + self.wait;
};

void() object_switch_fire = { self.skin = 1;
	SUB_UseTargets();
	self.usable = 0;
	if (self.spawnflags == 1)
		self.think = SUB_Null;
	else
		self.think = object_switch_fire_wait;
	self.nextthink = time + self.wait;
};

.float switch_state;

void() nonsolidswitch_fire_off = { if (self.frame == 9)
		sound(self, CHAN_AUTO, self.noise2, 1, 1);
	self.frame -= 1;
	self.glowmod_x += 0.1;
	self.glowmod_y += 0.1;
	self.glowmod_z += 0.1;

	if (!self.frame)
	{
		self.think = SUB_Null;
		self.usable = 1;
	}
	else
		self.think = nonsolidswitch_fire_off;
	self.nextthink = time + 0.05;
};

void() nonsolidswitch_fire =
{

	if((self.usable == 2)  && (self.wait == -2))
	{
		if (self.frame == 9)
		{
			sound(self, CHAN_AUTO, self.noise2, 1, 1);
			SUB_UseTargets();
		}
		self.frame -= 1;
		self.glowmod_x += 0.1;
		self.glowmod_y += 0.1;
		self.glowmod_z += 0.1;

		if (!self.frame)
		{
			self.think = SUB_Null;
			self.usable = 1;
		}
		else
			self.think = nonsolidswitch_fire;
		self.nextthink = time + 0.05;
	}
	else
	{
		self.frame += 1;
		self.usable = 0;
		self.pipes.usable = 0;
		if (self.frame == 1)
		{
			sound(self, CHAN_AUTO, self.noise, 1, 1);
			SUB_UseTargets();
		}

		self.glowmod_x -= 0.1;
		self.glowmod_y -= 0.1;
		self.glowmod_z -= 0.1;

		if (self.frame == 9)
		{
			if (self.wait == -2)
				self.usable = 2;
			if (self.wait <= -1)
				self.think = SUB_Null;
			else
				self.think = nonsolidswitch_fire_off;
			self.nextthink = time + self.wait;
		}
		else
		{
			self.think = nonsolidswitch_fire;
			self.nextthink = time + 0.05;
		}
	}
};


/*FGD
@PointClass
	color(0 0.4 1)
	size(-12 -12 -16, 12 12 16)
	model({{
		model -> model, "models/objects/switches/e1_switch1.md3"
	}})
= object_switch : "When a switch is used by a player, it moves in the direction set by the `angle` key, triggers all its targets." [
	model(model) : "Model File" : "models/objects/switches/e1_switch1.md3" : "Path/name of model to use"
	angles(vector) : "Angles" : "0 0 0"
	target(target_destination) : "Target" : : "All entities with a matching targetname will be triggered."
	wait(float) : "Return Delay" : "-1" : "Number of seconds button stays pressed (-1 = no return)."
	delay(float) : "Delay" : "0" : "delay before firing (after being used)"
]
*/
// FIXME: This only works once so wait property is nonsense
void object_switch() {
	precache_model("models/objects/switches/collisionswitch.md3");

	string selfpipesmodel;
	if (!self.model)
		selfpipesmodel = ("models/objects/switches/e1_switch1.md3");
	else
		selfpipesmodel = self.model;

	precache_model(selfpipesmodel);
	setmodel(self, "models/objects/switches/collisionswitch.md3");

	precache_sound("objects/switches/e1_switch1.ogg");
	precache_sound("objects/switches/e1_switch1_reset.ogg");
	self.noise = "objects/switches/e1_switch1.ogg";
	self.noise2 = "objects/switches/e1_switch1_reset.ogg";

	self.classname = "nonsolidswitch";

	if (!self.wait)
		self.wait = -1;

	self.usable = 1;

	self.solid = SOLID_TRIGGER;
	setsize(self, '-10 -10 -16', '10 10 32');

	self.glowmod_x = 1;
	self.glowmod_y = 1;
	self.glowmod_z = 1;

	if (self.displacement == 1) {
		self.wrathflags += FL_INVISIBLE;
		self.effects = EF_NODRAW;
		self.solid = 0;
	}

	entity visibleswitch = spawn();
	visibleswitch.origin = self.origin;
	visibleswitch.angles = self.angles;
	visibleswitch.glowmod = self.glowmod;
	visibleswitch.classname = "switchmodel";
	visibleswitch.solid = SOLID_TRIGGER;
	visibleswitch.usable = 1;
	visibleswitch.effects = self.effects;
	setmodel(visibleswitch, selfpipesmodel);
	visibleswitch.owner = self;
	visibleswitch.think = visibleswitch_think;
	visibleswitch.nextthink = time;

	self.pipes = visibleswitch;
};
void switch_e1_switch1() = {
	object_switch();
}


void visibleswitch_think() {
	self.effects = self.owner.effects;
	self.frame = self.owner.frame;
	self.usable = self.owner.usable;
	self.glowmod = self.owner.glowmod;
	self.think = visibleswitch_think;
	self.nextthink = time + 0.025;
}


.float buttondecal;
.float keyrequired;

void quitkey(float keynumber) {
	string cent, dozen, unit, slotdigits;
	float cent_s, dozen_s, unit_s, currentslotkeyvalue, multiplier, slotkeynumber;
	slotdigits = ftos(self.slot_keys);
	cent = substring(slotdigits, 0, 1);
	dozen = substring(slotdigits, 1, 1);
	unit = substring(slotdigits, 2, 1);

	cent_s = stof(cent);
	dozen_s = stof(dozen);
	unit_s = stof(unit);
	slotkeynumber = self.slot_keys;
	if (keynumber == cent_s) {
		currentslotkeyvalue = (keynumber *100);
		slotkeynumber = (slotkeynumber - currentslotkeyvalue);
		slotkeynumber = slotkeynumber * 10;
	}

	if (keynumber == dozen_s) {
		currentslotkeyvalue = keynumber * 10;
		slotkeynumber = (slotkeynumber - (currentslotkeyvalue + unit_s)) + (unit_s *10);
	}

	if (keynumber == unit_s) {
		currentslotkeyvalue = keynumber * 1;
		if (slotkeynumber >= 10)
			multiplier = 0.1;
		else
			multiplier = 0;
		slotkeynumber = (slotkeynumber - (currentslotkeyvalue)) *multiplier;
	}

	self.slot_keys = slotkeynumber;
}


.float pillar_a_activated;
.float pillar_b_activated;
.float pillar_c_activated;
.float pillar_d_activated;
.float pillar_e_activated;
.entity keyson1;
.entity keyson2;
.entity keyson3;
.entity ykeyson;
.entity bkeyson;
.entity rkeyson;


void use_func() {
	makevectors(self.v_angle);
	vector source = self.origin + self.view_ofs - v_forward * 4;
	wtraceline(source, source + v_forward *72, FALSE, self);

	self.use_finished2 = time + 0.05;

	if (!(self.crosshairflag &1))
		return;

	if (self.usingnonsolidswitch) {
		self.nonsolidswitch.enemy = self;
		self.nonsolidswitch.think = nonsolidswitch_fire;
		self.nonsolidswitch.nextthink = self.nonsolidswitch.ltime + 0.01;
		self.use_finished = time + 0.075;
		return;
	}

	if (!trace_ent.usable)
		return;

	if (trace_fraction == 1.0 || GetSkyMaterial())
		return;

	self.use_finished = time + 0.05;

	if (trace_ent.classname == "coffer") {
		if (trace_ent.keyrequired) {
			if (!(self.items & IT_COFFERKEY1)) {
				Hud_SendNotification_Full(self, "coffer_key", "locked", "$NOTIFY_LOCKED_COFFER");
				sound(trace_ent, CHAN_VOICE, trace_ent.noise2, 1, 0.5);
				return;
			}
			else {
				if(self.items & IT_COFFERKEY3) {
					self.items -= IT_COFFERKEY3;
					self.keyson3.wrathflags -= FL_RESPAWN;
				}
				else
				{
					if (self.items & IT_COFFERKEY2) {
						self.items -= IT_COFFERKEY2;
						self.keyson2.wrathflags -= FL_RESPAWN;
					}
					else {
						self.items -= IT_COFFERKEY1;
						self.keyson1.wrathflags -= FL_RESPAWN;
					}
				}
			}
		}

		trace_ent.enemy = self;
		trace_ent.think = use_coffer;
		trace_ent.usable = 0;
		trace_ent.nextthink = time;
		return;
	}

	if (trace_ent.usable == 3 && trace_ent.usepressed) {
		// save globals
		entity o_self = self;
		entity o_other = other;

		// run usepressed func
		self = trace_ent;
		other = o_self;
		self.usepressed();

		// restore globals
		self = o_self;
		other = o_other;
	}

	if (trace_ent.classname == "func_button") {
		sound(trace_ent, CHAN_AUTO, "objects/switches/e1_switch1.ogg", 1, 1);
		trace_ent.enemy = self;
		trace_ent.think = button_fire;
		trace_ent.nextthink = trace_ent.ltime + 0.01;
		return;
	}

	if (trace_ent.buttondecal == 1) {
		sound(trace_ent, CHAN_AUTO, "objects/switches/e1_switch1.ogg", 1, 1);
		entity linkedbutton = trace_ent.owner;
		linkedbutton.enemy = self;
		linkedbutton.think = button_fire;
		linkedbutton.nextthink = trace_ent.ltime + 0.01;
		trace_ent.think = bboxbutton_think;
		trace_ent.nextthink = trace_ent.ltime + 0.01;
		return;
	}

	if (trace_ent.classname == "object_switch")
	{
		sound(trace_ent, CHAN_AUTO, "objects/switches/e1_switch1.ogg", 1, 1);
		trace_ent.enemy = self;
		trace_ent.think = object_switch_fire;
		trace_ent.nextthink = trace_ent.ltime + 0.01;
		if (trace_ent.link != "")
		{
			local entity t;
			t = find(world, linked, trace_ent.link);
			t.enemy = self;
			t.think = object_switch_fire1;
			t.nextthink = trace_ent.ltime + 0.01;
		}

		return;
	}

	if (trace_ent.classname == "readable") {
		if (self.message_flag == 1)
			return;
		self.message_flag = 1;
		self.message_time = time + 20;
		self.journal = 2;
		self.message_number = trace_ent.message_number;
		self.message_brelease = 1;
		return;
	}

	if (trace_ent.classname == "func_door") {
		if (trace_ent.keyrequired == 1) {  // red key
			if (!(self.items & IT_KEY1)) {
				Hud_SendNotification_Full(self, "key_red", "locked", "$NOTIFY_LOCKED_RED");
				return;
			}

			self.items -= IT_KEY1;
			self.rkeyson.wrathflags -= FL_RESPAWN;
			quitkey(1);
		}

		if (trace_ent.keyrequired == 2) {  // blue key
			if (!(self.items & IT_KEY2)) {
				Hud_SendNotification_Full(self, "key_blue", "locked", "$NOTIFY_LOCKED_BLUE");
				return;
			}

			self.items -= IT_KEY2;
			self.bkeyson.wrathflags -= FL_RESPAWN;
			quitkey(2);
		}

		if (trace_ent.keyrequired == 3) {  // yellow
			if (!(self.items & IT_KEY3)) {
				Hud_SendNotification_Full(self, "key_yellow", "locked", "$NOTIFY_LOCKED_YELLOW");
				return;
			}

			self.items -= IT_KEY3;
			self.ykeyson.wrathflags -= FL_RESPAWN;
			quitkey(3);
		}

		trace_ent.duser = self;
		trace_ent.think = door_puse;
		trace_ent.nextthink = trace_ent.ltime + 0.01;
		return;
	}

	if (trace_ent.use) {
		trace_ent.enemy = self;
		trace_ent.think = trace_ent.use;
		trace_ent.nextthink = time + 0.01;
		return;
	}
}
