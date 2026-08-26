void artifact_shockwave() {
	radial();
	self.noise = "items/artifacts/artifactJ_pickup.ogg";
	self.noise1 = "items/artifacts/artifactJ_use.ogg";
	self.noise2 = "items/artifacts/artifactJ_end.ogg";
	precache_sound(self.noise);precache_sound(self.noise1);precache_sound(self.noise2);
	self.modelflags = MF_ROTATE;
	self.ShockWave = 1;
	if (self.secret)
		{total_secrets++;	self.wrathflags += FL_SECRET;}
	setmodel(self, "models/artifacts/artifact_shockwave.md3");
	setsize(self, artifact_nsize, artifact_size);
	self.msg = 110;
	self.msg_icon = "artifactJ";
	self.msg_text = "$NOTIFY_ARTIFACT_SHOCKWAVE";
	self.touch = artifact_touch;
	self.oldtouch = self.touch;
}
