void spawnfunc_ammo_cannon() {
	setmodel(self, "models/items/ammo_cannon.md3");
	setsizeitem2(self, ore_size);
	self.ammo_cannon = cannon_ammount;
	self.noise = "items/ammo_cannon.ogg";
	self.msg = 124;
	self.msg_icon = "ore";
	self.msg_text = "$NOTIFY_AMMO_SLAGCANNON";
	precache_sound(self.noise);
	StartItem(2);
	item_glowmodcontroller_flicker_spawn(self);
	self.scale = 1;
	self.touch = wammo_touch;
	self.oldtouch = self.touch;
	spawn_bbox_collider(self);
}
