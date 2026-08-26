void spawnfunc_ammo_shotgun() {
	self.noise = "items/ammo_shotgun.ogg";
	self.ammo_shotgun = shotgun_ammount;
	setmodel(self, "models/items/ammo_shotgun.md3");
	setsizeitem2(self, shells_size);
	self.msg = 121;
	self.msg_icon = "shells";
	self.msg_text = "$NOTIFY_AMMO_SHOTGUN";
	precache_sound(self.noise);
	StartItem(1);
	self.scale = 1;
	self.touch = wammo_touch;
	self.oldtouch = self.touch;
	spawn_bbox_collider(self);
}
