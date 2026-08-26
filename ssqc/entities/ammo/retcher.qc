void spawnfunc_ammo_retcher() {
	setmodel(self, "models/items/ammo_retcher.md3");
	self.noise = "items/ammo_retcher.ogg";
	setsizeitem2(self, explosives_size);
	self.ammo_retcher = retcher_ammount;
	precache_sound(self.noise);
	StartItem(2);
	self.scale = 1;
	self.msg = 123;
	self.msg_icon = "cysts";
	self.msg_text = "$NOTIFY_AMMO_RETCHER";
	self.touch = wammo_touch;
	self.oldtouch = self.touch;
	spawn_bbox_collider(self);
}
