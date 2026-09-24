/*FGD
@PointClass
	color(1 .5 .25)
	size(-16 -16 -32, 16 16 32)
	model({"path": "models/objects/teleporters/teleporter.md3"})
= teleporter : "A standard teleporter that transports the player between a pair of linked teleporters.It is both, destination and origin. Using models/objects/teleporter.md3 as model." [
	angle(float) : "Yaw Angle" : : "Direction in which player will look when teleported."
	inactive(integer) : "Disarmed" : 0 : "1 Turns the teleporter invisible and inactive, it should be triggered to active it"
	targetname(target_source) : "Target Name" : : "Make the trigger_teleporter point to this."
	target(target_destination) : "Target" : : "Targetname of linked teleporter."
]
*/
void teleporter() {
	precache_model("models/objects/teleporters/teleporter.md3");
	if (self.inactive) {
		self.use = teleporter_active;
		return;
	}

	self.model = "models/objects/teleporters/teleporter.md3";
	setmodel(self, self.model);	// set size and link into world
	setsize(self, '-16 -16 -32', '16 16 32');
	self.solid = SOLID_TRIGGER;
	item_colormodcontroller_pulse_spawn(self);
	if (self.target != "")
		self.touch = teleport_touch;
}


/*FGD
@SolidClass
	color(0.5 0.0 0.5)
= trigger_teleport : "Any object touching this will be transported to the corresponding info_teleport_destination entity. You must set the `target` field, and create an object with a `targetname` field that matches." [
	spawnflags(flags) = [
		1 : "Player Only" : 0 : "only players will teleport"
		2 : "Silent" : 0 : "silences teleporting"
	]
	target(target_destination) : "Target" : : "name of info_teleport_destination"
]
*/
void trigger_teleport() {
	InitTrigger();

	self.touch = teleport_touch;

	// find the destination
	if (!self.target)
		objerror("no target");

	self.use = teleport_use;
	if (!(self.spawnflags & SILENT)) {
		precache_sound("fx/portal.ogg");
		vector o = (self.mins + self.maxs) *0.5;
		ambientsound(o, "fx/portal.ogg", 0.5, ATTN_STATIC);
	}
}


/*FGD
@PointClass
	color(1 1 1)
	size(-32 -32 -24, 32 32 16)
= info_teleport_destination : "Teleport destination location point for trigger_teleporter entities." [
	angle(float) : "Yaw Angle" : : "Direction in which player will look when teleported."
	targetname(target_source) : "Target Name" : "" : "Make the trigger_teleporter point to this."
]
*/
void info_teleport_destination() {
	if (!self.targetname)
		objerror("no targetname");

	self.angles_x = 0;
	self.angles_z =	0;
	self.model = string_null;
	self.origin = self.origin + '0 0 27';
}


void play_teleport() {
	string tmpstr;

	float v = random() * 5;
	if (v < 1)
		tmpstr = "fx/tele1.ogg";
	else if (v < 2)
		tmpstr = "fx/tele2.ogg";
	else if (v < 3)
		tmpstr = "fx/tele3.ogg";
	else if (v < 4)
		tmpstr = "fx/tele4.ogg";
	else
		tmpstr = "fx/tele5.ogg";

	sound(self, CHAN_VOICE, tmpstr, 1, ATTN_NORM);
	remove(self);
}


void spawn_tfog(vector org) {
	s = spawn();
	s.origin = org;
	s.nextthink = time + 0.2;
	s.think = play_teleport;
}


void() tdeath_touch =
{
	if (other == self.owner)
		return;

	// frag anyone who teleports in on top of an invincible player
	if (other.classname == "player")
	{
		if (self.owner.owner.classname == "player")
			return;
		if (other.invincible_finished > time)
			self.classname = "teledeath2";

		if (self.owner.classname != "player")
		{
			// other monsters explode themselves
			T_Damage(self.owner, self, self, 50000);
			return;
		}
	}

	if (other.health)
	{
		T_Damage(other, self, self, 50000);
	}
};

void spawn_tdeath(vector org, entity death_owner){
	entity death = spawn();
	death.classname = "teledeath";
	death.movetype = MOVETYPE_NONE;
	death.solid = SOLID_TRIGGER;
	death.angles = '0 0 0';
	setsize(death, death_owner.mins - '1 1 1', death_owner.maxs + '1 1 1');
	setorigin(death, org);
	death.touch = tdeath_touch;
	death.nextthink = time + 0.2;
	death.think = SUB_Remove;
	death.owner = death_owner;

	force_retouch = 2;	// make sure even still objects get hit
};

void() teleport_touch =
{
	local entity t;
	local vector org;
	if (other.teleported_time > time)
	{
		other.teleported_time = time + 0.7;
		//other.
		return;
	}

	if ((self.targetname != string_null) && (self.classname == "trigger_teleport"))
	{
		if (self.nextthink < time)
		{
			return;	// not fired yet
		}
	}

	if (other.classname != "player")
		return;

	// only teleport living creatures
	if (other.health <= 0 || other.solid != SOLID_SLIDEBOX)
		return;

	SUB_UseTargets();

	// put a tfog where the player was
	spawn_tfog(other.origin);
	//	other.velocity_z += 64;
	t = find(world, targetname, self.target);
	if (!t)
		objerror("couldn't find target");

	// spawn a tfog flash in front of the destination
	makevectors(t.angles);
	org = t.origin + 0 * v_forward;

	spawn_tfog(org);
	spawn_tdeath(t.origin, other);
	// move the player and lock him down for a little while
	if (!other.health)
	{
		other.origin = t.origin;
		other.velocity = (v_forward *other.velocity_x) + (v_forward *other.velocity_y);
		return;
	}

	stuffcmd(other, "bf 1 1 1 1 2\n");
	msg_entity = other;
	WriteByte(MSG_ONE, SVC_SETVIEWANGLES);
	WriteAngle(MSG_ONE, 0);
	WriteAngle(MSG_ONE, t.angles_y);
	WriteAngle(MSG_ONE, 0);
	setorigin(other, t.origin);
	other.teleport_time = time + 0.7;

	if (other.flags &FL_ONGROUND)
		other.flags = other.flags - FL_ONGROUND;
	other.velocity = v_forward * 0;
	other.teleported_time = time + 0.7;

	other.flags = other.flags - other.flags &FL_ONGROUND;
};


void teleport_use() {
	self.nextthink = time + 0.2;
	force_retouch = 2;	// make sure even still objects get hit
	self.think = SUB_Null;
}


void teleporter_active() {
	self.model = "models/objects/teleporters/teleporter.md3";
	setmodel(self, self.model);	// set size and link into world
	setsize(self, '-16 -16 -32', '16 16 32');
	item_colormodcontroller_pulse_spawn(self);
	self.solid = SOLID_TRIGGER;
	if (self.target != "")
		self.touch = teleport_touch;
}
