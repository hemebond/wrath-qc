/*FGD
@PointClass
	size(-12 -12 -44, 12 12 0)
	model({"path": "models/artifacts/artifact_rage.md3"})
= artifact_rage : "Artifact: Flask of Rage ( quin damage )" []
*/

void artifact_rage() {
	radial();
	self.noise = "items/artifacts/artifactC_pickup.ogg";
	self.noise1 = "items/artifacts/artifactC_use.ogg";
	self.noise2 = "items/artifacts/artifactC_end.ogg";
	self.modelflags = MF_ROTATE;
	precache_sound(self.noise);precache_sound(self.noise1);precache_sound(self.noise2);
	self.flaskrage = 1;
	if (self.secret)
		{total_secrets++;	self.wrathflags += FL_SECRET;}
	setmodel(self, "models/artifacts/artifact_rage.md3");
	setsize(self, artifact_nsize, artifact_size);
	self.msg = 103;
	self.msg_icon = "artifactC";
	self.msg_text = "$NOTIFY_ARTIFACT_RAGE";
	self.touch = artifact_touch;
	self.oldtouch = self.touch;

}
