/*FGD
@PointClass color(1 0 0) size(-16 -16 -24, 16 16 24) model("models/items/lifeblood_vial.md3") = health_life_vial : "Vial of Lifeblood" []
*/

void health_life_vial() {
	self.noise = "items/lifeblood_vial1.ogg";
	self.health = 10;
	self.colormod = '1 1 1';
	setmodel(self, "models/items/lifeblood_vial.md3");
	self.movetype = MOVETYPE_TOSS;
	self.solid = SOLID_TRIGGER;
	setsizeitem2(self, vial_size);
	self.touch = larmor_touch;
	self.msg = 11;
	self.msg_icon = "lifeblood_vial";
	self.msg_text = "$NOTIFY_HEALTH_VIAL";

	SET_DYNAMIC_LIGHT_PROPERTIES(self, dl_hpvial)

	self.oldtouch = self.touch;
	spawn_bbox_collider(self);
}


/*FGD
@PointClass color(1 0 0) size(-16 -16 -24, 16 16 24) model("models/items/lifeblood_beaker.md3") = health_life_beaker : "Beaker of Lifeblood" []
*/

void health_life_beaker() {
	float r = random() *3;
	if (r < 3)
		self.noise = ("items/lifeblood_beaker3.ogg");
	if (r < 2)
		self.noise = ("items/lifeblood_beaker2.ogg");
	if (r < 1)
		self.noise = ("items/lifeblood_beaker1.ogg");

	self.health = 30;
	self.colormod = '1 1 1';
	setmodel(self, "models/items/lifeblood_beaker.md3");
	self.touch = larmor_touch;
	self.movetype = MOVETYPE_TOSS;
	self.solid = SOLID_TRIGGER;
	setsizeitem2(self, beaker_size);
	self.msg = 10;
	self.msg_icon = "lifeblood_beaker";
	self.msg_text = "$NOTIFY_HEALTH_BEAKER";

	SET_DYNAMIC_LIGHT_PROPERTIES(self, dl_hpbeaker)

	spawn_bbox_collider(self);
	self.oldtouch = self.touch;
}


/*FGD
@PointClass color(1 0 0) size(-16 -16 -24, 16 16 24) model("models/items/lifeblood_chalice.md3") = health_life_chalice : "Chalice of Lifeblood" []
*/

void health_life_chalice() {
	float r = random();
	if(r < 1)
		self.noise = "items/lifeblood_chalice1.ogg";
	if(r < 0.6)
		self.noise = "items/lifeblood_chalice2.ogg";
	if(r < 0.3)
		self.noise = "items/lifeblood_chalice3.ogg";
	StartItem(3);
	self.health = 100;
	self.colormod = '1 1 1';
	setmodel(self, "models/items/lifeblood_chalice.md3");
	self.movetype = MOVETYPE_TOSS;
	self.solid = SOLID_TRIGGER;
	setsizeitem2(self, heart_size);
	self.touch = larmor_touch;
	self.msg = 40;
	self.msg_icon = "lifeblood_chalice";
	self.msg_text = "$NOTIFY_HEALTH_CHALICE";

	SET_DYNAMIC_LIGHT_PROPERTIES(self, dl_hpchalice)
}
