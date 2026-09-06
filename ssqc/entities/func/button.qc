void() button_wait;
void() button_return;

void() button_wait = { self.state = STATE_TOP;
	self.nextthink = self.ltime + self.wait;
	self.think = button_return;
	activator = self.enemy;
	self.glowmod = '-1 -1 -1';
	SUB_UseTargets();
	self.frame = 1;	// use alternate textures
	self.usable = 0;
};

void() button_done = { self.state = STATE_BOTTOM;
	self.glowmod = '1 1 1';
	self.usable = 1;
};

void() button_return = { self.state = STATE_DOWN;
	SUB_CalcMove(self.pos1, self.speed, button_done);
	self.frame = 0;	// use normal textures
	self.usable = 0;
};

void() button_fire = { if (self.state == STATE_UP || self.state == STATE_TOP)
	{
		button_return();
		return;
	}

	sound(self, CHAN_VOICE, self.noise, 1, ATTN_NORM);
	self.state = STATE_UP;
	self.usable = 0;
	SUB_CalcMove(self.pos2, self.speed, button_wait);
};


void button_use() {
	self.enemy = activator;
	button_fire();
}


void() buttonbbox_use = { self.owner.enemy = activator;
	self.owner.think = button_fire;
	self.owner.nextthink = self.ltime;
}

void() bboxbutton_think = { self.usable = self.owner.usable;
	self.think = bboxbutton_think;
	self.nextthink = trace_ent.ltime + 0.01;

};


/*FGD
@SolidClass
	base(Target)
	color(0 .4 1)
= func_button : "When a button is touched by a player, it moves in the direction set by the `angle` key, triggers all its targets, stays pressed by an amount of time set by the `wait` key, then returns to it's original position where it can be operated again." [
	angle(float) : "Direction" : "0" : "Determines the direction in which the button will move (up = -1, down = -2)."
	targetname(target_source) : "Target Name" : "" : "If set, other entities can be used to activate the button along with touch or damage way of doing that."
	speed(float) : "Move Speed" : "50" : "Speed of button's displacement."
	wait(float) : "Return Delay" : "1" : "Number of seconds button stays pressed (default 1, -1 = no return)."
	lip(float) : "Lip" : "4" : "Lip remaining at end of move."
	buttondecal(integer) : "Decal Button" : 0 : "Set to 1 to add extra volume if the brush is a decal."
]
*/

void func_button() {
	precache_sound(self.noise);

	if (!self.speed)
		self.speed = 50;

	self.glowmod = '1 1 1';

	if (!self.wait)
		self.wait = 1;

	if (!self.lip)
		self.lip = 4;

	SetMovedir();
	self.usable = 1;
	self.movetype = MOVETYPE_PUSH;
	self.solid = SOLID_BSP;
	setmodel(self, self.model);

	if (self.buttondecal == 1) {
		self.solid = SOLID_NOT;
		self.usable = 0;

		entity newbbox = spawn();
		newbbox.owner = self;
		newbbox.buttondecal = 1;
		newbbox.usable = 1;
		newbbox.solid = SOLID_BBOX;
		setsize(newbbox, (self.absmin - ('1 1 1')), (self.absmax + ('1 1 1')));
		newbbox.use = buttonbbox_use;
	}

	self.use = button_use;
	self.state = STATE_BOTTOM;
	self.pos1 = self.origin;
	self.pos2 = self.pos1 + self.movedir *(fabs(self.movedir *self.size) - self.lip);
}
