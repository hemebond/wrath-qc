/*FGD
@PointClass
	size(-12 -12 -44, 12 12 0)
	model({"path": "models/artifacts/soul_tether.md3"})
= item_tether : "Soul Tether ( save item )" []
*/

void item_tether() {
	radial();
	self.modelflags = MF_ROTATE;
	self.noise = "items/artifacts/artifactE_pickup.ogg";
	self.noise1 = "items/artifacts/artifactE_use.ogg";
	precache_sound(self.noise);precache_sound(self.noise1);precache_sound(self.noise2);
	self.SoulTether = 1;
	if (self.secret) {
		total_secrets++;
		self.wrathflags += FL_SECRET;
	}
	setmodel(self, "models/artifacts/soul_tether.md3");
	setsize(self, '-12 -12 -44', '12 12 0');  // artifact_nsize, artifact_size

	self.msg = 100;
	self.msg_icon = "soul_tether";
	self.msg_text = "$NOTIFY_SOULTETHER";
	self.touch = artifact_touch;
	self.oldtouch = self.touch;
}
