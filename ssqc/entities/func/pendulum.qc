void() func_pendulum_touch =
{

	if (other.takedamage)
	{
		if (self.attack_finished < time)
		{
			T_Damage (other, self, self, random(160,320));

			vector fixed_vel;

			fixed_vel_x = self.owner.avelocity_x * -1;
			fixed_vel_y = self.owner.avelocity_z;

			other.velocity = fixed_vel * 1.25;
			other.velocity_z += random(192,256);
			self.attack_finished = time + 0.1;

			vector org = other.origin + '0 0 20';
			SpawnBlood(org, '0 0 0', 32, BLOOD_NORMAL, 0);
			SpawnGib(org + randomvector('-5 -5 8','5 5 16'),randomvector('-48 -48 32','48 48 192'));


			vector vsize =  self.owner.absmax - self.owner.absmin;
			vector vorg;
			vorg_z =  vsize_z * 0.35;
			setorigin (self,self.origin - vorg);

		}
	}
};

void() func_pendulum_blocked =
{
	vector vsize =  self.absmax - self.absmin;
	vector vorg;
	vorg_z =  vsize_z * 0.35;
	setorigin (self.pipes, self.origin - vorg);

};
void() func_pendulum_think=
{


	self.count ++;

	if (self.cnt == 1)
	{
		float avelinc = 1 - (self.count / (self.oldwait / 4));
		if (avelinc <= 0)
		{
			self.count = 0;
			self.cnt = 2;
		}
	}
	if (self.cnt == 2)
	{
		avelinc = 0 + (self.count / (self.oldwait / 4)) * -1;
		if (avelinc <= -1)
		{
			self.count = 0;
			self.cnt = 3;
			vector vsize =  self.absmax - self.absmin;
			vector vorg;
			vorg_z =  vsize_z * 0.35;
			setorigin(self.pipes, self.origin - vorg);

		}
	}
	if (self.cnt == 3)
	{
		avelinc =  (1 - (self.count / (self.oldwait / 4))) * -1;
		if (avelinc >= 0)
		{
			self.count = 0;
			self.cnt = 4;
		}
	}
	if (self.cnt == 4)
	{
		avelinc = 0 + (self.count / (self.oldwait / 4));
		if (avelinc >= 1)
		{
			self.count = 0;
			self.cnt = 1;
			vsize =  self.absmax - self.absmin;
			vorg_z =  vsize_z * 0.35;
			setorigin(self.pipes, self.origin - vorg);

		}
	}

	self.avelocity_x = self.rot_angles_x * avelinc * (2 * (1 / self.wait));
	self.avelocity_y = self.rot_angles_y * avelinc * (2 * (1 / self.wait));
	self.avelocity_z = self.rot_angles_z * avelinc * (2 * (1 / self.wait));


	self.think = func_pendulum_think;
	self.nextthink = self.ltime + 0.05;
	//self.nextthink = time + 0.05;
};

void() func_prependulum_think =
{
	self.angles_x = self.rot_angles_x / (20 / (1 / self.wait));
	self.angles_y = self.rot_angles_y / (20 / (1 / self.wait));
	self.angles_z = self.rot_angles_z / (20 / (1 / self.wait));
	self.think = func_pendulum_think;
	self.nextthink = self.ltime + 0.1;
	//self.nextthink = time + 0.1;
};

void field_pendulum_think() {
	vector fixed_vel;

	float vel_x_size = self.owner.absmax_x - self.owner.absmin_x * 0.0015;
	float vel_y_size = self.owner.absmax_y - self.owner.absmin_y * 0.0015;

	fixed_vel_x = self.owner.avelocity_x * -1* 1.25;
	fixed_vel_y = self.owner.avelocity_z * 1.25;


	self.velocity = fixed_vel;
	self.think = field_pendulum_think;
	self.nextthink = time + 0.05;
}


void() func_pendulum =
{
	setmodel (self, self.model);
	if (!self.rot_angles)
		self.rot_angles = '90 0 0';
	if (!self.wait)
		self.wait = 0.5;
	self.blocked =  func_pendulum_blocked;
	self.count = 0;
	self.cnt = 1;
	self.oldwait = (self.wait / 0.05) * 4;

	self.movetype = MOVETYPE_PUSH;
	self.solid = SOLID_BSP;
	self.think = func_prependulum_think;
	self.nextthink = self.ltime + 0.1;

	entity field = spawn();
	field.touch = func_pendulum_touch;

	vector vsize =  self.absmax - self.absmin;

	vector vorg;
	vorg_z =  vsize_z * 0.35;
	setorigin (field,self.origin - vorg);
	setsize (field,vsize *  -0.5,vsize * 0.5 );
	field.solid = SOLID_TRIGGER;
	field.movetype = MOVETYPE_NOCLIP;
	self.pipes = field;
	field.owner = self;
	field.think = field_pendulum_think;
	field.nextthink = time + 0.1;
};
