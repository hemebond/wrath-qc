//retcherdamg            = 350                //    damage modifier fire1 (480 DPS + 300 splash)
//retcherdamg_mp         = 200                //    damage modifier fire1 (240 DPS + 300 splash) MULTIPLAYER
//retcherdamg2           = 200                //    damage modifier 2  (600 DPS + 300 splash)
//retcherdamg2_mp        = 100                //    damage modifier 2 (300 DPS + 300 splash)MULTIPLAYER
//self.voidbombs_time1   = 0.8				//	time fire 1
//self.voidbombs_time2   = 1				//	time fire 2
//self.rvweapon_scale    = 1				//	scale
//bboxretcher            = '5 5 5'	//	bboxsizeproj1;
//bboxretcher2           = '5 5 5'	//	bboxsizeproj2;
//retchersplashdamage    = 300				//	splash damage
//retchersplashdamage_mp = 300				//	splash damage MULTIPLAYER
//retchersplashradius    = 128				//	splash radius
//retchersplashradius_mp = 128				//	splash radius MULTIPLAYER
//retcheraoeradius       = 128				//	aoe radius
//retcheraoetime         = 3.5				//	aoe time
//retcheraoedamage       = 30				//	aoe damage
//retcheraoedamage_mp    = 20				//	aoe damage  MULTIPLAYER
//retcheraoeframetime    = 0.5				//	aoe timerefresh in seconds
//retcher_proj_velz      = 288             //	projectile z velocity
//retcher_proj_vel       = 1280			//	projectile velocity
//retcher_proj_grav      = 2				//	projectile gravity


.float oldcnt;
.float magnetized;


float() somecustomizefunction = { local entity pl;
	pl = find(world, classname, "player");	//find the client
	traceline(pl.origin + pl.view_ofs, self.origin, TRUE, other);
	if (trace_fraction == 1)
	{
		local float d;
		d = vlen(pl.origin - self.origin);
		if ((self.flags &FL_ONGROUND) || (d > 250))
			self.effects = 0;
		else
			self.effects = EF_NODEPTHTEST;
		return TRUE;
	}
	else
	{
		self.effects = 0;
		return TRUE;
	}
};



void check_retcher_skin() {
	if (self.ammo_retcher >= 1)
		self.vweaponskin = 0;
	else
		self.vweaponskin = 1;
}


void idle_retcher() {
	if (self.playerdeadtime > time) {
		self.think = PlayerDeathThink;
		self.nextthink = time;
	}

	self.realoding = 0;
	check_retcher_skin();
	self.vweaponframe = 0;
	if (self.pick_up_time < time)
		self.vweaponstate = 0;
}


void() release_retcher2 = { self.vweaponframe += 1;
	if (self.vweaponframe >= 20)
		self.think = idle_retcher;
	else
		self.think = release_retcher2;
	self.nextthink = time + 0.05;
};

void() release_retcher = { check_retcher_skin();
	self.vweaponframe = 16;
	self.think = release_retcher2;
	self.nextthink = time + 0.05;
};


void W_Fireretcher(float rtag) {
	newmis = spawn();
	newmis.owner = self;
	newmis.dphitcontentsmask = DPCONTENTSMASK_WEAPON;
	newmis.solid = SOLID_BBOX;
	newmis.think = CheckCys;
	newmis.movetype = MOVETYPE_BOUNCE;
	newmis.nextthink = time;
	newmis.traileffectnum = particleeffectnum("retchertrail");

	vector dir = aim(self, 1000);
	vector rorg = self.view_ofs - '0 0 19';
	string tagname = strcat("tag_muzzle_", ftos(rtag));
	float tagindex = gettagindex(self.vweapon, tagname);
	vector tagorg = gettaginfo(self.vweapon, tagindex);
	float sv = 0.0075 * self.slagcannonspread;

	setorigin(newmis, tagorg);
	setmodel(newmis, "models/projectiles/proj_cyst.md3");
	newmis.classname = "spleetcyst";
	newmis.velocity = normalize(cursor_trace_endpos_fixed(self) - newmis.origin) * retcher_proj_vel;
	newmis.velocity_z += retcher_proj_velz;
	newmis.angles = vectoangles(newmis.velocity);
	newmis.touch = cyst_touch;
	newmis.gravity = retcher_proj_grav;
	newmis.modelflags = 0;
	newmis.colormod  = '2 2 2';
	newmis.effects = EF_NOSHADOW;

	self.ammo_retcher -= 1;

	if (rtag == 1) {
		playerwsound("weapons/retcher/fire1_", 5, CHAN_AUTO);
		newmis.cnt = 1;
		newmis.clipgroup = CLIPGROUP_CYSTS;  // Prevent cysts from blocking each other
		newmis.lifetime = time + 15;
	}
	else {
		playerwsound("weapons/retcher/fire2_", 5, CHAN_AUTO);
		newmis.bouncefactor = random( 0.75, 1);
		newmis.lifetime = time + 5;
		newmis.cnt = 2;
	}

	newmis.wrathflags += FL_PROJECTILE;
	setsizeitem(newmis, retcher_proj_size);
	if(cvar("cl_punch") == 1)
		self.punchangle_x = -2;
}


void() wfire_retcher2 = { self.vweaponframe += 1;
	if (self.vweaponframe == 2)
		self.vweaponskin = 1;
	if (self.vweaponframe == 3)
		check_retcher_skin();
	if (self.vweaponframe >= 15)
		self.think = release_retcher;
	else
		self.think = wfire_retcher2;
	self.nextthink = time + 0.05;
};

void wfire_retcher() {
	//
	// Retcher Primary Fire
	//

	if (!self.ammo_retcher)
		return;

	self.vweaponframe = 1;	// empty
	self.think = wfire_retcher2;
	W_Fireretcher(1);

	// Reki (December 3 2023): Added controller rumble
	Controller_Rumble(self, 0.65, 0.2, 140);
	Controller_RumbleTriggers(self, 0.6, 0, 70);

	self.attack_finished = time + 0.75;
	self.time_fire_cannon = time + 0.75;
	self.nextthink = time + 0.05;
};

void() wsfire_retcher3 = { self.vweaponframe += 1;
	if (self.vweaponframe == 30)//28
		self.vweaponskin = 1;
	if ((self.vweaponframe == 31) && (self.ammo_retcher >= 1))//29
		self.vweaponskin = 0;

	if (self.vweaponframe >= 40)
		self.think = idle_retcher;
	else
		self.think = wsfire_retcher3;
	self.nextthink = time + 0.05;
};

void() wsfire_retcher2 = { self.vweaponframe += 1;
	if (self.vweaponframe == 26) //25
		self.vweaponskin = 1;
	if ((self.vweaponframe == 27) && (self.ammo_retcher >= 1)) //26
		self.vweaponskin = 0;
	if (self.vweaponframe >= 29) //27
	{
		Controller_Rumble(self, 0.24, 0.17, 90);
		self.think = wsfire_retcher3;
		W_Fireretcher(2);
	}
	else
		self.think = wsfire_retcher2;
	self.nextthink = time + 0.05;
};

void() wsfire_retcher1 = { self.vweaponframe += 1;
	if (self.vweaponframe == 22)
		self.vweaponskin = 1;

	if ((self.vweaponframe == 23) && (self.ammo_retcher >= 1))
		self.vweaponskin = 0;
	if (self.vweaponframe >= 25) //24
	{
		Controller_Rumble(self, 0.2, 0.2, 70);
		W_Fireretcher(2);
		self.think = wsfire_retcher2;
	}
	else
		self.think = wsfire_retcher1;
	self.nextthink = time + 0.05;
};

void() wsfire_retcher = { if (!self.ammo_retcher)
		return;
	if (self.ammo_retcher == 1)
	{
		W_Fireretcher(2);
		self.vweaponframe = 29;// 27
		self.think = wsfire_retcher3;
	}
	else if (self.ammo_retcher == 2)
	{
		W_Fireretcher(2);
		self.vweaponframe = 25; // 24
		self.think = wsfire_retcher2;
	}
	else
	{
		W_Fireretcher(2);
		self.vweaponframe = 21;
		self.think = wsfire_retcher1;
	}

	Controller_Rumble(self, 0.2, 0.3, 70);
	Controller_RumbleTriggers(self, 0.3, 0, 70);

	self.attack_finished = time + 1;
	self.time_fire_cannon = time + 1;
	self.nextthink = time + 0.05;
};

void() pre_idle_retcher = { self.pick_up_time = time + 0.5;
	self.vweaponstate = 1;
	self.think = idle_retcher;
	self.nextthink = time;
}

void() pick_up_retcher = {
	self.vweaponskin = 0;
	self.weapon = IT_RETCHER;
	self.lastweapon = IT_RETCHER;
	sound(self, CHAN_WEAPON, "weapons/retcher/inspect.ogg", 1, ATTN_NORM);
	W_SetWeapon();
	self.draw_w = 0;
	self.vweaponstate = 2;
	self.vweaponframe = 61;
	if (self.noltime < time)
		self.lspeedtime = time + 7;
	self.attack_finished = time + 0.05;
	self.nextthink = time + 8;
	self.think = pre_idle_retcher;
};

void() raise_retcher2 = {
	if (self.vweaponframe == 42)
		W_SetWeapon();

	self.vweaponframe += 1;
	if (self.vweaponframe >= 45)
	{
		if (self.preloadcyst == 1)
			self.think = reload_retcher;
		else
			self.think = idle_retcher;
	}
	else
		self.think = raise_retcher2;
	self.nextthink = time + 0.025;
};

void() raise_retcher = { check_retcher_skin();
	self.weapon = IT_RETCHER;
	W_SetWeapon();
	self.vweaponglowmod = '1 1 1';
	sound(self, CHAN_AUTO, "weapons/retcher/raise.ogg", 1, ATTN_NORM);
	self.draw_w = 0;
	self.vweaponframe = 41;
	self.attack_finished = time +  0.05; //0.25;
	self.think = raise_retcher2;
	self.nextthink = time + 0.025;
	self.vweaponstate = 1;

};

void() lower_retcher2 = { self.vweaponframe += 1;
	if (self.vweaponframe >= 50)
		self.think = raise_weapon;
	else
		self.think = lower_retcher2;
	self.nextthink = time + 0.025;

};

void() lower_retcher = { sound(self, CHAN_AUTO, "weapons/retcher/lower.ogg", 1, ATTN_NORM);
	self.vweaponframe = 46;
	self.attack_finished = time + 0.25;
	self.think = lower_retcher2;
	self.nextthink = time + 0.025;
	self.vweaponstate = 2;
};

void() reload_retcher2 = { self.vweaponframe += 1;
	self.vweaponskin = 0;
	if (self.vweaponframe >= 60)
		self.think = idle_retcher;
	else
		self.think = reload_retcher2;
	self.nextthink = time + 0.025;
};

void() reload_retcher = {
	self.realoding = 1;
	self.preloadcyst = 0;
	self.vweaponframe = 51;
	self.think = reload_retcher2;
	self.attack_finished = time + 0.5;
	self.nextthink = time + 0.025;
};
