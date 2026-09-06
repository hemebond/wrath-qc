/*FGD
@SolidClass
	color(0.5 0.0 0.5)
= trigger_jumppad : "Players that touch this will jump in the direction of the targetted target_position" [
	angles(vector) : "Angles" : "0 0 0" : ""
	target(target_destination) : "Target" : : "point target, destination of the jump"
	speed(float) : "Speed" : "1000" : "the speed thrown forward. default is 1000"
	stoptime(float) : "No input Time" : "0" : "how much time inputs for player will be deactived, 0 value forces a frikfiked value"
]
*/


float PUSH_ONCE = 1;
float PUSH_SILENT = 2;
.vector oldvelocity;
.float pushltime;
.float monsterjump;


void trigger_jumppad() {
	if (self.angles != '0 0 0')
		SetMovedir();

	self.solid = SOLID_TRIGGER;
	setmodel(self, self.model);
	self.movetype = MOVETYPE_NONE;
	self.use = toggle_use;

	if (!self.using)
		self.using = 1;

	self.touch = trigger_jumpad_touch;

	// check if this is a jump pad
	if (self.target != "") {
		self.think = trigger_jumpad_findtarget;
		self.nextthink = time + 0.2;
	}
	else {
		// normal push setup
		if (!self.speed)
			self.speed = 1000;
		self.movedir = self.movedir * self.speed * 10;
	}
}


void trigger_jumpad_findtarget() {
	self.enemy = find(world, targetname, self.target);
	if (!self.enemy) {
		objerror("trigger_push: target not found\n");
		remove(self);
	}
}


void trigger_jumpad_touch() {
	if (other.nojump == 1)
		return;
		
	if(!self.stoptime)	
		other.stoptime = time + jumpad_noinput_time;	
	else
		other.stoptime = time +self.stoptime;

	other.lungefree = time + 2;
	
	if(!(other.flags & FL_IGNOREINPUT))
		other.flags += FL_IGNOREINPUT;

	other.hardstoptime = other.stoptime;

	if (self.using != 1)
		return;

	if (!self.monsterjump) {
		if (
			other.classname != "player" &&
			other.classname != "corpse" &&
			other.classname != "body" &&
			other.classname != "gib" &&
			other.classname != "missile"
			&& other.classname != "casing" &&
			other.classname != "grenade" &&
			other.classname != "plasma"
		)
			return;
	}
	else {
		if (!(other.flags & FL_MONSTER)) {
			if (self.monsterjump == 2)
				return;
			else
				if (
					other.classname != "player" &&
					other.classname != "corpse" &&
					other.classname != "body" &&
					other.classname != "gib" &&
					other.classname != "missile" &&
					other.classname != "casing" &&
					other.classname != "grenade" &&
					other.classname != "plasma"
				)
					return;
		}
	}

	if (!self.target) {
		other.velocity = self.movedir;
		other.flags = other.flags - (other.flags &FL_ONGROUND);
		return;
	}

	vector org = other.origin;

	// figure out how long it will take to hit the point considering gravity
	float grav = cvar("sv_gravity");
	float flighttime = sqrt((self.enemy.origin_z - org_z) / (0.5 * grav));
	if (!flighttime)
		return;

	// how far in X and Y to move
	self.movedir = (self.enemy.origin - org);
	self.movedir_z = 0;
	float dist = vlen(self.movedir);

	// finally calculate the velocity
	self.movedir = normalize(self.movedir) * (dist / flighttime);
	self.movedir_z = flighttime * grav;

	other.flags = other.flags - (other.flags & FL_ONGROUND);
	// reset tracking of oldvelocity for impact damage (sudden velocity changes)
	other.oldvelocity = other.velocity = self.movedir;
	// reset tracking of who pushed you into a hazard (for kill credit)
	other.pushltime = 0;

	if (other.classname == "missile")
		other.angles = vectoangles(other.velocity);

	if (self.spawnflags & PUSH_ONCE) {
		self.touch = SUB_Null;
		self.think = SUB_Remove;
		self.nextthink = time;
	}
}
