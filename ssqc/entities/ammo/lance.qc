void spawnfunc_ammo_lance() {
	setmodel(self, "models/items/ammo_lance.md3");
	self.noise = "items/ammo_lance.ogg";
	setsizeitem2(self, explosives_size);
	self.ammo_lance = lance_ammount;
	precache_sound(self.noise);
	StartItem(2);
	item_glowmodcontroller_pulse_spawn(self);
	self.classname = "spore";
	self.scale = 1;
	self.msg = 125;
	self.msg_icon = "plasma";
	self.msg_text = "$NOTIFY_AMMO_LANCE";
	self.touch = wammo_touch;
	self.oldtouch = self.touch;
	spawn_bbox_collider(self);
}

void spawnfunc_ammo_spore() {
	spawnfunc_ammo_lance();
}
