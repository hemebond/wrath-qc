.float viewer_deviance;
.float timeangles3;
.float jumptime;

/*FGD
@SolidClass
	color(0.5 0.0 0.5)
= trigger_monsterjump : "Walking monsters that touch this will jump in the direction of the trigger's angle." [
	angle(float) : "Direction" : : "angle towards the monster jumps"
	speed(float) : "Speed" : "200" : "the speed thrown forward. default is 200"
	height(float) : "Height" : "200" : "the speed thrown upwards. default is 200"
	viewer_deviance(float) : "Angles Deviance" : "0" : "if value is > 0, trigger will work if enemy of monster is infront of the trigger, the angles are the value of the `infront` value, 120 is a regular value"
	count(integer) : "Count" : 0 : "if value is > 0 number of uses avaible for the trigger"
	type(integer) : "Type" : 0 : "1 = trigger will work only if enemy is under the monster, 2 = trigger will work only if enemy is above the monster"
]
*/
void trigger_monsterjump() {
	if (!self.speed)
		self.speed = 200;
	if (!self.height)
		self.height = 200;
	if (self.angles == '0 0 0')
		self.angles = '0 360 0';
	if(self.count > 0)
	self.cnt = 1;
	InitTrigger();
	self.touch = trigger_monsterjump_touch;
};


void trigger_monsterjump_touch() {
	if (other.flags &(FL_MONSTER | FL_FLY | FL_SWIM) != FL_MONSTER)
		return;

	if(other.jumptime > time)
	return;
	//float(entity targ, vector viewerangles,vector viewerorigin,float viewerdeviance) custom_infront
	if (self.viewer_deviance != 0)
	{
		float activejump = custom_infront (other.enemy, self.angles,((self.absmin + self.absmax) * 0.5),self.viewer_deviance);
		if(!activejump)
			return;
	}
	if(self.type == 1)
	{
		if((other.enemy.origin_z - other.origin_z) > 8)
		return;
	}

	if(self.type == 2)
	{
		if((other.origin_z - other.enemy.origin_z) > 8)
		return;
	}
	other.timeangles3 = time + 3;
	// set XY even if not on ground, so the jump will clear lips
	other.velocity_x = self.movedir_x *self.speed;
	other.velocity_y = self.movedir_y *self.speed;
	if (!(other.flags &FL_ONGROUND))
		return;
	other.flags = other.flags - FL_ONGROUND;
	other.velocity_z = self.height;
	other.jumptime = time + self.wait;
	if(self.cnt == 1)
	{
		self.count --;
		if (self.count <= 0)
			remove(self);
	}
}
