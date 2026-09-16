/*FGD
@PointClass size(-4 -4 -8, 4 4 8) model({"path": "models/objects/fixtures/fire1.md3"}) = object_fire1 : "fire" [
	skin(integer) : "Skin" : 0
	spawnflags(flags) = [
		1 : "No hurt"
	]
]
*/
void object_fire1() {
	precache_model("models/objects/fixtures/fire1.md3");
	precache_sound("fx/fire1.ogg");
	precache_sound("fx/fire2.ogg");
	setmodel(self, "models/objects/fixtures/fire1.md3");
	setsize(self, '-4 -4 -8', '4 4 8');
	if (!self.skin) {
		self.noise = "fx/fire1.ogg";
	}
	else {
		self.noise = "fx/fire2.ogg";
	}
	TorchAmbient();

	if (!(self.spawnflags & 1)) {
		self.think = object_fire1_think;
		self.nextthink = time + random(0.5, 1);

		// The skin is just off-setting the animation
		if (!self.skin)
			self.skin = floor(random(0, 3.99));
	}
}


void object_fire1_think() {
	entity trigger = spawn();
	trigger.owner = self;
	setsize(trigger, self.origin - '12 12 0', self.origin + '12 12 32');
	SUB_CallAsSelf(trigger_hurt, trigger);
}
