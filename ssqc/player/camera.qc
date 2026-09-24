/*FGD
@PointClass
	size(-16 -16 -16, 16 16 16)
	model("tb/camera.png")
= camera [
	angles(vector) : "Angles" : "0 0 0" : ""
]
*/
void camera() {
	setmodel(self, "");
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


void deactivate_camera() {
	// Deactivate the camera for all players
	entity player = find(world, classname, "player");
	while (player) {
		player.vhud = 0;
		player.active_camera = __NULL__;

		// Reset the client camera
		set_view_point(player, player);

		player = find(player, classname, "player");
	}
	localcmd("set camera_stage 0\n");
}

.entity active_camera;
void update_player_camera(entity current_camera) {
	// called from PlayerPreThink
	// self is the player
	self.cam_org_x = current_camera.origin_x;
	self.cam_org_y = current_camera.origin_y;
	self.cam_org_z = current_camera.origin_z;
	self.cam_ang_x = current_camera.angles_x;
	self.cam_ang_y = current_camera.angles_y;
	self.cam_ang_z = current_camera.angles_z;
}


void assign_camera() {
	// Reki (January 7 2024): Fixed camera controllers all firing as soon as level starts, not waiting until their camera is assigned
	if (self.enemy && !self.enemy.think) {
		self.enemy.think = camera_controller_think;
		self.enemy.nextthink = time;
	}

	entity player = find(world, classname, "player");

	if (!player) {
		self.think = assign_camera;
		self.nextthink = time;
		return;
	}

	while (player) {
		player.vhud = 3;
		player.active_camera = self;

		// Tell the client to update the view
		set_view_point(player, self);

		player = find(player, classname, "player");
	}

	if (self.wait == -1)
		self.wait = 99999999;

	if (self.target != "") {
		entity next_camera = find(world, targetname, self.target);
		if (next_camera.classname == "camera") {
			next_camera.think = assign_camera;
			next_camera.nextthink = time + self.wait;
		}
		self.think = SUB_Null;
	}
	else {
		self.think = deactivate_camera;
	}

	self.nextthink = time + self.wait;
}


void camera_controller_think() {
	vector camera_velocity;
	vector camera_avelocity;
	float nexttime;

	self.count++;
	if (self.count == 1) {
		camera_velocity = self.owner.velocity1;
		camera_avelocity = self.owner.avelocity1;
		nexttime = self.owner.wait1;
	}
	else if (self.count == 2) {
		camera_velocity = self.owner.velocity2;
		camera_avelocity = self.owner.avelocity2;
		nexttime = self.owner.wait2;
	}
	else if (self.count == 3) {
		camera_velocity = self.owner.velocity3;
		camera_avelocity = self.owner.avelocity3;
		nexttime = self.owner.wait3;
	}
	else if (self.count == 4) {
		camera_velocity = self.owner.velocity4;
		camera_avelocity = self.owner.avelocity4;
		nexttime = self.owner.wait4;
	}
	else if (self.count == 5) {
		camera_velocity = self.owner.velocity5;
		camera_avelocity = self.owner.avelocity5;
		nexttime = self.owner.wait5;
	}
	else if (self.count == 6) {
		camera_velocity = self.owner.velocity6;
		camera_avelocity = self.owner.avelocity6;
		nexttime = self.owner.wait6;
	}
	else {
		self.owner.enemy = world;  // remove the controller from the camera
		remove(self);
		return;
	}

	if (cvar("developer") > 0)
		localcmd(sprintf("set camera_stage %s\n", ftos(self.count)));

	self.owner.velocity = camera_velocity;
	self.owner.avelocity = camera_avelocity;
	self.think = camera_controller_think;
	self.nextthink = time + nexttime;
}
