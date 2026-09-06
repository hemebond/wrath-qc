/*FGD
@PointClass
	size(-12 -12 -44, 12 12 0)
	model({"path": "models/artifacts/artifact_apparatus.md3"})
= artifact_apparatus : "Drowner's Apparatus ( swimming breather )" []
*/

void artifact_apparatus() {
	radial();
	self.noise = "items/artifacts/artifactB_pickup.ogg";
	self.noise1 = "items/artifacts/artifactB_use.ogg";
	self.noise2 = "items/artifacts/artifactB_end.ogg";
	self.modelflags = MF_ROTATE;
	precache_sound(self.noise);precache_sound(self.noise1);precache_sound(self.noise2);
	self.DrownerApp = 1;
	if (self.secret)
		{total_secrets++;	self.wrathflags += FL_SECRET;}
	setmodel(self, "models/artifacts/artifact_apparatus.md3");
	setsize(self, artifact_nsize, artifact_size);
	self.msg = 102;
	self.msg_icon = "artifactB";
	self.msg_text = "$NOTIFY_ARTIFACT_APPARATUS";
	self.touch = artifact_touch;
	self.oldtouch = self.touch;
}
