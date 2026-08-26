void artifact_aegis() {
	radial();
	self.noise = "items/artifacts/artifactH_pickup.ogg";
	self.noise1 = "items/artifacts/artifactH_use.ogg";
	self.noise2 = "items/artifacts/artifactH_end.ogg";
	precache_sound(self.noise);precache_sound(self.noise1);precache_sound(self.noise2);
	self.modelflags = MF_ROTATE;
	self.Aegis = 1;
	if (self.secret)
		{total_secrets++;	self.wrathflags += FL_SECRET;}
	setmodel(self, "models/artifacts/artifact_aegis.md3");
	setsize(self, artifact_nsize, artifact_size);
	self.msg = 108;
	self.msg_icon = "artifactH";
	self.msg_text = "$NOTIFY_ARTIFACT_AEGIS";
	self.touch = artifact_touch;
	self.oldtouch = self.touch;
}
