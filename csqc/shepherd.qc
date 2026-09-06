const float shepherd_positions = 6;
const float shepherd_blendtime = 0.3;
.float frame_pose;
.float frame_nextcheck;
.float frame_dir;

void place_shepherd_predraw(void)
{
	if (self.frame_pose & 0x80) // fade out!
	{
		self.effects = EF_DOUBLESIDED | EF_ADDITIVE;
		self.colormod = '0.8 0.5 0.3';
		self.alpha = max(0.001, self.alpha - (frametime * 5));
		if (self.alpha < 0.01)
			self.effects |= EF_NODRAW;
		return;
	}

	self.alpha = 1;
	self.colormod = 0;
	self.effects = 0;

	float f_dir = bound(0, 2 + self.frame_dir, 5);
	float f_pose = 0;//self.frame_pose & (0x3F);

	if (self.frame_pose & 0x40) // we should try to face the outlander
	{
		vector cam_diff = getpropertyvec(VF_ORIGIN) - self.origin;
		if (vlen(cam_diff) < 512 && vlen(cam_diff) > 64)
		{
			float ang_to = vectoangles(cam_diff)[1];
			float ang_diff = angle_difference(ang_to, self.angles[1]);
			if (fabs(ang_diff) > 130)
				ang_diff = 0;

			ang_diff += 90;
			ang_diff = bound(0, ang_diff, 180);
			f_dir = round(ang_diff / 45);
		}
	}

	float old_dir = self.frame % shepherd_positions;
	float old_pose = floor(self.frame / shepherd_positions);

	if (old_dir != f_dir)
	{
		float diff = fabs(old_dir - f_dir);
		if (diff > 1)
			f_dir = old_dir - sign(old_dir - f_dir);
	}

	if (((old_dir != f_dir) || (old_pose != f_pose)) && (time >= self.frame_nextcheck))
	{
		self.frame_nextcheck = time + shepherd_blendtime;

		self.lerpfrac = 1;
		self.frame2 = self.frame;
		self.frame = (f_pose * shepherd_positions) + f_dir;

		if (old_pose != f_pose) // new pose, so new anim time
		{
			self.frame2time = self.frame1time;
			self.frame1time = time;
		}
	}

	if (self.lerpfrac > 0)
	{
		self.lerpfrac -= frametime * (1 / shepherd_blendtime);
		self.lerpfrac = max(0, self.lerpfrac);
	}
}

void EntUpdate_place_shepherd(float is_new)
{
	float sendflags = ReadByte();

	if (sendflags & 0x01)
	{
		setorigin(self, ReadVectorL());
		self.angles = ReadVectorA();
	}

	if (sendflags & 0x02)
	{
		self.frame_dir = ReadShort();
		self.frame_pose = ReadShort();
		self.skin = ReadByte();
	}

	if (self.classname != "place_shepherd")
		is_new = TRUE;

	if (is_new)
	{
		self.classname = "place_shepherd";
		precache_model("models/enemies/shepherd/shepherd.md3");
		setmodel(self, "models/enemies/shepherd/shepherd.md3");
		//self.frame1time = time;
		self.alpha = 1;

		self.predraw = place_shepherd_predraw;
		self.drawmask = MASK_NORMAL;
	}
}
