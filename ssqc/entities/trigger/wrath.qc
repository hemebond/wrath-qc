/*FGD
@SolidClass
	color(0.5 0.0 0.5)
= trigger_wrath : "" [
]
*/
void trigger_wrath_touch() {
	//
	// other == entity that touched the trigger
	//

	if (other.classname != "player")
		return;

	if (other.radial_time > time) {
		if (other.time_hudmessage < time)
			sound7(other,CHAN_AUTO,"weapons/lance/shield_fire1.ogg", 0.75, 0.25, 75, 0);

		Hud_CantUseSigilNotification(other);

		JumpBack(other, self);  // Cause the player bounce off the trigger if they have an artifact active
		return;
	}

	if (
		(other.wrath_time < (time + (self.duration - 5))) ||
		(other.sigiltouchingtime < time)
	) {
		sound7(other, CHAN_SIGIL, "items/sigils/sigil_wrath_active.ogg", 1, 1, 100, 0);
		sound7(other, CHAN_AUTO, "items/sigils/sigil_wrath_start.ogg", 1, 1, 100, 0);

		Hud_SendNotification(other, "sigil_wrath", "$NOTIFY_SIGIL_WRATH"); // Reki (February 20 2024): added this

		other.takenwrath_time = self.duration;
		other.wrath_kills = 0;
		other.wrath_time = time + self.duration + 0.5;
		other.sigil_time = time + self.duration+ 0.5;
		other.radialactive = 22;

		entity oself = self;
		self = other;

		// swap weapons if not on a melee
		if (self.weapon != IT_MACE && self.weapon != IT_MELEE) {
			if (self.items & IT_MACE)
				self.impulse = 9;
			else
				self.impulse = 1;
		}
		self.wrath_active = 1;

		te_customflash(self.origin,128,1,'1 0.3 0.3');
		stuffcmd(self, "bf 1 0.23 0.23 0.5 0.5\n");
		W_ChangeWeapon();
		self = oself;

		entity destructwrath = nextent(world);
		while (destructwrath) {
			entity holder = nextent (destructwrath);
			if ((destructwrath.classname == "func_destruct") && (destructwrath.wrath_active == 1))  {
				destructwrath.takedamage = DAMAGE_YES;
				destructwrath.wrath_active = 2;
				item_glowmodcontroller_flicker_spawn(destructwrath);
			}
			destructwrath = holder;
		}
	}
	other.sigiltouchingtime = time + 0.5;
}


void trigger_wrath() {
	self.noise = "objects/sigil_wrath.ogg";

	precache_sound(self.noise);
	precache_sound("items/sigils/sigil_wrath_active.ogg");
	precache_sound("items/sigils/sigil_wrath_start.ogg");
	precache_sound("items/sigils/sigil_wrath_end.ogg");

	if (!self.duration)
		self.duration = 20;

	if (self.duration < 5)
		self.duration = 5;

	self.touch = trigger_wrath_touch;
	self.solid = SOLID_TRIGGER;
	setmodel(self, self.model);
	vector center = (self.absmax + self.absmin) / 2;
	ambientsound(center, self.noise, 1, 0.45);
	self.modelindex = 0;
	self.model = string_null;
}
