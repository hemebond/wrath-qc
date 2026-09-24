/*FGD
@SolidClass
	color(0.5 0.0 0.5)
= trigger_displacement : "Sigil of Displacement" [
	duration(float) : "Displacement Duration" : "10" : "Number in seconds of the duration of the effect."
	noise(string) : "Noise" : "objects/pylon_loop.ogg" : "Sound emitted by the trigger"
	rad_sound(integer) : "Sound Radius" : 512 : ""
]
*/
void trigger_displacement() {
	if (self.noise == "")
		self.noise = "objects/pylon_loop.ogg";

	precache_sound(self.noise);

	if (!self.duration)
		self.duration = 10;

	self.touch = trigger_displacement_touch;
	self.solid = SOLID_TRIGGER;
	setmodel(self, self.model);

	if (!self.rad_sound)
		self.rad_sound = 512;

	self.atten = 512 / self.rad_sound;
	if (self.duration > 0) {
		if (self.rad_sound >= 0) {
			entity sigilsoundentity = spawn();
			sigilsoundentity.owner = self;
			sigilsoundentity.duration = self.duration;
			sigilsoundentity.oldclassname = self.classname;
			sigilsoundentity.origin = (self.absmin + self.absmax ) * 0.5 ;
			sigilsoundentity.classname = "sigilsoundentity";
		}
	}
	self.modelindex = 0;
	self.model = string_null;
}

void trigger_displacement_touch() {
	if(other.classname != "player")
		return;

	if(other.radial_time > time) {
		if(other.time_hudmessage < time)
			sound7(other, CHAN_AUTO, "weapons/lance/shield_fire1.ogg", 0.75, 0.25, 75, 0);
		Hud_CantUseSigilNotification(other);
		JumpBack(other, self);
		return;
	}

	if ((other.displacement_time < (time + (self.duration - 5))) || (other.sigiltouchingtime < time)) {
		if (self.duration < 0) {
			if (other.displacement_time > time) {
				other.displacement_time = 0;
				other.sigil_time = 0;
				other.radialactive = 0;
				stuffcmd(other, "r_glsl_postprocess_uservec3_enable 0\n");
				stuffcmd(other, "r_glsl_postprocess_uservec3 \"0 0 0 0\"\n");
			}
			return;
		}
		else {
			other.radialactive = 21;
			other.displacement_time = time + self.duration+ 0.5;
			other.displacement_active = 2;
			other.sigil_time = time + self.duration+ 0.5;
			other.takendisplacement_time = self.duration;
			other.takenflytime = self.timefly;

			Hud_SendNotification(other, "sigil_displacement", "$NOTIFY_SIGIL_DISPLACEMENT"); // Reki (February 20 2024): added this
		}
	}
	other.sigiltouchingtime = time + 0.5;
}


void sigil_ambientsound_check() {
	if ((self.owner.classname != self.oldclassname) || (wasfreed(self.owner))) {
		soundwrath(self, CHAN_VOICE, "misc/null.wav", 0, 1, 100, 0, 1);
		remove(self);
		return;
	}
	self.nextthink = time + 0.05;
}


void sigil_ambientsound_think() {
	soundwrath(self, CHAN_VOICE, self.owner.noise, 1, self.owner.atten,100, 2, 0.25);
	self.think = sigil_ambientsound_check;
	self.nextthink = time;
}


void sigils_initializeambients(void) {
	for (entity loopedsound = findchain(::classname, "sigilsoundentity"); loopedsound; loopedsound = loopedsound.chain) {
		loopedsound.think = sigil_ambientsound_think;
		loopedsound.nextthink = time + 0.5;
	}
}
