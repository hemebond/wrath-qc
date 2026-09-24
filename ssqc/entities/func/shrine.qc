.entity lightson;


/*FGD
@SolidClass color(0 .4 1) = func_shrine [
    targetname(target_source) : "Target Name" : "" : "targetname is required to attach misc_model of shrine."
]
*/
void func_shrine() {
	self.solid = SOLID_BSP;
	setmodel(self, self.model);

	self.use = func_shrine_preuse;
	self.colormod = '1 1 1';
	self.glowmod = '1 1 1';

	entity pointlight = spawn();
	pointlight.origin = (self.absmin + self.absmax) / 2;
	pointlight.color = '1 1 1';
	pointlight.light_lev = 192;
	pointlight.pflags = 129;
	pointlight.style = 0;
	self.lightson = pointlight;

	entity shrine_field = spawn();
	shrine_field.owner = self;
	setmodel(shrine_field, self.model);
	vector shrinefieldorg = (self.absmin + self.absmax) * 0.5;
	shrinefieldorg_z = self.absmin_z;
	shrine_field.origin = shrinefieldorg;
	setsize(shrine_field ,'-62 -62 0', '62 62 192');

	shrine_field.touch = trigger_shrine_touch;
	shrine_field.target = self.target;
	shrine_field.solid = SOLID_TRIGGER;
	shrine_field.modelindex = 0;
	shrine_field.model = string_null;
}


void func_shrine_preuse() {
	self.glowmod = '2 2 2';
	self.think = func_shrine_use;
	self.nextthink = time + 0.05;
}


void func_shrine_use() {
	if(self.glowmod_x > 1)
		self.glowmod = '0.95 0.95 0.95';
	self.lightson.light_lev -= 3;

	self.colormod_x -= 0.0125;
	self.colormod_y -= 0.013;
	self.colormod_z -= 0.015;

	self.glowmod_x -= 0.025;
	self.glowmod_y -= 0.025;
	self.glowmod_z -= 0.025;

	if(self.glowmod_x <= 0)
	{
		self.lightson.pflags = 0;
		self.glowmod = '-1 -1 -1';
		self.think = SUB_Null;
	}
	else
		self.think = func_shrine_use;
	self.nextthink = time + 0.05;
}
