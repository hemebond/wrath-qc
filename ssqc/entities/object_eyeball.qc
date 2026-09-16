/*FGD
@PointClass
	size(-64 -64 -64 , 64 64 64)
	model({{
		model -> model, "models/objects/eyeball.md3"
	}})
= object_eyeball : "A giant eyeball that tracks the player and can be shot" []
*/
void object_eyeball() {
	if (!self.model) {
		self.model = "models/objects/eyeball.md3";
	}

	if (self.modelscale)
		self.scale = self.modelscale;

	if (!self.volume)
		self.volume = 1;

	if (!self.atten)
		self.atten = ATTN_NORM;

	if (!self.wait)
		self.wait = 5;

	precache_noise_fields(self);
	entity lid = spawn();

	// eyeball
	precache_model(self.model);
	setmodel(self, self.model);
	self.SendEntity = SendEntity_object_eyeball;
	self.takedamage = DAMAGE_YES;
	self.bloodimpact = 6; // BIG blood poof
	self.solid = SOLID_BSP;
	self.th_pain = eyeball_pain;
	self.th_die = SUB_Null;
	self.health = 9999;
	self.owner = lid;
	self.think = eyeball_cphysics;
	self.nextthink = time + 0.1;

	// lid
	setorigin(lid, self.origin);
	precache_model("models/objects/eyeball/eyelid.md3");
	setmodel(lid, "models/objects/eyeball/eyelid.md3");
	lid.angles = self.angles; lid.angles[0] *= -1;
	setattachment(self, lid, "tag_eye");
	//float tagind = gettagindex(lid, "tag_eye");
	//setorigin(self, gettaginfo(lid, tagind));
}


float SendEntity_object_eyeball(entity to, float sendflags) {
	WriteByte(MSG_ENTITY, ENT::EYEBALL);
	WriteByte(MSG_ENTITY, sendflags);

	if (sendflags & 0x01) {
		WriteVectorL(MSG_ENTITY, self.origin);
		WriteVectorA(MSG_ENTITY, self.angles);
	}

	if (sendflags & 0x02) {
		WriteShort(MSG_ENTITY, self.modelindex);
	}

	if (sendflags & 0x04) {
		WriteVectorB(MSG_ENTITY, self.colormod);
		WriteByte(MSG_ENTITY, self.alpha * 255);
		WriteByte(MSG_ENTITY, self.scale * 16);
	}

	return TRUE;
}

void eyeball_pain(entity attacker, float dmg) {
	self.health = 9999;

	if !(attacker.flags & FL_CLIENT)
		return;

	// play sound
	string snd = random_sound_from_noise_fields(self);
	if (snd != "")
	{
		sound(self, CHAN_AUTO, snd, self.volume, self.atten);
	}

	if (time < self.pain_finished)
		return;

	self.pain_finished = time + self.wait;
	SUB_UseTargets();

	self.attack_finished = time + 0.35; // Reki (September 21 2023): this is a hack, the eyeball should move back with the tag but for now I'll just delete it since the model isn't animated for it yet.
	self.owner.frame = 1;
	//Steam_AchievementUnlock(attacker, ST_ACHIEVEMENTS::SP_JOKE_E3M2);
}


void eyeball_cphysics() {
	if (self.origin != self.oldorigin)  {
		self.SendFlags |= 0x01;
		self.oldorigin = self.origin;
	}

	if (self.attack_finished && time > self.attack_finished) {
		remove(self);
	}

	self.think = eyeball_cphysics;
	self.nextthink = time + 0.1;
}


