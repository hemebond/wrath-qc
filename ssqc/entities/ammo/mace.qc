void soul_touch() {
	if(other.classname != "player")
		return;
	if(other.ammo_bfg >= 10)
		return;

	if (other.ammo_bfg < 10)
		other.ammo_bfg += 1;
	te_customflash(self.origin,other.ammo_bfg * 3.5,7,'3 0 0');

	string snd = strcat ("weapons/mace/mace_absorb",ftos(other.ammo_bfg ),".ogg");
	sound(other, CHAN_AUTO, snd, 0.7, ATTN_NORM);
	if (other.ammo_bfg == 10)
		sound(other, CHAN_AUTO,"weapons/mace/mace_unfold1.ogg", 1, ATTN_NORM);

	stuffcmd (other,"pulseammo\n");
	flash_screen_item(other);
	Hud_SendNotification(other, "soul", "$NOTIFY_AMMO_SOUL", HUDMSGFLAG::AGGREGATE);
	// Steam_StatIncrement(other, ST_STATS::souls_harvested, 1);
	remove(self);
}


void ammo_mace_think() {
	while (self.count > 0)
	{
		entity dropped = spawn();
		dropped.noise = "";
		setmodel(dropped,"models/weapons/mace/soul.md3");
		dropped.msg = 126;
		dropped.msg_icon = "crystals";
		dropped.msg_text = "$NOTIFY_AMMO_SOUL";
		dropped.classname = "item_ammo_crystal";
		setsizeitem2(dropped, shellsl_size);
		dropped.alpha = 0.025;
		local vector voffset;
		voffset_x = random(-2,2) * self.count * 1.25;
		voffset_y = random(-2,2) * self.count * 1.25;
		voffset_z = random(-2,2) * self.count * 1.25;

		dropped.roaming = self.count * random(4,10);
		dropped.msg = 126;
		dropped.ldorigin = self.origin + voffset;
		dropped.origin = dropped.ldorigin;
		dropped.colormod = '1 0.5 0.5';
		dropped.solid = SOLID_TRIGGER;
		dropped.movetype = MOVETYPE_FLY;
		dropped.velocity_x = random (-24,24);
		dropped.velocity_y = random (-24,24);
		dropped.velocity_z = random (-24,24);

		dropped.traileffectnum = particleeffectnum("soul_mace_trail");
		dropped.lifetime = time + 0.95;
		dropped.alpha = 0.025;
		dropped.cnt = 1;
		dropped.touch = soul_touch;
		dropped.think = soulhome;
		dropped.nextthink = time;
		self.count --;
	}
}


void spawnfunc_ammo_mace() {
	setmodel(self, "");
	if(!self.count)
		self.count = 1;
	self.think = ammo_mace_think;
	self.nextthink = time + 0.1;
}
