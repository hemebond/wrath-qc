/*FGD
@SolidClass
	color(0 .5 .8)
= func_wall : "This is just a solid wall if not inhibitted." [
	displacement(integer) : "Displacement Wall" : 0 : "Set to 1 and brush will be non solid and invisible until a trigger_displacement is used."
	wait(float) : "Wait" : 1 : ""
	spawnflags(flags) = [
		1 : "Start Off"
		2 : "Glowmod"
	]
]
*/
// FIXME: The glowmod stuff seems broken, does nothing
.vector nextglowmod;
.vector oldglowmod;

void func_wall() {
	self.movetype = MOVETYPE_PUSH;
	self.solid = SOLID_BSP;

	if (self.spawnflags & 1) {
		self.effects += EF_NODRAW;
		self.solid = 0;
		self.use = func_wall_use;
	}

	if (self.spawnflags & 2) {
		if (!self.glowmod)
			self.glowmod = '1 1 1';

		if (!self.nextglowmod)
			self.nextglowmod = '0 0 0';

		if (!self.wait)
			self.wait = 1;

		self.oldglowmod = self.glowmod;

		self.use = func_wall_use_glowmod;
		self.displacement = 0;
	}

	if (self.displacement == 1) {
		self.movetype = 0;
		self.wrathflags += FL_INVISIBLE;
		self.effects = EF_NODRAW;
		self.solid = 0;
	}

	if (self.displacement == -1) {
		self.wrathflags += FL_INVISIBLE;
		self.oldeffects = EF_NODRAW;
	}
	setmodel(self, self.model);
}


void func_wall_use() {
	if (self.spawnflags & 1) {
		self.effects = 0;
		self.solid = SOLID_BSP;
	}

	self.use = SUB_Null;
}


void func_wall_use_glowmod() {
	float glowsteps = self.wait / 0.05;

	float xdif = (self.oldglowmod_x - self.nextglowmod_x) / glowsteps * -1;
	float ydif = (self.oldglowmod_y - self.nextglowmod_y) / glowsteps * -1;
	float zdif = (self.oldglowmod_z - self.nextglowmod_z) / glowsteps * -1;

	self.cnt ++;

	if (self.cnt <= glowsteps) {
		self.glowmod_x += xdif;
		self.glowmod_y += ydif;
		self.glowmod_z += zdif;
		self.think = func_wall_use_glowmod;

	}
	else {
		self.think = SUB_Null;
	}

	if (self.glowmod_x <= 0)
		self.glowmod_x = -1;

	if (self.glowmod_y <= 0)
		self.glowmod_y = -1;

	if (self.glowmod_z <= 0)
		self.glowmod_z = -1;

	self.nextthink = self.ltime + 0.05;
}
