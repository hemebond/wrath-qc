/*FGD
@PointClass
	size(-16 -16 -8, 16 16 8)
	model({"path": "models/items/ammo_lance.md3"})
= ammo_lance : "5 Lance ammo." []
*/

float AMMO_LANCE_AMOUNT = 5;

void spawnfunc_ammo_lance() {
	setmodel(self, "models/items/ammo_lance.md3");
	self.noise = "items/ammo_lance.ogg";
	setsize(self, '-16 -16 -8', '16 16 8');
	self.ammo_lance = AMMO_LANCE_AMOUNT;
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
