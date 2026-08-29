void deactivate_camera() {
	single_player.vhud = 0;
	localcmd("set camera_stage 0\n");
	SetViewPoint(single_player);
}

.entity active_camera;
void UpdateCameras(entity e) {
	single_player.cam_org_x = e.origin_x;
	single_player.cam_org_y = e.origin_y;
	single_player.cam_org_z = e.origin_z;
	single_player.cam_ang_x = e.angles_x;
	single_player.cam_ang_y = e.angles_y;
	single_player.cam_ang_z = e.angles_z;
}


void assign_camera() {
	if (self.enemy && !self.enemy.think) // Reki (January 7 2024): Fixed camera controllers all firing as soon as level starts, not waiting until their camera is assigned
	{
		self.enemy.think = camera_controller_think;
		self.enemy.nextthink = time;
	}

	if(single_player.classname != "player")
	{
		self.think = assign_camera;
		self.nextthink = time;
		return;
	}

	single_player.vhud = 3;
	single_player.active_camera = self;
	SetViewPoint(self);
	if(self.wait == -1)
		self.wait = 99999999;
	if(self.target != "")
	{
		entity next_camera = find (world, targetname, self.target);
		if (next_camera.classname == "camera")
		{
			next_camera.think = assign_camera;
			next_camera.nextthink = time + self.wait;
		}
		self.think = SUB_Null;
	}
	else
		self.think = deactivate_camera;

	self.nextthink = time + self.wait;
}


void camera_controller_think() {
	vector camera_velocity;
	vector camera_avelocity;
	float nexttime;

	self.count ++;
	float dev = cvar("developer");
	if(self.count == 1)
	{
		camera_velocity = self.owner.velocity1;
		camera_avelocity = self.owner.avelocity1;
		nexttime =  self.owner.wait1;
		if (dev == 1)
			localcmd("set camera_stage 1\n");
	}
	else if(self.count == 2)
	{
		camera_velocity = self.owner.velocity2;
		camera_avelocity = self.owner.avelocity2;
		nexttime =  self.owner.wait2;
		if (dev == 1)
			localcmd("set camera_stage 2\n");
	}
	else if(self.count == 3)
	{
		camera_velocity = self.owner.velocity3;
		camera_avelocity = self.owner.avelocity3;
		nexttime = self.owner.wait3;
		if (dev == 1)
			localcmd("set camera_stage 3\n");
	}
	else if(self.count == 4)
	{
		camera_velocity = self.owner.velocity4;
		camera_avelocity = self.owner.avelocity4;
		nexttime = self.owner.wait4;
		if (dev == 1)
			localcmd("set camera_stage 4\n");
	}
	else if(self.count == 5)
	{
		camera_velocity = self.owner.velocity5;
		camera_avelocity = self.owner.avelocity5;
		nexttime = self.owner.wait5;
		if (dev == 1)
			localcmd("set camera_stage 5\n");
	}
	else if(self.count == 6)
	{
		camera_velocity = self.owner.velocity6;
		camera_avelocity = self.owner.avelocity6;
		nexttime = self.owner.wait6;
		if (dev == 1)
			localcmd("set camera_stage 6\n");
	}
	else
	{
		self.owner.enemy = world;
		remove(self);
		return;
	}

	self.owner.velocity = camera_velocity;
	self.owner.avelocity = camera_avelocity;
	self.think	= camera_controller_think;
	self.nextthink = time + nexttime;
}


void camera() {
	setmodel(self,"");
	self.solid = SOLID_TRIGGER;
	self.movetype = MOVETYPE_FLY_WORLDONLY;

	if (!self.wait) {
		self.wait2 = 10;
	}

	if (!self.targetname) {
		self.think = assign_camera;
		self.nextthink = time + 0.1;
	}
	else {
		self.use = assign_camera;
	}

	entity camera_controller = spawn();
	self.enemy = camera_controller;
	setmodel(camera_controller, "");
	camera_controller.effects = 0;
	camera_controller.owner = self;
}
