void spawnfunc_ammo_spitter() {
	self.noise = "items/ammo_spitter.ogg";
	setmodel(self, "models/items/ammo_spitter.md3");
	setsizeitem2(self, resin_size);
	self.ammo_spitter = spitter_ammount;
	self.msg = 122;
	self.msg_icon = "fangs";
	self.msg_text = "$NOTIFY_AMMO_SPITTER";
	precache_sound(self.noise);
	StartItem(2);
	self.scale = 1;
	self.touch = wammo_touch;
	self.oldtouch = self.touch;
	spawn_bbox_collider(self);

}
