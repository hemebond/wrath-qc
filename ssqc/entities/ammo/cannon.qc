/*FGD
@PointClass
	size(-16 -16 -11, 16 16 19)
	model({"path": "models/items/ammo_cannon.md3"})
= ammo_cannon : "5 Cannon ammo." []
*/

float AMMO_CANNON_AMOUNT = 5;

void spawnfunc_ammo_cannon() {
	setmodel(self, "models/items/ammo_cannon.md3");
	setsize(self, '-16 -16 -11', '16 16 19');
	self.ammo_cannon = AMMO_CANNON_AMOUNT;
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
