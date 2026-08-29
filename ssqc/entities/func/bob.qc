void() bob_blocked = 
{
	if(self.cnt == 1)
		self.cnt = 0;
	else
		self.cnt = 1;
};
void() func_bob_next =
{

	if(self.owner.using == 1)
	{
		setorigin(self, self.owner.origin);

		float dist;

		if(self.owner.cnt == 1)
		{
			dist = vlen (self.owner.ldtdest - self.owner.origin);
			self.owner.velocity = normalize(self.owner.ldtdest - self.owner.origin);
			if( dist < 10)
				self.owner.cnt = 0;
		}
		else
		{
			dist = vlen (self.owner.oldorigin - self.owner.origin);
			self.owner.velocity = normalize(self.owner.oldorigin  - self.owner.origin) ;
			if( dist < 10)
				self.owner.cnt = 1;
		}

		float vfactor = 0.0125 * self.owner.count;

		if (dist < self.owner.distancetotarget)
		{	 
			if (self.owner.speed > (200/20))
				self.owner.speed = self.owner.speed * (1 - (vfactor / 1.5) );
		}
		else
		{
			if(self.owner.speed < self.owner.maxspeed)	
				self.owner.speed = self.owner.speed * (1 + vfactor);
		}
		self.owner.velocity = self.owner.velocity * self.owner.speed;
	}
	else
		self.owner.velocity = '0 0 0';

	self.think = func_bob_next;
	self.nextthink = time + 0.0125;
};

void() func_bob_find = 
{ 
	entity targ = find(world, targetname, self.target);
	self.ldtdest = targ.origin;
	targ = find(world, targetname, self.target2);
	self.oldorigin = targ.origin;
	float dist = vlen (self.oldorigin - self.ldtdest);
	if ((self.distancetotarget) > (dist * 0.5))
		self.distancetotarget = dist * 0.5;

	entity velocity_controller = spawn();
	setmodel(velocity_controller,"");
	velocity_controller.movetype = MOVETYPE_NOCLIP;
	velocity_controller.owner = self;
	velocity_controller.think = func_bob_next;
	velocity_controller.nextthink = time + 0.1;
	self.nextthink = self.ltime + 999999999;
	self.think = SUB_Null;
};

void() func_bob =
{
	if(!self.speed)
		self.speed = 512;
	if(!self.using)
		self.using = 1;
	self.maxspeed =  self.speed;
	if(!self.distancetotarget)
		self.distancetotarget = 128;	
	if (!self.count)	
		self.count = 2;	
	if(self.count < 1)
		self.count = 1;
	self.blocked = bob_blocked;
	self.cnt = 1;
	self.solid = SOLID_BSP;
	self.movetype = MOVETYPE_PUSH;
	self.use = toggle_use;
	setmodel (self, self.model);
	setsize (self, self.mins , self.maxs);
	self.think = func_bob_find;
	self.nextthink = self.ltime + 0.1;
};
