/*FGD
@PointClass
	size(-12 -12 -44, 12 12 0)
	model({"path": "models/artifacts/artifact_siphon.md3"})
= artifact_siphon : "Artifact: Life Siphon ( heart healer )" []
*/

void artifact_siphon() {
	radial();
	self.modelflags = MF_ROTATE;
	self.noise = "items/artifacts/artifactF_pickup.ogg";
	self.noise1 = "items/artifacts/artifactF_use.ogg";
	self.noise2 = "items/artifacts/artifactF_end.ogg";
	precache_sound(self.noise);precache_sound(self.noise1);precache_sound(self.noise2);
	self.LifeSiphon = 1;
	if (self.secret)
		{total_secrets++;	self.wrathflags += FL_SECRET;}
	setmodel(self, "models/artifacts/artifact_siphon.md3");
	setsize(self, artifact_nsize, artifact_size);
	self.traileffectnum = particleeffectnum("life_siphon");
	self.msg = 106;
	self.msg_icon = "artifactF";
	self.msg_text = "$NOTIFY_ARTIFACT_SIPHON";
	self.touch = artifact_touch;
	self.oldtouch = self.touch;
}


void artifact_life_siphon() {
	artifact_siphon();
}