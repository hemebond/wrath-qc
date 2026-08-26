void spawnfunc_ammo_crystal() {
	setmodel(self, "models/items/ammo_crystal.md3");
	self.noise = "items/ammo_crystallizer.ogg";
	setsizeitem2(self, explosives_size);
	self.ammo_crystal = crystal_ammount;
	precache_sound(self.noise);
	StartItem(2);
	item_glowmodcontroller_pulse_spawn(self);
	self.classname = "crystal";
	self.scale = 1;
	self.msg = 126;
	self.msg_icon = "crystals";
	self.msg_text = "$NOTIFY_AMMO_CRYSTAL";
	self.touch = wammo_touch;
	self.oldtouch = self.touch;
	spawn_bbox_collider(self);
}
