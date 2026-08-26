void spawnfunc_ammo_revolver() {
	self.noise = "items/ammo_revolver.ogg";
	self.ammo_revolver = revolver_ammount;
	setmodel(self, "models/items/ammo_revolver.md3");
	setsizeitem2(self, shellsl_size);
	self.msg = 120;
	self.msg_icon = "slugs";
	self.msg_text = "$NOTIFY_AMMO_REVOLVER";
	precache_sound(self.noise);
	StartItem(1);
	self.scale = 1;
	self.touch = wammo_touch;
	self.oldtouch = self.touch;
	spawn_bbox_collider(self);
}
