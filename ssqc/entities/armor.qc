/*FGD
@PointClass size(-16 -16 -8, 16 16 2) model("models/items/armor_shard.md3") = armor_shard : "10 regular armor" []
*/

void armor_shard() {
	float r = floor(random() *3);
	if (r < 1)
		self.noise = "items/armor_shard1.ogg";
	if (r < 2)
		self.noise = "items/armor_shard2.ogg";
	else
		self.noise = "items/armor_shard3.ogg";
	precache_sound(self.noise);
	self.rarmorvalue = 10;
	setmodel(self, "models/items/armor_shard.md3");
	setsize2(self, shard_nsize, shard_size);
	self.touch = larmor_touch;

	SET_DYNAMIC_LIGHT_PROPERTIES(self, dl_armor_shard)
	self.color = shard_light_col;
	self.light_lev = shard_lightlev;
	StartItem(4);
	self.msg = 13;
	self.msg_icon = "shard";
	self.msg_text = "$NOTIFY_ARMOR_SHARD";
	self.oldtouch = self.touch;
	spawn_bbox_collider(self);
}

/*FGD
@PointClass size(-16 -16 -8, 16 16 8) model("models/items/helm.md3") = armor_helm : "" []
*/

void armor_helm() {
	self.noise = "items/helm1.ogg";
	precache_sound(self.noise);
	self.rarmorvalue = 30;
	setmodel(self, "models/items/helm.md3");
	setsize2(self, helm_nsize, helm_size);
	self.touch = larmor_touch;
	SET_DYNAMIC_LIGHT_PROPERTIES(self, dl_armor_helm)
	self.color = helm_light_col;
	self.light_lev = helm_lightlev;
	StartItem(4);
	self.msg = 9;
	self.msg_icon = "helm";
	self.msg_text = "$NOTIFY_ARMOR_HELM";
	self.oldtouch = self.touch;
	spawn_bbox_collider(self);
}


/*FGD
@PointClass size(-16 -16 -8, 16 16 20) model("models/items/armor.md3") = armor_armor : "" []
*/

void armor_armor() {
	self.noise = "items/armor1.ogg";
	precache_sound(self.noise);
	self.rarmorvalue = 50;
	setmodel(self, "models/items/armor.md3");
	setsize2(self, armor_nsize, armor_size);
	self.touch = larmor_touch;
	SET_DYNAMIC_LIGHT_PROPERTIES(self, dl_armor)
	self.color = armor_light_col;
	self.light_lev = armor_lightlev;
	StartItem(4);
	self.msg = 2;
	self.msg_icon = "armor";
	self.msg_text = "$NOTIFY_ARMOR";
	self.oldtouch = self.touch;
	spawn_bbox_collider(self);
}


/*FGD
@PointClass size(-16 -16 -8, 16 16 2) model("models/items/armor_shard_dark.md3") = armor_shard_dark : "" []
*/

void armor_shard_dark() {
	float r = floor(random() *3);
	if (r < 1)
		self.noise = "items/armor_shard_dark1.ogg";
	if (r < 2)
		self.noise = "items/armor_shard_dark2.ogg";
	else
		self.noise = "items/armor_shard_dark3.ogg";
	precache_sound(self.noise);
	self.darmorvalue = 10;
	setmodel(self, "models/items/armor_shard_dark.md3");
	setsize2(self, dark_shard_nsize, dark_shard_size);
	self.touch = larmor_touch;

	SET_DYNAMIC_LIGHT_PROPERTIES(self, dl_darkarmor_shard)
	self.color = dark_shard_light_col;
	self.light_lev = dark_shard_lightlev;
	StartItem(4);
	self.msg = 6;
	self.msg_icon = "dark_shard";
	self.msg_text = "$NOTIFY_DARKARMOR_SHARD";
	self.oldtouch = self.touch;
	spawn_bbox_collider(self);
}


/*FGD
@PointClass size(-16 -16 -8, 16 16 20) model("models/items/armor_dark.md3") = armor_armor_dark : "" []
*/
void armor_armor_dark() {
	self.noise = "items/armor_dark1.ogg";
	precache_sound(self.noise);
	self.darmorvalue = 50;
	setmodel(self, "models/items/armor_dark.md3");
	setsize2(self, dark_armor_nsize, dark_armor_size);
	self.touch = larmor_touch;
	SET_DYNAMIC_LIGHT_PROPERTIES(self, dl_darkarmor)
	self.color = dark_armor_light_col;
	self.light_lev = dark_armor_lightlev;
	StartItem(4);
	self.msg = 4;
	self.msg_icon = "dark_armor";
	self.msg_text = "$NOTIFY_DARKARMOR";
	self.oldtouch = self.touch;
	spawn_bbox_collider(self);
}


/*FGD
@PointClass size(-16 -16 -8, 16 16 8) model("models/items/helm_dark.md3") = armor_helm_dark : "" []
*/

void armor_helm_dark() {
	self.noise = "items/helm_dark1.ogg";
	precache_sound(self.noise);
	self.darmorvalue = 30;
	setmodel(self, "models/items/helm_dark.md3");
	setsize2(self, dark_helm_nsize, dark_helm_size);
	self.touch = larmor_touch;
	SET_DYNAMIC_LIGHT_PROPERTIES(self, dl_darkarmor_helm)
	self.color = dark_helm_light_col;
	self.light_lev = dark_helm_lightlev;
	StartItem(4);
	self.msg = 5;
	self.msg_icon = "dark_helm";
	self.msg_text = "$NOTIFY_DARKARMOR_HELM";
	self.oldtouch = self.touch;
	spawn_bbox_collider(self);
}
