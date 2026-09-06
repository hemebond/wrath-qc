/*FGD
@PointClass
	size(-12 -12 -44, 12 12 0)
	model({"path": "models/artifacts/artifact_animus.md3"})
= artifact_animus : "Artifact: Vicious Animus ( bone turret )" []
*/

void artifact_animus() {
	radial();
	self.noise = "items/artifacts/artifactI_pickup.ogg";
	self.noise1 = "items/artifacts/artifactI_use.ogg";
	self.noise2 = "items/artifacts/artifactI_end.ogg";
	precache_sound(self.noise);
	precache_sound(self.noise1);
	precache_sound(self.noise2);

	self.modelflags = MF_ROTATE;
	self.ViciousIdol = 1;
	if (self.secret) {
		total_secrets++;
		self.wrathflags += FL_SECRET;
	}
	setmodel(self, "models/artifacts/artifact_animus.md3");
	setsize(self, '-12 -12 -44', '12 12 0');
	self.msg = 109;
	self.msg_icon = "artifactI";
	self.msg_text = "$NOTIFY_ARTIFACT_ANIMUS";
	self.touch = artifact_touch;
	self.oldtouch = self.touch;
}
