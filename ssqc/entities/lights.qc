float START_OFF = 1;


/*FGD
@PointClass base(TargetName) color(.8 .8 .8) size(-8 -8 -8, 8 8 8) = info_null : "Used as a positional target for light entities to create a spotlight effect. A target_position can be used instead of this but was kept in Q3A for legacy purposes." []
*/
void info_null() {
	remove(self);
}


/*FGD
@PointClass base(TargetName) color(.8 .8 .8) size(-8 -8 -8, 8 8 8) = info_notnull : "Used as a positional target for entities that can use directional pointing. A target_position can be used instead of this but was kept in Q3A for legacy purposes." []
*/
void info_notnull() {}


/*FGD
@PointClass color(0 0.7 0.3) size(-6 -6 -6, 6 6 6) = lightJunior : "Non-displayed point light source THAT ONLY AFFECTS ENTITIES (lightgrid). The -pointscale and -scale arguments to Q3Map2 affect the brightness of these lights. The -skyscale argument affects brightness of entity sun lights." [
	// -------- Q3MAP2 KEYS --------
	_light(float) : "Light Intensity" : "300" : "Overrides the default 300 intensity. Negative values may be used for negative lights."
	_color(color1) : "Light Color" : "1 1 1" : "Weighted RGB value of light color (default 1.0 1.0 1.0 = white)."
	target(target_destination) : "Target" : : "Lights pointed at a target will be spotlights."
	radius(float) : "Spotlight Radius" : "64" : "Overrides the default 64 unit radius of a spotlight at the target point."
	_sun(boolean) : "Sun" : : "Set this key to 1 on a spotlight to make an infinite sun light."
	fade(float) : "Linear Fade" : "1" : "Fades light attenuation. Only affects linear lights."
	scale(float) : "Intensity Scale" : "1" : "Scales light attenuation, from SOF2/JK2. Scales the `light` value."

	spawnflags(flags) = [
		1 : "Linear Falloff" : 0 : "Use a linear falloff. Default is inverse distance squared (more realistic)."
		2 : "No Angle Attenuation" : 0 : "Ignore angle attenuation."
		16 : "Not Dynamic" : 0 : "Do not affect the lightgrid (dynamic entity lighting)."
	]
]
*/

void() light_use = { if (self.spawnflags &START_OFF)
	{
		lightstyle(self.style, "m");
		self.spawnflags = self.spawnflags - START_OFF;
	}
	else
	{
		lightstyle(self.style, "a");
		self.spawnflags = self.spawnflags + START_OFF;
	}
};


void() lightstyles_count =
{
	if (self.count == 25)
		lightstyle(self.style, "z");
	if (self.count == 24)
		lightstyle(self.style, "y");
	if (self.count == 23)
		lightstyle(self.style, "x");
	if (self.count == 22)
		lightstyle(self.style, "w");
	if (self.count == 21)
		lightstyle(self.style, "v");
	if (self.count == 20)
		lightstyle(self.style, "u");
	if (self.count == 19)
		lightstyle(self.style, "t");
	if (self.count == 18)
		lightstyle(self.style, "s");
	if (self.count == 17)
		lightstyle(self.style, "r");
	if (self.count == 16)
		lightstyle(self.style, "q");
	if (self.count == 15)
		lightstyle(self.style, "p");
	if (self.count == 14)
		lightstyle(self.style, "o");
	if (self.count == 13)
		lightstyle(self.style, "n");
	if (self.count == 12)
		lightstyle(self.style, "m");
	if (self.count == 11)
		lightstyle(self.style, "k");
	if (self.count == 10)
		lightstyle(self.style, "j");
	if (self.count == 9)
		lightstyle(self.style, "i");
	if (self.count == 8)
		lightstyle(self.style, "h");
	if (self.count == 7)
		lightstyle(self.style, "g");
	if (self.count == 6)
		lightstyle(self.style, "f");
	if (self.count == 5)
		lightstyle(self.style, "e");
	if (self.count == 4)
		lightstyle(self.style, "d");
	if (self.count == 3)
		lightstyle(self.style, "c");
	if (self.count == 2)
		lightstyle(self.style, "b");
	if (self.count == 1)
		lightstyle(self.style, "a");
};



void() fade_light_boss = {

	lightstyles_count();

	if (self.count == 1)
	{
		self.think = SUB_Remove;
		self.nextthink = time;
		return;
	}
	
	
	self.count --;
	self.think = fade_light_boss;
	self.nextthink = time + 0.075;
};

void() fade_light = 
{

	lightstyles_count();

	if (self.count == 25)
	{
		self.think = SUB_Null;
		self.nextthink = time + 10;
	}


	self.count += 1;
	self.think = fade_light;
	self.nextthink = time + (self.time_fade / 12);
};

.string targetfade;
void() boss_light =
{
	setmodel(self,"");

	if(!self.style)
		self.style = 17;

	if(!self.count)
		self.count = 12;

	if (!self.targetname)
	{
		// inert light
		remove(self);
		return;
	}

	if ((self.style == 17) || (self.style == 18) ||(self.style == 19))
	{
		self.use = fade_light_boss;
	}
	else
		remove(self);

};


/*FGD
@PointClass
	color(.65 .65 1)
	size(-8 -8 -8, 8 8 8)
= light : "Non-displayed point light source. The -pointscale and -scale arguments to Q3Map2 affect the brightness of these lights. The -skyscale argument affects brightness of entity sun lights." [
	// -------- Q3MAP2 KEYS --------
	light(float) : "Light Intensity" : "300" : "Overrides the default 300 intensity. Negative values may be used for negative lights."
	_color(color1) : "Light Color" : "1 1 1" : "Weighted RGB value of light color (default 1.0 1.0 1.0 = white)."
	target(target_destination) : "Target" : : "Lights pointed at a target will be spotlights."
	radius(float) : "Spotlight Radius" : "64" : "Overrides the default 64 unit radius of a spotlight at the target point."
	_sun(boolean) : "Sun" : : "Set this key to 1 on a spotlight to make an infinite sun light."
	fade(float) : "Linear Fade" : "1" : "Fades light attenuation. Only affects linear lights."
	scale(float) : "Intensity Scale" : "1" : "Scales light attenuation, from SOF2/JK2. Scales the `light` value."
	_deviance(float) : "Penumbra Deviance" : "0" : "Penumbra effect - distance measured in world units for point/spot lights, and degrees for suns (~0.5-3)."
	_samples(float) : "Penumbra Samples" : "1" : "Penumbra effect - the number of random jitters distributed over the solid arc (~16)."
	_filter(boolean) : "Lightmap Filtering" : : "Set this key to 1 to toggle on lightmap filtering."
	_filterradius(float) : "Filter Radius" : : "Filters lightmaps within set radius."
	_anglescale(float) : "Light Attenuation Scale" : "1" : "Scales light attenuation. Smaller values lessens angle attenuation, larger values for sharper, more faceted lighting (default 1.0)."
	style(integer) : "Light Style Index" : : "Light style index number associated with worldspawn light style. Values are between 1 and 31."

	spawnflags(flags) = [
		1 : "Linear Falloff" : 0 : "Use a linear falloff. Default is inverse distance squared (more realistic)."
		2 : "No Angle Attenuation" : 0 : "Ignore angle attenuation."
		16 : "Not Dynamic" : 0 : "Do not affect the lightgrid (dynamic entity lighting)."
	]
]
*/
void() light = 
{ 
	if (!self.time_fade)
		self.time_fade = 0.5;
	if (self.style == 16) {
		self.targetname = self.targetfade;
		self.use = fade_light;
		self.count = 1;
	}
	if (!self.targetname) {
		// inert light
		remove(self);
		return;
	}
	// FIXME: This is invalid for q3bsp
	if (self.style >= 32) {
		self.use = light_use;

		if (self.spawnflags & START_OFF)
			lightstyle(self.style, "a");

		else
			lightstyle(self.style, "m");
	}
};

void() light_fluoro = { if (self.style >= 32)
	{
		self.use = light_use;

		if (self.spawnflags &START_OFF)
			lightstyle(self.style, "a");

		else
			lightstyle(self.style, "m");
	}

	precache_sound("ambience/fl_hum1.wav");
	ambientsound(self.origin, "ambience/fl_hum1.wav", 0.5, ATTN_STATIC);
};

void() light_fluorospark = { if (!self.style)
		self.style = 10;
	precache_sound("ambience/buzz1.wav");
	ambientsound(self.origin, "ambience/buzz1.wav", 0.5, ATTN_STATIC);
};

void() light_globe = { precache_model("progs/s_light.spr");
	setmodel(self, "progs/s_light.spr");
	makestatic(self);
};

void() FireAmbient = { precache_sound("ambience/fire1.wav");
	ambientsound(self.origin, "ambience/fire1.wav", 0.5, ATTN_STATIC);
};

void() light_torch_small_walltorch = { precache_model("progs/flame.mdl");
	setmodel(self, "progs/flame.mdl");
	FireAmbient();
	makestatic(self);
};

void() light_flame_large_yellow = { precache_model("progs/flame2.mdl");
	setmodel(self, "");
	self.frame = 1;
	FireAmbient();
};

void() light_flame_small_yellow = { precache_model("progs/flame2.mdl");
	setmodel(self, "");
	FireAmbient();
};

void() light_flame_small_white = { precache_model("progs/flame2.mdl");
	setmodel(self, "");
	FireAmbient();
};
