/*FGD
@SolidClass
	base(TargetName)
	color(0 0.5 0.8)
= func_bobbing : "Solid entity that oscillates back and forth in a linear motion. By default, it will have an amount of displacement in either direction equal to the dimension of the brush in the axis in which it's bobbing. Entity bobs on the Z axis (up-down) by default. It can also emit sound if the `noise` key is set. Will crush the player when blocked." [
	color(vector) : "Model Light Color" : "1 1 1" : "constantLight color of .md3 model included with entity. Has no effect on the entity's brushes (default 1 1 1)."
	height(integer) : "Vertical Travel" : 32 : "sets the amount of travel of the oscillation movement (default 32)."
	light(float) : "Model Light Intensity" : "0" : "constantLight radius of .md3 model included with entity. Has no effect on the entity's brushes (default 0)."
	model2(string) : "Model File" : : "path/name of model to include (eg: models/mapobjects/jets/jets01.md3)."
	noise(string) : "Sound File" : : "path/name of .wav file to play. Use looping sounds only (eg. sound/world/drone6.wav - See Notes)."
	origin(vector) : "World Origin" : : "alternate method of setting XYZ origin of sound and .md3 model included with entity (See Notes)."
	phase(float) : "Bob Cycle Phase" : "0" : "sets the start offset of the oscillation cycle. Values must be 0 &lt; phase &lt; 1. Any integer phase value is the same as no offset (default 0)."
	spawnflags(flags) = [
		1 : "X Axis" : 0 : "entity will bob along the X axis."
		2 : "Y Axis" : 0 : "entity will bob along the Y axis."
	]
	speed(float) : "Bob Cycle Time" : "16" : "amount of time in seconds for one complete oscillation cycle."
	//-------- NOTES --------
	//In order for the sound to be emitted from the entity, it is recommended to include a brush with an origin shader at its center, otherwise the sound will not follow the entity as it moves. Setting the origin key is simply an alternate method to using an origin brush. When using the model2 key, the origin point of the model will correspond to the origin point defined by either the origin brush or the origin coordinate value.
	//
	//Target this entity with a misc_model to have the model attached to the entity (set the model's "target" key to the same value as this entity's "targetname").
]
*/

.float height;
.float phase;

void func_bobbing() {
	if (!self.speed)
		self.speed = 16;

	if (!self.height)
		self.height = 32;

	// center of bobbing motion
	self.oldorigin = self.origin;

	// time scale to get degrees
	self.cnt = 360 / self.speed;

	// how far to bob
	SetMovedir();
	self.movedir = self.movedir * self.height;

	self.solid = SOLID_BSP;
	self.movetype = MOVETYPE_PUSH;

	setmodel(self, self.model);
	setsize(self, self.mins, self.maxs);
	setorigin(self, self.origin);

	// The problem with playing a sound here is that any player
	// not in the make when it starts will never hear it
	// Needs to be either an ambient sound (which can't move), a
	// CSQC solution, or a short looping sound that can be emitted
	// every few seconds
	if (self.noise != "") {
		precache_sound(self.noise);
		// sound(self, CHAN_VOICE, self.noise, 1, 1);  // FIXME: This doesn't work. No sound plays.
	}

	// wait for targets to spawn
	entity controller = spawn();
	controller.classname = "func_bobbing_controller";
	controller.owner = self;
	controller.nextthink = time + 1;
	controller.think = func_bobbing_controller_think;
	self.nextthink = self.ltime + 999999999;
	self.think = SUB_Null;

	self.effects |= EF_LOWPRECISION;
}


void func_bobbing_controller_think() {
	self.nextthink = time + 0.05;

	// calculate sinewave using makevectors
	makevectors((time * self.owner.cnt + self.owner.phase) * '0 1 0');
	vector v = self.owner.oldorigin + self.owner.movedir * v_forward_y;

	// * 10 so it will arrive in 0.1 sec
	self.owner.velocity = (v - self.owner.origin) * 10;
}
