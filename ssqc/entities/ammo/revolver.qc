/*FGD
@PointClass size(-16 -16 -6, 16 16 6) model({"path": "models/items/ammo_revolver.md3"}) = ammo_revolver : "15 Coach Gun ammo." []
*/

float AMMO_REVOLVER_AMOUNT = 15;

void spawnfunc_ammo_revolver() {
	self.noise = "items/ammo_revolver.ogg";
	self.ammo_revolver = AMMO_REVOLVER_AMOUNT;
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
