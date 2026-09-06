
void() plat_center_touch;
void() plat_outside_touch;
void() plat_trigger_use;
void() plat_go_up;
void() plat_go_down;
void() plat_crush;
float PLAT_LOW_TRIGGER = 1;

void() plat_spawn_inside_trigger =
{
	local entity	trigger;
	local vector	tmin, tmax;

//
// middle trigger
//	
	trigger = spawn();
	trigger.touch = plat_center_touch;
	trigger.movetype = MOVETYPE_NONE;
	trigger.solid = SOLID_TRIGGER;
	trigger.enemy = self;
	
	tmin = self.mins + '25 25 0';
	tmax = self.maxs - '25 25 -8';
	tmin_z = tmax_z - (self.pos1_z - self.pos2_z + 8);
	if (self.spawnflags & PLAT_LOW_TRIGGER)
		tmax_z = tmin_z + 8;
	
	if (self.size_x <= 50)
	{
		tmin_x = (self.mins_x + self.maxs_x) / 2;
		tmax_x = tmin_x + 1;
	}
	if (self.size_y <= 50)
	{
		tmin_y = (self.mins_y + self.maxs_y) / 2;
		tmax_y = tmin_y + 1;
	}
	
	setsize (trigger, tmin, tmax);
};

void() plat_hit_top =
{
	sound (self, CHAN_VOICE, self.noise2, self.volume, self.rad_sound);
	self.state = STATE_TOP;
	self.think = plat_go_down;
	self.nextthink = self.ltime + 3;
};

void() plat_hit_bottom =
{
	sound (self, CHAN_VOICE, self.noise2, self.volume, self.rad_sound);
	self.state = STATE_BOTTOM;
};

void() plat_go_down =
{
	sound (self, CHAN_AUTO, self.noise, self.volume, self.rad_sound);
	sound (self, CHAN_VOICE, self.noise1, self.volume, self.rad_sound);
	self.state = STATE_DOWN;
	SUB_CalcMove (self.pos2, self.speed, plat_hit_bottom);
};

void() plat_go_up =
{
	sound (self, CHAN_AUTO, self.noise, self.volume, self.rad_sound);
	sound (self, CHAN_VOICE, self.noise1, self.volume, self.rad_sound);
	self.state = STATE_UP;
	SUB_CalcMove (self.pos1, self.speed, plat_hit_top);
};

void() plat_center_touch =
{
	if (other.classname != "player")
		return;
		
	if (other.health <= 0)
		return;

	self = self.enemy;
	if (self.state == STATE_BOTTOM)
		plat_go_up ();
	else if (self.state == STATE_TOP)
		self.nextthink = self.ltime + 1;	// delay going down
};

void() plat_outside_touch =
{
	if (other.classname != "player")
		return;

	if (other.health <= 0)
		return;
		
//dprint ("plat_outside_touch\n");
	self = self.enemy;
	if (self.state == STATE_TOP)
		plat_go_down ();
};

void() plat_trigger_use =
{
	if (self.think)
		return;		// allready activated
	plat_go_down();
};


void() plat_crush =
{
//dprint ("plat_crush\n");

	T_Damage (other, self, self, 1);
	
	if (self.state == STATE_UP)
		plat_go_down ();
	else if (self.state == STATE_DOWN)
		plat_go_up ();
	else
		objerror ("plat_crush: bad self.state\n");
};

void() plat_use =
{
	self.use = SUB_Null;
	if (self.state != STATE_UP)
		objerror ("plat_use: not in up state");
	plat_go_down();
};


/*FGD
@SolidClass
	color(0 .4 1)
= func_plat : "Rising platform the player can ride to reach higher places. Plats must always be drawn in the raised position, so they will operate and be lighted correctly but they spawn in the lowered position. The plat will stay in the raised position until the player steps off. There are no proper sounds for this entity, only beep noises. It will spawn in the game and work properly but it sounds silly (see notes)." [
	dmg(integer) : "Damage Inflicted" : 4 : "Damage to inflict on player when he blocks operation of plat (default 4). Plat will reverse direction when blocked."
	height(float) : "Vertical Travel" : : "If set, this will determine the total amount of vertical travel of the plat."
	lip(float) : "Lip" : "16" : "Lip remaining at end of move (default 16). Has no effect if `height` is set."
	noise(string) : "start sound 1" : "" : "sound to play"
	noise1(string) : "working sound 2" : "" : "sound to play"
	noise2(string) : "stop sound 3" : "" : "sound to play"
	rad_sound(float) : "Sound Radius" : "256" : "Radius of sounds."
	speed(float) : "Move Speed" : "150" : "Determines how fast the plat moves (default 150)."
	targetname(target_source) : "Target Name" : "" : "If set, the trigger that points to this will raise the plat each time it fires. The plat raises and comes back down a second later if no player is on it."
	volume(float) : "Sound Volume" : "1" : "Volume of sounds."
]
*/
void() func_plat =
{
	if (!self.t_length)
		self.t_length = 80;
	if (!self.t_width)
		self.t_width = 10;

	if(self.noise != "")
	precache_sound (self.noise);
	if(self.noise1 != "")
	precache_sound (self.noise1);
	if(self.noise2 != "")
	precache_sound (self.noise2);
    if(!self.rad_sound)
        self.rad_sound = 1024;

    float attn = 512 / self.rad_sound;
    self.rad_sound = attn;

    if(!self.volume)
        self.volume = 1;

	self.mangle = self.angles;
	self.angles = '0 0 0';

	self.classname = "plat";
	self.solid = SOLID_BSP;
	self.movetype = MOVETYPE_PUSH;
	setorigin (self, self.origin);	
	setmodel (self, self.model);
	setsize (self, self.mins , self.maxs);

	self.blocked = plat_crush;
	if (!self.speed)
		self.speed = 150;

// pos1 is the top position, pos2 is the bottom
	self.pos1 = self.origin;
	self.pos2 = self.origin;
	if (self.height)
		self.pos2_z = self.origin_z - self.height;
	else
		self.pos2_z = self.origin_z - self.size_z + 8;

	self.pos2_z += self.lip;

	self.use = plat_trigger_use;

	plat_spawn_inside_trigger ();	// the "start moving" trigger	

	if (self.targetname != "")
	{
		self.state = STATE_UP;
		self.use = plat_use;
	}
	else
	{
		setorigin (self, self.pos2);
		self.state = STATE_BOTTOM;
	}
};

