/*FGD
@SolidClass = func_flicker : "Causes the brush glow texture to flicker" [
	wait(float) : "Wait" : "0.2" : "time between changes"
	health(float) : "Health" : "0.6" : "intensity of flicker"
	style(choices) : "Style" : 0 = [
		0 : "smooth"
		1 : "choppy"
	]
]
*/
void func_flicker() {
	precache_model(self.model);
	setmodel(self, self.model);
	self.solid = SOLID_BSP;

	if (!self.wait)
		self.wait = 0.2;

	if (!self.health)
		self.health = 0.6;

	if (self.style < 0) {
		self.use = (self.style == -1) ? flicker_think_smooth : flicker_think;
		self.glowmod = '0.001 0.001 0.001';
	}
	else if (self.style) {
		flicker_think();
	}
	else {
		flicker_think_smooth();
	}
}


void flicker_think() {
	float base = 1 - self.health;
	float deviation = self.health;

	self.glowmod[0] =
	self.glowmod[1] =
	self.glowmod[2] = base + (random() * deviation);

	self.nextthink = time + self.wait;
	self.think = flicker_think;
}


void flicker_think_smooth() {
	if (time > self.attack_finished) {
		float base = 1 - self.health;
		float deviation = self.health;

		self.attack_finished = time + self.wait;
		self.ammo_revolver = self.ammo_shotgun;
		self.ammo_shotgun = base + (random() * deviation);
	}

	self.glowmod[0] =
	self.glowmod[1] =
	self.glowmod[2] = lerp(self.ammo_shotgun, self.ammo_revolver, (self.attack_finished - time) / self.wait);

	self.nextthink = time + 0.01;
	self.think = flicker_think_smooth;
}
