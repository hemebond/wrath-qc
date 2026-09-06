/*FGD
@PointClass
	size(-12 -12 -44, 12 12 0)
	model({"path": "models/artifacts/artifact_deflection.md3"})
= artifact_deflection : "Artifact: Orb of Deflection ( static golden forcefield )" []
*/

void artifact_deflection() {
	radial();
	self.noise = "items/artifacts/artifactG_pickup.ogg";
	self.noise1 = "items/artifacts/artifactG_use.ogg";
	self.noise2 = "items/artifacts/artifactG_end.ogg";
	precache_sound(self.noise);precache_sound(self.noise1);precache_sound(self.noise2);
	self.modelflags = MF_ROTATE;
	self.TrinketofRespite = 1;
	if (self.secret)
		{total_secrets++;	self.wrathflags += FL_SECRET;}
	setmodel(self, "models/artifacts/artifact_deflection.md3");
	setsize(self, artifact_nsize, artifact_size);
	self.msg = 107;
	self.msg_icon = "artifactG";
	self.msg_text = "$NOTIFY_ARTIFACT_DEFLECTION";
	self.touch = artifact_touch;
	self.oldtouch = self.touch;
}
