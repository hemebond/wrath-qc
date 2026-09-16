/*FGD
@PointClass
	color(.8 .6 .4)
	size(-8 -8 -8, 8 8 8)
	model({{
		model -> model, "models/misc/chain.md3"
	}})
= info_chain : "Procedural hanging chain." [
	target(target_destination) : "Target" : : "Target this to an info_notnull"
	height(float) : "Height" : : "Relative height of chain curve ( slack )"
	offset_angle(float) : "Offset Angle"
	scale(float) : "Scale" : : "Scale of chain models"
	lip(float) : "Lip" : "0" : "Adds or subtracts links from end of the chain"
	auto_angle(integer) : "Auto Angle" : 0
	tag_name(string) : "Tag Name" : "tag_chain"
]
*/


.entity lastchain;
.float arch;
.float c_radius;
.float c_angle;
.float c_dist;
.float offset_angle;
.float origin_offset_angle;
.float chain_angle;
.float fspawnflags;


void info_chain() {
	if (self.model == "") {
		self.model = "models/misc/chain.md3";
	}

	precache_model(self.model);
	setmodel(self, self.model);

	self.classname = "chained_model";

	if(self.auto_angle == 0)
		self.auto_angle = 0;
	else if(!self.auto_angle)
		self.auto_angle = 90;

	self.solid = TRUE;
	if(!self.scale)
		self.scale = 1;

	if (!(self.tag_name))
		self.tag_name = "tag_chain";

	if (!self.fspawnflags)
		self.fspawnflags = 7;

	self.think = info_chain_think;
	self.nextthink = (time + 0.05);
}


.float auto_angle;
void info_chain_think() {
	entity t = find(world, targetname, self.target);
	float r_dist = (vlen((self.origin - t.origin)));
	self.lastchain = self;
	self.angles = vectoangles(normalize((self.origin - t.origin)));
	float firstchain = 1;
	self.c_dist = r_dist;
	self.height = self.height * self.scale;// //max(t.origin_z , self.origin_z) - min(t.origin_z , self.origin_z);

	if (self.height > r_dist)
		self.height = r_dist -1;


	if (self.height) {
		//float c_radius; // diametro
		self.c_radius = (((r_dist/2) * (r_dist/2)) / self.height) + self.height;
		self.c_radius =  self.c_radius * 0.5;

		float cathetus_op = r_dist / 2;
		self.c_angle =   asin(cathetus_op / self.c_radius)* RAD2DEG;

		self.arch = (PI * self.c_angle * (self.c_radius))/ 180;
		self.count = floor (r_dist) / 4.8;
		firstchain = 0;
		self.chain_angle =  self.c_angle / self.count;
	}
	else {
		self.count = floor (r_dist) / 5;
	}

	self.cnt = self.c_angle;
	self.chain_angle = self.chain_angle * 1.4 + (self.offset_angle / 10);
	self.count = self.count / self.scale + self.lip;

	while (self.count > 0) {
		entity chain = spawn();
		chain.owner = self;
        	chain.classname = "chained_model";
		setmodel(chain, self.model);

		vector altangles;
		altangles_z =  self.auto_angle;
		chain.angles = (self.lastchain.angles + altangles);
		chain.scale = self.scale;
		chain.fspawnflags = self.fspawnflags;

		if (firstchain == 0) {
			firstchain = 1;
			chain.angles_x += self.chain_angle * (self.count * 0.5) + self.origin_offset_angle;
		}
		else
		chain.angles_x -= self.chain_angle;
		chain.origin = tag_origin(self.tag_name, self.lastchain);
		self.lastchain = chain;
		self.count--;
		chain.think = chain_makestatic;
		chain.nextthink = time + 0.5;
	}

	self.think = chain_makestatic;
	self.nextthink = time + 0.5;
}


void chain_makestatic() {};


void generate_map_chain() {
	float writeparms = fopen("misc_model.map", FILE_WRITE);    //open what file to use in write mode
	fputs(writeparms, "{\n");
	fputs(writeparms, "\"classname\" \"worldspawn\"");
	fputs(writeparms, "\n");
	fputs(writeparms, "}");
	fputs(writeparms, "\n");                    //dont forget this
	fclose(writeparms);


	entity chain_model = nextent(world);
	while (chain_model) {
		entity holder = nextent(chain_model);

		if (chain_model.classname == "chained_model") {
			writeparms = fopen ("misc_model.map", FILE_APPEND);    //open what file to use in write mode

			//chain_model.angles_x = chain_model.angles_x * -1;

			fputs(writeparms, "{\n");
			fputs(writeparms, "\"classname\" \"misc_model\"\n");
			fputs(writeparms, strcat("\"origin\"","\"",ftos(chain_model.origin_x)," " ,ftos(chain_model.origin_y)," " ,ftos(chain_model.origin_z),"\"\n"));
			fputs(writeparms, strcat("\"angles\"","\"",ftos(chain_model.angles_x * -1)," ",ftos(chain_model.angles_y)," " ,ftos(chain_model.angles_z),"\"\n"));
			fputs(writeparms, "\"model\" \"models/misc/chain.md3\"\n");
			fputs(writeparms,strcat(( "\"spawnflags\" \""),ftos(chain_model.fspawnflags),("\"\n")));
			fputs(writeparms, strcat("\"modelscale\" \"",ftos(chain_model.scale),"\"\n"));
			fputs(writeparms, "}\n");
			fclose(writeparms);
		}
		chain_model = holder;
	}
}
