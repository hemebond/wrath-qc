.float fscnt;	//not repeat sounds
.float sscnt;	//not repeat sounds
.float jscnt;	//not repeat sounds
.float jsscnt;	//not repeat sounds

.float crouchlooptime;
.float surfacing_sound_time;
//gwalk, gravel, mud, snow, soft, stone, water and wood

float    MAT_GENERIC = 0;
float    MAT_DIRT = 64;// 0x40
float    MAT_GRASS = 32768; // 0x8000
float    MAT_GRAVEL = 32832; // 32768 + 64, 0x8040
float    MAT_GRATE = 131072; // *2, 0x20000
float    MAT_METAL = 131136 ;//131072 + 64, 0x20040
float    MAT_ICE = 163840;//131072 + 32768, 0x28000
float    MAT_MUD = 163904; // 131072 + 32768 + 64, 0x28040
float    MAT_PUDDLE = 262144;// *2, 0x40000
float    MAT_SOFT = 262208; // 262144 + 64, 0x40040
float    MAT_SNOW = 294912; //262144 + 32768, 0x48000
float    MAT_STONE = 294976; // 262144 + 32768 +64, 0x48040
float    MAT_WOOD = 393216; // 262144 + 131072, 0x60000
float    MAT_BFLESH= 425984; // 262144 + 131072+ 32768;, 0x68000
float    MAT_MASK = 426048 ; //  262144 + 131072+ 32768 +64, 0x68040

float GetTraceMaterial() {
	if (trace_dphitq3surfaceflags & 16)
		return -1;

	if (trace_dphitq3surfaceflags & 4096)
		return MAT_GRATE;

	if ((trace_dphittexturename == "textures/e3m2/e3m2_bld1"))
		return MAT_BFLESH;

	float matflags = trace_dphitq3surfaceflags & MAT_MASK;
		return matflags;
}


float GetFootMaterial(entity e) {
	traceline(e.origin, e.origin - '0 0 64', TRUE, e);

	// hemebond: hopefully obsolete because the material type apparently comes from the shader
	if((trace_dphittexturename == "textures/common/clip_stone") || (trace_dphittexturename == "textures/common/clipall_stone"))
		return MAT_STONE;
	if((trace_dphittexturename == "textures/common/clip_grate") || (trace_dphittexturename == "textures/common/clipall_grate"))
		return MAT_GRATE;
	if((trace_dphittexturename == "textures/common/clip_metal") || (trace_dphittexturename == "textures/common/clipall_metal"))
		return MAT_METAL;
	if((trace_dphittexturename == "textures/common/clip_wood") || (trace_dphittexturename == "textures/common/clipall_wood"))
		return MAT_WOOD;
	if((trace_dphittexturename == "textures/common/clip_flesh") || (trace_dphittexturename == "textures/common/clipall_flesh"))
		return MAT_BFLESH;
	if((trace_dphittexturename == "textures/e3m2/e3m2_bld1"))
		return MAT_PUDDLE;

	if(trace_dphitq3surfaceflags & 2)
		e.icetime =  time + 0.5;

	if(trace_dphittexturename == "e1m2/e1m2_grt1_2")
		return MAT_GRATE;

	if(trace_dphittexturename == "textures/e1m2/e1m2_grt1_2")
		return MAT_GRATE;

	if(trace_dphitq3surfaceflags & 8192)
		return -1;

	if(trace_dphitq3surfaceflags & 4096)
		return MAT_GRATE;

	float matflags = trace_dphitq3surfaceflags & MAT_MASK;

	return matflags;
}


void checking_enemies() {
	if (self.cursor_trace_ent.takedamage) {
		self.enhealth = self.cursor_trace_ent.health;
		self.enframe = self.cursor_trace_ent.frame;
		self.flash.effects = 512 + EF_NODEPTHTEST;
		self.flash.colormod = '5 1 1';
		self.flash.alpha = 1;
	}
	else {
		self.flash.alpha = 0.5;
		self.flash.effects = 0;
		self.flash.colormod = '0.2 0.2 0.2';
		self.enhealth = 0;
	}
}


.float landsoundtime;
void playerlandsound(float isheavy) {
	if (self.landsoundtime > time)
		return;

	float mat = 0;
	string r = "";
	string landingsound = "";

	if (isheavy == 1) {
		mat = floor(random() *4 + 1);
		r = ftos(floor(mat));

		float material = GetFootMaterial(self);
		if(material == -1)
			return;

		self.landsoundtime = time + 1;
		if (material == MAT_GENERIC)
		{
			landingsound = strcat("player/landings/land_stone", r, ".ogg");
		}
		else if (material == MAT_DIRT)
		{
			landingsound = strcat("player/landings/land_dirt", r, ".ogg");
		}
		else if (material == MAT_GRATE)
		{
			landingsound = strcat("player/landings/land_grate", r, ".ogg");
		}
		else if (material == MAT_GRAVEL)
		{
			landingsound = strcat("player/landings/land_dirt", r, ".ogg");
		}
		else if (material == MAT_GRASS)
		{
			landingsound = strcat("player/landings/land_grass", r, ".ogg");
		}
		else if (material == MAT_ICE)
		{
			landingsound = strcat("player/landings/land_ice", r, ".ogg");
		}
		else if (material == MAT_METAL)
		{
			landingsound = strcat("player/landings/land_metal", r, ".ogg");
		}
		else if (material == MAT_MUD)
		{
			landingsound = strcat("player/landings/land_dirt", r, ".ogg");
		}
		else if (material == MAT_SNOW)
		{
			landingsound = strcat("player/landings/land_snow", r, ".ogg");
		}
		else if (material == MAT_SOFT)
		{
			landingsound = strcat("player/landings/land_stone", r, ".ogg");
		}
		else if (material == MAT_STONE)
		{
			landingsound = strcat("player/landings/land_stone", r, ".ogg");
		}
		else if (material == MAT_WOOD)
		{
			landingsound = strcat("player/landings/land_wood", r, ".ogg");
		}
		else if (material == MAT_GRASS)
		{
			landingsound = strcat("player/landings/land_grass", r, ".ogg");
		}
	}

	if (isheavy == 2) {
		mat = floor(random() *2 + 1);
		r = ftos(floor(mat));
		landingsound = strcat("player/landings/heavy_land", r, ".ogg");
	}

	float ftvol = cvar("footsteps_volume");

	sound(self, CHAN_AUTO, landingsound, 1 * ftvol, 0.125);
}


.float water_splash_origin;


void playerfootstepsound() {
	if(self.message_time > time)
		self.message_time = 0;

	float mat = floor(random() * 4 + 1);
	if (mat == self.fscnt)
	{
		mat = self.fscnt + 1;
		if (mat > 5)
			mat = 1;
		if (mat == self.sscnt)
			mat = mat + 1;
		if (mat > 5)
			mat = 1;
	}

	if (mat == self.sscnt)
	{
		mat = self.sscnt + 1;
		if (mat > 5)
			mat = 1;
		if (mat == self.fscnt)
			mat = mat + 1;
		if (mat > 5)
			mat = 1;
	}

	self.sscnt = self.fscnt;
	self.fscnt = mat;

	float material = GetFootMaterial(self);
	if(material == -1)
		return;

	float footstepvol;
	float footstepcrouchvol;
	string footstepsound;
	string r = ftos(floor(mat));

	if (material == MAT_GENERIC) {
		footstepvol = 0.7;
		footstepcrouchvol = 0.3;
		footstepsound = strcat("player/footsteps/dirt", r, ".ogg");
	}
	else if (material == MAT_DIRT) {
		footstepvol = 1;
		footstepcrouchvol = 0.7;
		footstepsound = strcat("player/footsteps/dirt", r, ".ogg");
	}
	else if (material == MAT_GRAVEL) {
		footstepvol = 0.7;
		footstepcrouchvol = 0.5;
		footstepsound = strcat("player/footsteps/gravel", r, ".ogg");
	}
	else if (material == MAT_GRASS) {
		footstepvol = 0.5;
		footstepcrouchvol = 0.2;
		footstepsound = strcat("player/footsteps/grass", r, ".ogg");
	}
	else if (material == MAT_GRATE) {
		footstepvol = 0.7;
		footstepcrouchvol = 0.5;
		footstepsound = strcat("player/footsteps/grate", r, ".ogg");
	}
	else if (material == MAT_ICE) {
		footstepvol = 0.5;
		footstepcrouchvol = 0.2;
		footstepsound = strcat("player/footsteps/ice", r, ".ogg");
		self.icetime =  time + 0.5;
	}
	else if (material == MAT_METAL) {
	    	footstepvol = 1;
	    	footstepcrouchvol = 0.7;
		footstepsound = strcat("player/footsteps/metal", r, ".ogg");
	}
	else if (material == MAT_MUD) {
		footstepvol = 1;
		footstepcrouchvol = 0.7;
		footstepsound = strcat("player/footsteps/mud", r, ".ogg");
	}
	else if (material == MAT_SNOW) {
		footstepvol = 0.7;
		footstepcrouchvol = 0.4;
		footstepsound = strcat("player/footsteps/snow", r, ".ogg");
	}
	else if (material == MAT_PUDDLE) {
		footstepvol = 0.7;
		footstepcrouchvol = 0.2;
		footstepsound = strcat("player/footsteps/puddle", r, ".ogg");
	}
	else if (material == MAT_SOFT) {
		footstepvol = 1;
		footstepcrouchvol = 0.7;
		footstepsound = strcat("player/footsteps/sand", r, ".ogg");
	}
	else if (material == MAT_STONE) {
		footstepvol = 0.8;
		footstepcrouchvol = 0.7;
		footstepsound = strcat("player/footsteps/stone", r, ".ogg");
	}
	else if (material == MAT_WOOD) {
		footstepvol = 0.7;
		footstepcrouchvol = 0.4;
		footstepsound = strcat("player/footsteps/wood", r, ".ogg");
	}
	else if (material == MAT_BFLESH) {
		footstepvol = 0.55;
		footstepcrouchvol = 0.3;
		footstepsound = strcat("player/footsteps/flesh", r, ".ogg");
	}

	float pvol = footstepvol;
	if (pvol > 1)
		pvol = 1;

	float ftvol = cvar ("footsteps_volume");

	if (self.waterlevel < 1)
		sound7(self, CHAN_AUTO, footstepsound, pvol * ftvol, 0.125, 80 + random() *30, 0);

	if (self.waterlevel) {
		footstepsound = strcat("player/footsteps/puddle", r, ".ogg");
		if (self.waterlevel < 2)
			sound7(self, CHAN_AUTO, footstepsound, pvol * ftvol, 0.125, 80 + random() *30, 0);
		makevectors(self.angles);
		local vector wsorg;
		if (!self.water_splash_origin)
		{
			wsorg = self.origin + '0 0 -9' + v_right * 12;
			self.water_splash_origin = 1;
		}
		else
		{
			wsorg = self.origin + '0 0 -9' + v_right *-12;
			self.water_splash_origin = 0;
		}

		if (self.waterlevel == 2)
			wsorg = wsorg + '0 0 16';
		//pointparticles(particleeffectnum("water_splash"), wsorg, 0, 1);
	}
}


void playerjumpsound() {
	float ft = floor(random() *4 + 1);
	string r = ftos(floor(ft));
	string jumpsound = strcat("player/jumps/jump", r, ".ogg");
	sound7(self, CHAN_AUTO, jumpsound, 1, 0.125, 80 + random() *30, 0);
}


.float walking;
void PlayerFootstep() {
	if (self.movetype != MOVETYPE_WALK)
		return;

	if (!(self.flags &FL_ONGROUND)) {
		if((self.surfacing_sound_time < time) && (self.waterlevel == 2) &&  (self.velocity_x || self.velocity_y)) {
			randompointsound(self.origin,"player/water_surfacing", 3, random(0.75,1));
			self.surfacing_sound_time = time + random(0.5,1);
		}
		if (self.crouchlooptime > 0) {
			self.crouchlooptime = 0;
		}

		return;
	}

	if (self.crouch) {
		if (self.velocity_x || self.velocity_y) {
			if (self.crouchlooptime < time) {
				self.crouchlooptime = time + 5;	//(soundlength ("player/crawl.ogg"));
			}
		}
		else {
			self.crouchlooptime = 0;
		}
	}
	else {
		if (self.crouchlooptime > 0) {
			self.crouchlooptime = 0;
		}

		if (time < self.timefootstep)
			return;


		local float vf;
		local vector vp;
		vp = self.velocity;
		vp_z = 0;

		if ((vp_x > 0) || (vp_y > 0))	// vp > 0
			vf = 77 / (vlen(vp));

		if (vf > 1)
			vf = 1;

		if (vf < 0.3)
		{
			if (self.wrath_active == 2)
				vf = 0.235;
			else
				vf = 0.3;
		}


		if(self.walking == 1)
			vf += 0.15;

		self.timefootstep = time + vf;
		if (vlen(vp) >= 30)
			playerfootstepsound();
	}
}


.float r_cshift;
.float r_cshift_fade;
.float g_cshift;
.float g_cshift_fade;
.float b_cshift;
.float b_cshift_fade;
.float i_cshift;
.float i_cshift_fade;

.float vcshifttime;
.float flasrageflashtime;


void v_cshift_changes() {
	if (self.fwatershifttime + 0.1 > time) {
		self.r_cshift = 0;
		self.g_cshift = 0;
		self.b_cshift = 0;
		self.i_cshift = 0;
		return;
	}

	if (time < self.vcshifttime)
		return;

	self.vcshifttime = time + 0.025;

	if(self.flaskrage_active >= 1) {
		if(self.flaskrage_time > time + 2.5)
			pointparticles(particleeffectnum("flaskembers"), self.origin - '0 0 32' , '0 0 0',1);

		if(self.flaskrage_time > time) {
			if(self.i_cshift < 16) {
				self.r_cshift += 1 * 3;
				self.g_cshift += 0.7 * 3;
				self.b_cshift += 0;

				self.i_cshift += 1;
			}
		}
		else {

			if(self.r_cshift > 0) {
				self.r_cshift -= 1 * 3;
				self.g_cshift -= 0.7 * 3;
				self.b_cshift -= 0;

				self.i_cshift -= 1;

				self.light_lev -= 3;
			}
			else {
				self.flaskrage_active = 3;
			}
		}

	}

	if(self.wrath_active >= 2) {
		self.r_cshift = 255;
		self.g_cshift = 0;
		self.b_cshift = 0;
		self.i_cshift = self.wrath_kills * 1.25 + 8;
		if(self.i_cshift > 255)
		self.i_cshift = 255;
	}

	if(self.displacement_active == 1) {

		if(self.displacement_time > time + 2.5)
			pointparticles(particleeffectnum("displacement"), self.origin - '0 0 32' , '0 0 0',1);

		if(self.r_cshift_fade == 1) {
			if(self.r_cshift <= 1)
				self.r_cshift_fade = 0;
			self.r_cshift -= 3;
		}
		else {
			if(self.r_cshift >= 256)
				self.r_cshift_fade = 1;
			self.r_cshift += 3;
		}


		if(self.g_cshift_fade == 1) {
			if(self.g_cshift <= 1)
				self.g_cshift_fade = 0;
			self.g_cshift -= 5;
		}
		else {
			if(self.g_cshift >= 256)
				self.g_cshift_fade = 1;
			self.g_cshift += 5;
		}

		if(self.b_cshift_fade == 1) {
			if(self.b_cshift <= 1)
				self.b_cshift_fade = 0;
			self.b_cshift -= 8;
		}
		else {
			if(self.b_cshift >= 128) // 256
				self.b_cshift_fade = 1;
			self.b_cshift += 8;
		}

		if(self.i_cshift_fade == 1) {
			if(self.i_cshift <= 0)
				self.i_cshift_fade = 0;
			self.i_cshift -= 0.5;
		}
		else {
			if(self.i_cshift >= 32)
				self.i_cshift_fade = 1;
			self.i_cshift += 0.5;
		}
	}

	stuffcmd(self, "v_cshift ");
	stuffcmd(self, strcat(ftos(self.r_cshift)," ",ftos(self.g_cshift)," ",ftos(self.b_cshift)," ",ftos(self.i_cshift)));
	stuffcmd(self, "\n");
}


.vector velocity1;
.vector velocity2;
.vector velocity3;
.vector velocity4;
.vector velocity5;
.vector velocity6;
.vector avelocity1;
.vector avelocity2;
.vector avelocity3;
.vector avelocity4;
.vector avelocity5;
.vector avelocity6;
.float wait1;
.float wait2;
.float wait3;
.float wait4;
.float wait5;
.float wait6;


void set_view_point(entity player, entity target_entity) {
	msg_entity = player;
	WriteByte(MSG_ONE, SVC_SETVIEW);
	WriteEntity(MSG_ONE, target_entity);
}
