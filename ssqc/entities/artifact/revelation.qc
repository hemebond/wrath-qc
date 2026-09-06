/*FGD
@PointClass
	size(-12 -12 -44, 12 12 0)
	model({"path": "models/artifacts/artifact_revelation.md3"})
= artifact_revelation : "Artifact: Mark Of Revelation ( shows all secrets in the map )" []
*/

void artifact_revelation() {
	radial();
	self.noise = "items/artifacts/artifactA_pickup.ogg";
	self.noise1 = "items/artifacts/artifactA_use.ogg";
	self.noise2 = "items/artifacts/artifactA_end.ogg";
	self.modelflags = MF_ROTATE;
	precache_sound(self.noise);precache_sound(self.noise1);precache_sound(self.noise2);
	self.MarkRevelation = 1;
	if (self.secret)
		{total_secrets++;	self.wrathflags += FL_SECRET;}
	setmodel(self, "models/artifacts/artifact_revelation.md3");
	setsize(self, artifact_nsize, artifact_size);
	self.msg = 101;
	self.msg_icon = "artifactA";
	self.msg_text = "$NOTIFY_ARTIFACT_REVELATION";
	self.touch = artifact_touch;
	self.oldtouch = self.touch;

}
