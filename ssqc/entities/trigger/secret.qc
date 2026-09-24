/*FGD
@SolidClass color(0.5 0.0 0.5) = trigger_secret : "Secret counter trigger." []
*/
void trigger_secret() {
	precache_sound("misc/secret.ogg");
	self.touch = trigger_secret_touch;
	self.solid = SOLID_TRIGGER;
	setmodel(self, self.model);
	self.secret = 1; // just to work with marks
	self.modelindex = 0;
	self.wrathflags += FL_SECRET;
	self.model = string_null;
	total_secrets++;
}


void() trigger_secret_touch =
{

	if (other.classname != "player")
		return;


	found_secrets = found_secrets + 1;
	WriteByte(MSG_ALL, SVC_FOUNDSECRET);
	secrets_checkperfect(other);
	sound(other, CHAN_AUTO, "misc/secret.ogg", 1, ATTN_NONE);
	Hud_SendNotification(other, "secret", "$NOTIFY_SECRET");
	self.secret = 0;
	self.touch = SUB_Null;
	setmodel(self, self.model);
	self.modelindex = 0;
	self.model = string_null;
	self.nextthink = time + 1;
	self.think = SUB_Remove;
};
