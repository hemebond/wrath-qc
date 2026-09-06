/*FGD
@PointClass
	size(-16 -16 -8, 16 16 16)
	model({"path": "models/items/ammo_crystal.md3"})
= ammo_crystal : "50 Crystal ammo." []
*/

float AMMO_CRYSTAL_AMOUNT = 50;

void spawnfunc_ammo_crystal() {
	setmodel(self, "models/items/ammo_crystal.md3");
	self.noise = "items/ammo_crystallizer.ogg";
	// setsizeitem2(self, explosives_size);
	setsize(self, '-16 -16 -8', '16 16 16');
	self.ammo_crystal = AMMO_CRYSTAL_AMOUNT;
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
