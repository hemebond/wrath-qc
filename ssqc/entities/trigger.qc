entity s;
.float teleported_time;
float SPAWNFLAG_NOMESSAGE = 1;
float SPAWNFLAG_NOTOUCH = 1;
float PLAYER_ONLY = 1;
float SILENT = 2;
float PUSH_ONCE = 1;


void trigger_reactivate() {
	self.solid = SOLID_TRIGGER;
}


void multi_wait() {
	if (self.max_health) {
		self.health = self.max_health;
		self.takedamage = DAMAGE_YES;
		self.solid = SOLID_BBOX;
	}
}


void multi_trigger() {
	if (self.nextthink > time) {
		return;	// allready been triggered
	}

	if (self.classname == "trigger_secret") {
		if (self.enemy.classname != "player")
			return;
		found_secrets = found_secrets + 1;
		WriteByte(MSG_ALL, SVC_FOUNDSECRET);
		secrets_checkperfect(self.enemy);
	}

	if (self.noise != string_null)
		sound(self, CHAN_VOICE, self.noise, 1, ATTN_NORM);

	// don't trigger again until reset
	self.takedamage = DAMAGE_NO;

	activator = self.enemy;

	SUB_UseTargets();

	if (self.wait > 0) {
		self.think = multi_wait;
		self.nextthink = time + self.wait;
	}
	else {
		// we can't just remove (self) here, because this is a touch function
		// called wheil C code is looping through area links...
		if (self.respawnable)
		{
			self.wrathflags = FL_RESPAWN;
			self.oldtouch = multi_touch;
			self.touch = SUB_Null;
		}
		else
		{
			self.touch = SUB_Null;
			self.nextthink = time + 0.1;
			self.think = SUB_Remove;
		}
	}
}


void() multi_killed =
{
	self.enemy = damage_attacker;
	multi_trigger();
};

void multi_use() {
	if (self.using == -1) {
		self.using = 1;
		return;
	}

	if ((self.using == 1) && (self.disarmed)) {
		self.using = -1;
		return;
	}
	self.enemy = activator;
	multi_trigger();
}


.float player_weapon;
.float monstertouch;
void multi_touch() {
	if (self.using == -1)
		return;

	if ((self.player_weapon) && (!(other.items & self.player_weapon))) {
		return;
	}

	if (
		(
			(other.classname == "player") &&
			(other.flags & FL_CLIENT) &&
			(self.monstertouch != 2)
		) ||
		(
			(other.flags & FL_MONSTER) &&
			(other.health) &&
			(self.monstertouch >= 1)
		)
	) {
		// if the trigger has an angles field, check player's facing direction
		if (self.classname != "trigger_generic") {
			if (self.movedir != '0 0 0') {
				makevectors2(other.angles);
				if (v_forward *self.movedir < 0)
					return;	// not facing the right way
			}
		}

		self.enemy = other;
		multi_trigger();
	}
}


/*FGD
@SolidClass
	base(Target)
	color(0.5 0.0 0.5)
= trigger_multiple : "Variable sized trigger. Triggers multiple times. You must set the key `target` to the name of another object in the level that has a matching `targetname`. If notouch is set, the trigger is only fired by other entities, not by touching. Wait is always -1." [
	angle(float) : "Facing Direction" : : "if set, the trigger will only fire when someone is facing the direction of the angle, use `360` for angle 0."
	delay(float) : "Delay" : : "delay before firing (after being triggered)"
	disarmed(integer) : "Disarmed" : 0 : "It will not fire when player touch, if value = 1 trigger should to be activated"
	health(boolean) : "Shootable" : "0" : "Can be shot to activate"
	monstertouch(choices) : "Activable by monster" : 0 = [
		0 : "monsters will not touch it"
		1 : "monsters can touch and activate it"
		2 : "only monsters will touch and activate it"
	]
	player_weapon(choices) : "if player has this weapon, make this trigger active,0 = no required weapon" : 0 = [
		1 : "Coachgun"
		2 : "Shotgun"
		4 : "Fang Spitter"
		8 : "Retcher"
	]
	spawnflags(flags) = [
		1 : "No Touch" : 0 : "only triggered by other entities, not by touching"
	]
	wait(float) : "Trigger Wait" : "1" : "Number of seconds before trigger can be activated again."
]
*/
void trigger_multiple() {
	if (!self.wait)
		self.wait = -1;

	self.use = multi_use;

	InitTrigger();

	if (self.health) {
		if (self.spawnflags & SPAWNFLAG_NOTOUCH)
			objerror("health and notouch don't make sense\n");

		self.max_health = self.health;
		self.th_die = multi_killed;
		self.takedamage = DAMAGE_YES;
		self.solid = SOLID_BBOX;
		setorigin(self, self.origin);	// make sure it links into the world
	}
	else {
		if (!(self.spawnflags & SPAWNFLAG_NOTOUCH)) {
			self.touch = multi_touch;
		}
	}
}


/*FGD
@SolidClass
	base(Target)
	color(0.5 0.0 0.5)
= trigger_generic : "Variable sized trigger. Triggers multiple times. You must set the key `target` to the name of another object in the level that has a matching `targetname`. If notouch is set, the trigger is only fired by other entities, not by touching. Wait is always -1." [
	delay(float) : "Delay" : : "delay before firing (after being triggered)"
	disarmed(integer) : "Disarmed" : 0 : "it will not fire when player touch, if value = 1 trigger should to be activated"
	monstertouch(choices) : "Activable by monster" : 0 = [
		0 : "monsters will not touch it"
		1 : "monsters can touch and activate it"
	]
	player_weapon(choices) : "if player has this weapon, make this trigger active,0 = no required weapon" : 0 = [
		1 : "Revolver"
		2 : "Shotgun"
		4 : "Fang Spitter"
		8 : "Retcher"
		16 : "Cannon"
		32 : "Blade"
		64 : "Lance"
		128 : "Crystal"
		1024 : "Mace"
	]
	spawnflags(flags) = [
		1 : "No Touch" : 0 : "Only triggered by other entities, not by touching"
	]
	wait(float) : "Trigger Wait" : "-1" : "Number of seconds before trigger can be activated again. -1 removes after triggering."
]
*/
void trigger_generic() {
	if (!self.wait)
		self.wait = -1;
	self.use = multi_use;
	self.solid = SOLID_TRIGGER;
	setmodel(self, self.model);
	self.touch = multi_touch;
	self.modelindex = 0;
	self.model = string_null;
}


/*FGD
@SolidClass
	base(Target)
	color(0.5 0.0 0.5)
= trigger_once : "Variable sized trigger. Triggers once, then removes itself. You must set the key `target` to the name of another object in the level that has a matching `targetname`. If notouch is set, the trigger is only fired by other entities, not by touching. Wait is always -1." [
	angle(float) : "Facing Direction" : : "if set, the trigger will only fire when someone is facing the direction of the angle, use `360` for angle 0."
	delay(float) : "Delay" : : "delay before firing (after being triggered)"
	disarmed(integer) : "Disarmed" : 0 : "it will not fire when player touch, if value = 1 trigger should to be activated"
	health(boolean) : "Shootable" : "0" : "can be shot to activate"
	noise(string) : "Noise" : "" : "Sound to play when triggered."
	monstertouch(choices) : "Activable by monster" : 0 = [
		0 : "monsters will not touch it"
		1 : "monsters can touch and activate it"
		2 : "only monsters will touch and activate it"
	]
	player_weapon(choices) : "if player has this weapon, make this trigger active,0 = no required weapon" : 0 = [
		1 : "Revolver"
		2 : "Shotgun"
		4 : "Fang Spitter"
		8 : "Retcher"
		16 : "Cannon"
		32 : "Blade"
		64 : "Lance"
		128 : "Crystal"
		1024 : "Mace"
	]
	respawnable(boolean) : "Restart" : "0" : "Resets trigger so it can be triggered again upon level re-entry"
	sounds(integer) : "Message Sound" : 0 : "Set to 1 to use default centerprint sound. Otherwise uses noise property."
	spawnflags(flags) = [
		1 : "No Touch" : 0 : "only triggered by other entities, not by touching"
	]
]
*/
void trigger_once() {
	self.wait = -1;
	trigger_multiple();
	if (self.sounds == 1)
		self.noise = "misc/centerprint.ogg";
	if (self.noise != "")
		precache_sound(self.noise);
	if (self.respawnable)
		copy_old_data(self);
}


/*FGD
@PointClass
	color(0.5 0.0 0.5)
	size(-8 -8 -8, 8 8 8)
= trigger_relay : "This fixed size trigger cannot be touched, it can only be fired by other events." [
	killtarget(string) : "Remove Target" : : "removes target"
	target(target_destination) : "Target" : : "fires target when triggered"
	delay(float) : "Delay" : "delay before firing (after being triggered)"

	killtarget2(string) : "Remove Target" : : "removes target2"
	target2(target_destination) : "Target" : : "fires target2 when triggered"
	delay2(float) : "Delay" : "delay before firing target2 (after being triggered)"

	killtarget3(string) : "Remove Target" : : "removes target3"
	target3(target_destination) : "Target" : : "fires target3 when triggered"
	delay3(float) : "Delay" : "delay before firing target3 (after being triggered)"

	killtarget4(string) : "Remove Target" : : "removes target4"
	target4(target_destination) : "Target" : : "fires target4 when triggered"
	delay4(float) : "Delay" : "delay before firing target4 (after being triggered)"

	killtarget5(string) : "Remove Target" : : "removes target5"
	target5(target_destination) : "Target" : : "fires target5 when triggered"
	delay5(float) : "Delay" : "delay before firing target5 (after being triggered)"

	killtarget6(string) : "Remove Target" : : "removes target6"
	target6(target_destination) : "Target" : : "fires target6 when triggered"
	delay6(float) : "Delay" : "delay before firing target6 (after being triggered)"

	killtarget7(string) : "Remove Target" : : "removes target7"
	target7(target_destination) : "Target" : : "fires target7 when triggered"
	delay7(float) : "Delay" : "delay before firing target7 (after being triggered)"

	killtarget8(string) : "Remove Target" : : "removes target8"
	target8(target_destination) : "Target" : : "fires target8 when triggered"
	delay8(float) : "Delay" : "delay before firing target8 (after being triggered)"

	message(string) : "Message" : : "displayed when fired"
	spawnflags(flags) = [
		1 : "Use once"
	]
	targetname(target_source) : "Target Name" : :"The Relay will activate when another entity fires this name."
]
*/
void trigger_relay() {
	if (self.spawnflags & 1)
		self.use = trigger_relay_useonce;
	else
		self.use = SUB_UseTargets;
}

// Reki (August 21 2023): For relays you only want to fire once
void trigger_relay_useonce() {
	SUB_UseTargets();
	remove(self);
}


/*FGD
@PointClass base(Target, TargetName) color(1 0 1) size(-12 -12 -12, 12 12 12) = trigger_counter : "Acts as an intermediary for an action that takes multiple inputs. If nomessage is not set, it will print `1 more.. ` etc. when triggered and `sequence complete` when finished. After the counter has been triggered `count` times, it will fire all of its targets and remove itself. It's a once-only trigger (i.e. Wait is always -1)." [
    count(integer) : "Count" : 2 : "number of triggers needed to fire own target, default is 2"
]
*/
void trigger_counter() {
	self.wait = -1;

	if (!self.count)
		self.count = 2;

	self.use = counter_use;
}


void counter_use() {
	if ((self.origin == '-3032 -3292 -172') || (self.origin == '-3080-3292 -172') && (self.count > 3) && (skill == 0) && (world.model == "maps/e1m4.bsp"))
		self.count -= 3;

	self.count = self.count - 1;

	if(cvar("developer")) {
		centerprint(activator, strcat("trigger counter count", ftos(self.count), "\n"));
	}

	if (self.count < 0)
		return;

	if (self.count != 0)
		return;

	self.enemy = activator;
	multi_trigger();
}


//============================================================================


void JumpBack(entity e, entity b) {
	//
	// Push entity e (player) away from entity b (brush)
	//

	vector borg = (b.absmax + b.absmin) * 0.5;
	vector dir = normalize(borg - e.origin);

	e.stoptime = time + 0.5;
	e.lungefree = time + 0.5;
	e.hardstoptime = other.stoptime;

	if (!(e.flags & FL_IGNOREINPUT))
		e.flags += FL_IGNOREINPUT;

	if (e.flags & FL_ONGROUND)
		e.flags -= FL_ONGROUND;

	borg = (e.origin + borg) * 0.5;
	borg_z = e.origin_z + e.view_ofs_z;

	if (b.classname == "trigger_fly") {
		pointparticles(particleeffectnum("forcefieldflight"), borg , '0 0 0', 1);
		te_customflash(borg, 128, 1, '0.75 0.75 1');
	}

	if (b.classname == "trigger_wrath") {
		pointparticles(particleeffectnum("forcefieldwrath"), borg , '0 0 0', 1);
		te_customflash(borg, 128, 1, '1 0.75 0.75');
	}

	if (b.classname == "trigger_displacement") {
		pointparticles(particleeffectnum("forcefielddisplacement"), borg , '0 0 0', 1);
		te_customflash(borg, 128, 1, '0.5 0.5 0.25');
	}

	e.velocity = dir * - 256;
	e.velocity_z = 128;
}


void(entity e) turn_invisible_andnonsolid =
{
	self = e;
	self.effects = self.oldeffects;
	if(self.classname == "coffer")
		self.solid = 0;
	if(self.classname == "func_wall")
		self.solid = 0;
	if(self.classname == "func_door")
		self.solid = 0;
	if(self.classname == "object_switch")
	{
		self.usable = 0;
		self.solid = SOLID_BSP;
	}


	if(self.think)
	{
		self.think = self.oldthink;
		if((self.classname == "func_wall")||(self.classname == "func_door"))
			self.nextthink = self.ltime;
		else
			self.nextthink = time;
	}
};

void(entity e) turn_visible_andsolid =
{
	self = e;
	if(self.effects & EF_NODRAW)
	{
		self.oldeffects = self.effects;
		if(self.displacement == -1)
			self.effects = 0;
		else
			self.effects = 512; // 0
		self.colormod = '4 1 3';
		self.alpha = 0.5;
	}

	if((self.classname == "monster_incisor") && (self.alpha != 1))
		self.alpha = 1;
	if(self.classname == "coffer")
		self.solid = SOLID_BSP;
	if(self.classname == "func_wall")
		self.solid = SOLID_BSP;
	if(self.classname == "func_door")
		self.solid = SOLID_BSP;
	if(self.classname == "object_switch")
	{
		self.usable = 1;
		self.solid = SOLID_BSP;
	}
	if(self.classname == "nonsolidswitch")
	{
		self.alpha = 1;
		self.usable = 1;
		self.solid = SOLID_TRIGGER;
	}

	if(self.think)
	{
		self.think = self.oldthink;

		if(self.classname == "func_door")
			self.nextthink = self.ltime;
		else
			self.nextthink = time;
	}
};

void toggle_displacement(float type) {
	entity invisible = nextent(world);
	while (invisible) {
		entity holder = nextent(invisible);
		if (invisible.oldclassname == "monster_incisor") {
			if(type == 1)
			{
				invisible.color = '0.225 0.237 1.3';
				invisible.light_lev = 92;
				invisible.pflags = 129;
				invisible.colormod = '4 1 4';
				invisible.effects = 512;
			}
			else
			{

				invisible.pflags = 0;
				invisible.colormod = '1 1 1';
				invisible.effects = 0;
			}
		}
		if (invisible.wrathflags & FL_INVISIBLE) {
			if(invisible.think)
				invisible.oldthink = invisible.think;
			else
				invisible.oldthink = SUB_Null;

			if(invisible.classname == "spleetcyst")
				invisible.lifetime = 0;

			entity oself = self;
			self =  invisible;

			if (self.displacement == -1) {
				if (type != 1)
					turn_visible_andsolid(self);
				else
					turn_invisible_andnonsolid(self);
			}
			else {
				if (type == 1)
					turn_visible_andsolid(self);
				else
					turn_invisible_andnonsolid(self);
			}

			self = oself;
		}

		invisible = holder;
	}
	if(type == 1)
    	stuffcmd (single_player, "bf 1 0.7 0.7 1.05 1\n");
}


//============================================================================


void pointlight_d() {
	// This function does nothing, but is referenced in e2m5
	return;
}


//============================================================================

.float angle_deviance;
.float minorangle;
.float subangle;
.float temp_turret;
.float trigger_angle_use;
.float turret;
.float turret_enemy_visible;
.float turret_time;
.float turretable;
.string classtype;
.vector subangles;

void() trigger_turret_touch =
{
	if (!(other.flags & FL_MONSTER))
		return;

	if(!other.turretable)
		return;

	if(!other.trigger_angle_use)
		return;

	if(other.turret_time > time)
		return;

	if(other.warped_time > time)
		return;

	if(self.turret_enemy_visible)
	{
		local entity oself;
		oself = self;
		self = other;
		if (!(visible(self.enemy)))
			return;
		self = oself;
	}

	if((!other.takedamage) && (other.classentity == "monsters"))
		other.takedamage = DAMAGE_AIM;

	if((self.target)||(self.turret_enemy_visible))
	{
		if(self.target != "")
		{
			other.minorangle =( (-1 * self.angle_deviance) + 180 )* (2/360);
			determine_subangle();
			other.subangle = self.enemy.angles_y;
			other.subangles_y = other.subangle;
		}
		else
			other.minorangle = -1;
		other.temp_turret = 1;
	}

	if (other.turret != 1)
	{
		other.turret_time = time + 2.5;
		other.turret = 1;
		if(self.turret_enemy_visible)
			other.turret_enemy_visible = 1;
		if(other.classname == "monster_stricken")
			other.th_run = stricken_preattack1;
		if(other.classname == "monster_invader")
			other.th_run = invader_preattack;
		if(self.classname == "monster_afflicted")
			other.th_run = afflicted_atk1;
		if(self.classname == "monster_wretch")
			other.th_run = wretch_attacka1;
		if(self.classname == "monster_oppressor")
			other.th_run = oppressor_attacka1;
		other.think = other.th_missile;
		other.nextthink = time;
	}
};


/*FGD
@SolidClass color(0.5 0.0 0.5) = trigger_turret : "Turn some monsters into turrets." [
	turret_enemy_visible(float) : "Enemy is Visible" : "0" : "Turret model will be avaible only when player is visible"
	angle_deviance(float) : "Angle deviance" : "90" : "range of angles at which the monster will behave as a turret (this is both a positive and negative value, default is 90)"
	target(target_destination) : "Target" : : "if present target info_angle to set y angles"
]
*/
void() trigger_turret =
{
	self.touch = trigger_turret_touch;
	if(!self.angle_deviance)
		self.angle_deviance = 90;

	if(self.angle_deviance > 180)
		self.angle_deviance =180;
	self.angle_deviance = self.angle_deviance * 2;
	self.solid = SOLID_TRIGGER;
	setmodel(self, self.model);
	self.modelindex = 0;
	self.model = string_null;
};
//============================================================================
.float kill_player;
.float only_to_player;

void() hurt_on =
{
	self.solid = SOLID_TRIGGER;
	self.nextthink = -1;
};
.float punch_time;
.float allowoverlap;


void() SUB_Die =
{
	randompointsound(self.origin,"impact/gibs/gib_explo", 3, random(0.7,1));
	randompointsound(self.origin,"impact/gibs/gib_hit", 3, random(0.3,1));
	explo_blood(2, self.origin+ randomvector('-7 -7 7','7 7 7'));
	explo_blood(9, self.origin+ randomvector('-7 -7 7','7 7 7'));
	pointparticles(particleeffectnum("wretch_bloodshower"), self.origin , '0 0 0', 1);
	sound(self, CHAN_BODY, "misc/null.wav", 0, 1);
	sound(self, CHAN_ITEM, "misc/null.wav", 0, 1);
	sound(self, CHAN_WEAPON, "misc/null.wav",0, 1);
	sound(self, CHAN_VOICE, "misc/null.wav", 0, 1);
	sound(self, CHAN_ITEM, "misc/null.wav", 0, 1);
	sound(self, CHAN_FOOT, "misc/null.wav", 0, 1);
	remove(self);
};
void() hurt_touch =
{
	if((other.allowoverlap > time) && (self.allowoverlap == 1))
		return;
	if ((other.takedamage) && (self.using ==  1))
	{
		if((self.kill_player == 1) && (other.classname == "player") && (other.health >0) &&(!(other.flags &FL_GODMODE)))
		{
			other.health = -100;
			entity oself = self;
			entity oldother = other;

			self = other;
			Killed(self, oself, 1);
			self = oself;
			other = oldother;

			if(!(self.spawnflags & 1))
			{
				playersound7("impact/gibs/gib_explo", 3, random(80,100));
				playersound7("impact/gibs/gib_hit", 6, random(80,120));
				makevectors (other.v_angle);
				vector tagorg = other.origin  + v_forward * 32 + v_up * -32;
				pointparticles(particleeffectnum("wretch_bloodshower"), tagorg , '0 0 0', 1);
				explo_blood(2, tagorg+ randomvector('-24 -24 24','24 24 24'));
				explo_blood(9, tagorg+ randomvector('-24 -24 24','24 24 24'));
				pointparticles(particleeffectnum("wretch_bloodshower"), tagorg , '0 0 0', 1);
				ThrowGib3(self, "models/gibs/gib_small.md3", 0, 0.75, 1, 2, tagorg + randomvector('-24 -24 24','24 24 24'), relvel('12 12 -24', self), 0, 3);	// relvel: forward, right, up
				ThrowGib3(self, "models/gibs/gib_small.md3", 0, 0.75, 1, 2, tagorg+ randomvector('-24 -24 24','24 24 24'), relvel('32 -12 -32', self), 0, 3);	// relvel: forward, right, up
				ThrowGib3(self, "models/gibs/gib_med.md3", 0, 0.75, 1, 2, tagorg+ randomvector('-24 -24 24','24 24 24'), relvel('48 12 -12', self), 0, 3);	// relvel: forward, right, up
				ThrowGib3(self, "models/gibs/gib_med.md3", 0, 0.75, 1, 2, tagorg+ randomvector('-24 -24 24','24 24 24'), relvel('24 -12 -24', self), 0, 3);	// relvel: forward, right, up
				ThrowGib3(self, "models/gibs/gib_large.md3", 0, 0.75, 1, 2, tagorg+ randomvector('-24 -24 24','24 24 24'), relvel('24 12 -24', self), 0, 3);	// relvel: forward, right, up
				ThrowGib3(self, "models/gibs/gib_large.md3", 0, 0.75, 1, 2, tagorg+ randomvector('-24 -24 24','24 24 24'), relvel('42 12 -12', self), 0, 3);	// relvel: forward, right, up
			}
		}
		if((self.kill_player == 1) && (other.flags & FL_MONSTER)&& !(other.wrathflags & FL_CRYSTAL))
		{

			if((other.th_die) && (other.voided != 1))
			{

				other.th_die = SUB_Die;
				other.voided = 1;
				Killed(other,self,0);
				return;
			}

		}

		if((self.only_to_player ==  1)&& (other.classname == "player"))
			T_Damage (other, self, self, self.dmg);
		else
			T_Damage (other, self, self, self.dmg);

		float active_punchangle = cvar ("cl_punch");
		if((active_punchangle == 1) && (self.punch_time < time))
		{
			self.punch_time = time + 0.25;
			if(self.cnt == 1)
			{
			other.punchangle_x = self.dmg * -0.25;
			self.cnt = 0;
			}
			else
			{
			other.punchangle_x = self.dmg * 0.25;
			self.cnt = 1;
			}
		}

		self.solid = SOLID_NOT;
		if(self.allowoverlap == 1)
			other.allowoverlap = time + self.wait;

		if(self.wait > 0)
		{
			self.think = hurt_on;
			self.nextthink = time + self.wait;
		}
		else
			remove(self);


	}

	return;
};


/*FGD
@SolidClass
	base(TargetName)
	color(0.5 0.0 0.5)
= trigger_hurt : "Any object touching this will be hurt." [
	allowoverlap(boolean) : "Overlap" : "0" : "If set to 1, allows overlapping triggers to act as a single trigger"
	dmg(float) : "Damage Inflicted" : "5" : "sets damage, default is 5"
	kill_player(boolean) : "Kill Player" : "0" : "Trigger will kill Player"
	message(string) : "Message" : : "message text"
	only_to_player(boolean) : "Damage only to Player" : "0" : "Trigger will hurt only Player"
	wait(float) : "Return Delay" : "1" : "Number of seconds before trigger will hurt again (default 1, -1 = never do damage again)"
]
*/
void trigger_hurt() {
	if(!self.wait)
		self.wait = 1;
	InitTrigger();
	self.touch = hurt_touch;
	if (!self.dmg)
		self.dmg = 5;
	if (!self.using)
		self.using = 1;
	self.use = toggle_use;
}

void trigger_artifact_checker_think() {
	SUB_UseTargets();
	remove(self);
}


/*FGD
@PointClass color(0.5 0.0 0.5) size(-8 -8 -8, 8 8 8) = trigger_artifact_checker : "This fixed size trigger cannot be touched, it can only be fired by other events." [
	target(target_destination) : "Target" : : "fires target when player uses selected artifact"
	type(choices) : "" : "1" : "Artifact used by player that will trigger the entity" = [
		1 : "Mark Revelation"
		2 : "Drowner App"
		3 : "Berseker"
		4 : "Attar"
		5 : "Black Grenade"
		6 : "Life Siphon"
		7 : "Trinket of Respite"
		8 : "Cruel Aegis"
		9 : "Vicious Idol"
		10 : "Ring of Fire"
	]
]
*/
void() trigger_artifact_checker =
{
	setmodel(self,"");
};

void() trigger_soultether_checker_think =
{
	activator = self.owner; // whoever triggered it is self.owner
	SUB_UseTargets();
	remove(self);
}
void() trigger_soultether_checker =
{
	setmodel(self, "");
};


/*
void info_achievement_use()
{
	for(float i = 0; i < ST_ACHIEVEMENTS::MAX; i++)
	{
		steamachievement_t ach = steam_achievementlist[i];
		if (strtoupper(ach.name) != strtoupper(self.message))
			continue;

		Steam_AchievementUnlock(world, i);
		return;
	}

	objerror("info_achievement: bad achievement name");
}*/

void spawnfunc_info_achievement()
{
	remove(self);
	return;

	// if (!self.message)
	// {
	// 	remove(self);
	// 	return;
	// }

	// self.use = info_achievement_use;
}

/*
void info_achievement_gamecomplete_use()
{
	float ach[] = {ST_ACHIEVEMENTS::SP_FEAT_EASY, ST_ACHIEVEMENTS::SP_FEAT_EASY, ST_ACHIEVEMENTS::SP_FEAT_EASY, ST_ACHIEVEMENTS::SP_FEAT_OUTLANDER};
	float skill_level = bound(0, skill, ach.length - 1);
	Steam_AchievementUnlock(world, ach[skill_level]);

	WriteByte(MSG_ALL, SVC_TEMPENTITY);
	WriteByte(MSG_ALL, TEMPENT::OUTLANDER_UNLOCK);
}

void spawnfunc_info_achievement_gamecomplete()
{
	self.use = info_achievement_gamecomplete_use;
}
*/

void info_endscreen_use(void)
{
	entity lst = world;
	while((lst = findflags(lst, flags, FL_CLIENT)))
	{
		lst.r_endscreen = time;
	}
}

void spawnfunc_info_endscreen(void)
{
	self.use = info_endscreen_use;
}


void info_achievement_boss1_use()
{
	if (self.cnt == 0) // begin challenge
	{
		achievement_takendamage = FALSE;
	}
	else // conclude challenge and evaluate
	{
		if (!achievement_takendamage) // if we haven't taken any damage, give the 'cheevo
		{
			// Steam_AchievementUnlock(world, ST_ACHIEVEMENTS::SP_FEAT_BOSS1);
		}
	}
}
void spawnfunc_info_achievement_boss1_start() { self.cnt = 0; self.use = info_achievement_boss1_use; }
void spawnfunc_info_achievement_boss1_end() { self.cnt = 1; self.use = info_achievement_boss1_use; }

void info_achievement_boss2_use()
{
	if (self.cnt == 0) // begin challenge
	{
		achievement_boss_starttime = time;
	}
	else // conclude challenge and evaluate
	{
		if ((time - achievement_boss_starttime) <= 180 && achievement_boss_starttime) // if it's been less than 3 minutes since we activated, go!
		{
			// Steam_AchievementUnlock(world, ST_ACHIEVEMENTS::SP_FEAT_BOSS2);
		}
	}
}
void spawnfunc_info_achievement_boss2_start() { self.cnt = 0; self.use = info_achievement_boss2_use; }
void spawnfunc_info_achievement_boss2_end() { self.cnt = 1; self.use = info_achievement_boss2_use; }

void info_achievement_boss3_use()
{
	if (self.cnt == 0) // begin challenge
	{
		achievement_onlybladeandmace = TRUE;
	}
	else // conclude challenge and evaluate
	{
		if (achievement_onlybladeandmace) // if we haven't fired any weapons besides mace and blade, earn the challenge
		{
			// Steam_AchievementUnlock(world, ST_ACHIEVEMENTS::SP_FEAT_BOSS3);
		}
	}
}
void spawnfunc_info_achievement_boss3_start() { self.cnt = 0; self.use = info_achievement_boss3_use; }
void spawnfunc_info_achievement_boss3_end() { self.cnt = 1; self.use = info_achievement_boss3_use; }
