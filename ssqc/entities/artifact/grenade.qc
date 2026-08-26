void artifact_grenade() {
	radial();
	self.noise = "items/artifacts/artifactE_pickup.ogg";
	self.noise1 = "items/artifacts/artifactE_use.ogg";
	self.noise2 = "";
	precache_sound(self.noise);precache_sound(self.noise1);precache_sound(self.noise2);
	self.style = 1;
	self.pflags = PFLAGS_FULLDYNAMIC | PFLAGS_NOSHADOW | PFLAGS_LODFADE;
	self.color = '1 0 1';
	self.light_lev = 32;
	self.modelflags = MF_ROTATE;
	self.BlackGrenade = 1;
	if (self.secret)
		{total_secrets++;	self.wrathflags += FL_SECRET;}
	setmodel(self, "models/artifacts/artifact_grenade.md3");
	setsize(self, artifact_nsize, artifact_size);
	self.msg = 105;
	self.msg_icon = "artifactE";
	self.msg_text = "$NOTIFY_ARTIFACT_GRENADE";
	self.touch = artifact_touch;
	self.oldtouch = self.touch;
}
