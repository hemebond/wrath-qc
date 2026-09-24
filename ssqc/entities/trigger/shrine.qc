/*FGD
@SolidClass color(0.5 0.0 0.5) = trigger_shrine : "Shrine trigger." []
*/
void trigger_shrine() {
	self.touch = trigger_shrine_touch;
	self.solid = SOLID_TRIGGER;
	setmodel(self, self.model);
	self.modelindex = 0;
	self.model = string_null;
}


void() trigger_shrine_touch =
{
	if (other.classname != "player")
		return;

	te_customflash((self.absmin + self.absmax) / 2, 256, 3, '0.3 1 0.7');

	entity oself;
	oself = self;
	self = other;
	nowater_type();
	self = oself;
	message_garbage_collector ();

	write_shrine(0);

	// Steam_StatIncrement(other, ST_STATS::saved_shrines, 1);

	read_currentprofileslot();
	copy_save_maps(0);
	local string saveloc;
	saveloc = strcat("save data/profiles/", profilename, "/shrine\n");
	stuffcmd(other, "scratch1 1\n");
	stuffcmd(other, saveloc);
	stuffcmd(other, "scratch1 0\n");
	//	stuffcmd(other, "save shrine\n");
	if (!(other.savedlist &SAVED_SIGIL))
		other.savedlist += SAVED_SIGIL;
	local float savestotalnumber;
	savestotalnumber = other.savedlist;
	writeprofilesavedlist(savestotalnumber);
	update_latest_saveslot(2);

	if (profilename != "")
		strunzone(profilename);

	other.shrine = 1;
	if (other.shrine_model_client == 0)
		other.Shrine_time = time + 0.25;
	write_shrine_user(1);
	sound(other, CHAN_AUTO, "objects/shrine.ogg", 1, ATTN_NONE);
	if(other.health < 100)
	{
		other.health = 100;
		stuffcmd (other,"pulsehealth\n");
	}

	SUB_UseTargets();
	oself = self;
	self = self.owner;
	self.think = self.use;
	self.nextthink = time;
	self = oself;

	remove(self);
	message_garbage_collector ();
	save_screenshot(3,1.5);
	writedates(3);
	Hud_message_delay(26, self.origin, self);
};


