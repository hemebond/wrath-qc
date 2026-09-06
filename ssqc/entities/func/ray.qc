/*FGD
@SolidClass
	base(TargetName)
	color(.8 .1 1)
= func_ray : "An object that fades in and out when triggered" [
	valpha(color1) : "Alpha Fades" : "0.01 0.75 1" : "Floating-point vector used to define fading in of object: start alpha, end alpha, and time taken to transition."
	spawnflags(flags) = [
		1 : "Start Off"
		2 : "No effects?"
		512 : "Unknown"
	]
]
*/
// FIXME: What is this for?
.vector valpha; //<min_alpha> <max_alpha> <fade_rate> (phade starts when lifetime is 0)

void func_ray() {
	self.solid = 0;

	if (!(self.valpha))
		self.valpha = '0.01 0.75 1';

	if (self.valpha_x <= 0)
		self.valpha_x = 0.01;


	if (self.spawnflags & 1) {
		self.effects = EF_NODRAW;
		self.use = func_ray_toggle_on;
		self.alpha = self.valpha_x;
	}
	else {
		self.effects = EF_FULLBRIGHT;
		self.use = func_ray_toggle_off;
		self.alpha = self.valpha_y;
	}

	if (self.spawnflags & 2) {
		self.effects = 0;
	}

	ray_colormodcontroller_pulse_spawn(self);
	setmodel(self, self.model);
}


void func_ray_thinkoff() {
	if (self.alpha > self.valpha_x) {
		self.alpha -= (self.valpha_z / 20);
	}
	else {
		self.use = func_ray_toggle_on;
		self.effects = EF_NODRAW;
		self.think = SUB_Null;
		self.nextthink = time + 0.05;
		return;
	}
	self.think = func_ray_thinkoff;
	self.nextthink = time + 0.05;
}


void func_ray_toggle_off() {
	self.think = func_ray_thinkoff;
	self.nextthink = time + 0.05;
}


void func_ray_think() {
	if (self.alpha < self.valpha_y) {
		self.alpha += (self.valpha_z / 20);
	}
	else {
		self.alpha = self.valpha_y;
		self.use = func_ray_toggle_off;
		self.think = SUB_Null;
		self.nextthink = time + 0.05;
		return;
	}
	self.think = func_ray_think;
	self.nextthink = time + 0.05;
}


void func_ray_toggle_on() {
	self.effects = EF_FULLBRIGHT;
	self.alpha = self.valpha_x;
	self.think = func_ray_think;
	self.nextthink = time + 0.05;
}


void ray_colormodcontroller_pulse_think() {
	float maxcolormod;
	float mincolormod;

	if (self.owner.spawnflags & 1) {
		maxcolormod = 1.5;
		mincolormod = 0.5;
	}

	if (self.owner.spawnflags & 2) {
		maxcolormod = 2;
		mincolormod = 1;
	}

	if (self.owner.effects == 512) {
		if (self.cnt == 1)
		{
			if (self.owner.colormod_x >= maxcolormod)
				self.cnt = 0;
			else
				self.owner.colormod_x += random(0.025, 0.05);
		}
		else
		{
			if (self.owner.colormod_x <= mincolormod)
				self.cnt = 1;
			else
				self.owner.colormod_x -= random(0.025, 0.05);
		}
		self.owner.colormod_y = self.owner.colormod_x;
		self.owner.colormod_z = self.owner.colormod_x;
		self.owner.glowmod_x = 2 - self.owner.colormod_x;
		self.owner.glowmod_y = 2 - self.owner.colormod_x;
		self.owner.glowmod_z = 2 - self.owner.colormod_x;
	}

	self.think = ray_colormodcontroller_pulse_think;
	self.nextthink = time + 0.05;
}


void ray_colormodcontroller_pulse_spawn(entity e) {
	entity colormod_controller = spawn();
	colormod_controller.owner = e;
	colormod_controller.owner.colormod = '1 1 1';
	colormod_controller.think = ray_colormodcontroller_pulse_think;
	colormod_controller.nextthink = time;

	e.wrathflags += FL_MISCCONTROLLER;
	e.pipes = colormod_controller;
}
