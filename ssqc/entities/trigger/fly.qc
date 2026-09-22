/*FGD
@SolidClass color(0.5 0.0 0.5) = trigger_fly : "Sigil of Flight" [
    duration(float) : "Fly Duration" : "10" : "Number in seconds of the duration of the effect. A value of -1 will stop the flying effect."
]
*/


.float sigiltouchingtime;


void trigger_fly() {
	if (!self.timefly)
		self.timefly = self.duration;

	if (!self.timefly)
		self.timefly = 10;

	self.touch = trigger_fly_touch;
	self.solid = SOLID_TRIGGER;
	setmodel(self, self.model);
	vector center = (self.absmax + self.absmin) / 2;

	if (!self.volume)
		self.volume = 1;

	if (self.volume > 0) {
		self.noise = "objects/pylon_loop.ogg";
		precache_sound(self.noise);
		ambientsound(center, self.noise, self.volume, 0.45);
	}

	self.modelindex = 0;
	self.model = string_null;
}


void trigger_fly_touch() {
	if (other.classname != "player")
		return;

	if (other.radial_time > time) {
		if (other.time_hudmessage < time)
			sound7(other,CHAN_AUTO,"weapons/lance/shield_fire1.ogg",0.75,0.25,75,0);
		Hud_CantUseSigilNotification(other);
		JumpBack(other, self);
		return;
	}

	if (self.timefly <= 0) {
		other.takenflytime = 0;
		other.radialactive = 0;
		other.timefly = 0;
		other.sigil_time = 0;
		other.flightflag = 2;
		other.movetype = MOVETYPE_WALK;
	}
	else {
		if (((other.timefly - time) < 8) || (other.sigiltouchingtime < time)) {
			sound (other, CHAN_AUTO, "items/sigils/sigil_flight_start.ogg",1 ,1);
			te_customflash(other.origin, 256, 1, '0.3 0.7 1');
			string flash_command_a = strcat ("bf ",ftos(flash_color_x)," ",ftos(flash_color_y)," ");
			string flash_command_b = strcat (ftos(flash_color_z)," ",ftos(flash_alpha)," ",ftos(flash_fade),"\n");
			string flash_command =  strcat (flash_command_a,flash_command_b);
			stuffcmd (other, flash_command);
			other.takenflytime = self.timefly;
			other.radialactive = 20;
			other.timefly = time + self.timefly;
			other.sigil_time = time + self.timefly;
			other.flightflag = 1;
			//Hud_message(29, other.origin, other);
			Hud_SendNotification(other, "sigil_flight", "$NOTIFY_SIGIL_FLIGHT");
		}
	}

	other.sigiltouchingtime = time + 0.5;
}
