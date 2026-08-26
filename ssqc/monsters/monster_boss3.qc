#pragma warning disable F328

// Need this ifndef to stop fteqcc choking on the class
#ifndef BOSS3COMPILE
#define BOSS3COMPILE

enum int 
{
boss3_base, boss3_spawn1, boss3_spawn2, boss3_spawn3, boss3_spawn4, boss3_spawn5, boss3_spawn6, boss3_spawn7, boss3_spawn8, boss3_spawn9, boss3_spawn10, boss3_spawn11, boss3_spawn12, boss3_spawn13, boss3_spawn14, boss3_spawn15, boss3_spawn16, boss3_spawn17, boss3_spawn18, boss3_spawn19, boss3_spawn20, boss3_spawn21, boss3_spawn22, boss3_spawn23, boss3_spawn24, boss3_spawn25, boss3_spawn26, boss3_spawn27, boss3_spawn28, boss3_spawn29, boss3_spawn30, boss3_spawn31, boss3_spawn32, boss3_spawn33, boss3_spawn34, boss3_spawn35, boss3_spawn36, boss3_spawn37, boss3_spawn38, boss3_spawn39, boss3_spawn40, boss3_spawn41, boss3_spawn42, boss3_spawn43, boss3_spawn44, boss3_spawn45, boss3_spawn46, boss3_spawn47, boss3_spawn48, boss3_spawn49, boss3_spawn50, boss3_spawn51, boss3_spawn52, boss3_spawn53, boss3_spawn54, boss3_spawn55, boss3_spawn56, boss3_spawn57, boss3_spawn58, boss3_spawn59, boss3_spawn60, boss3_spawn61, boss3_spawn62, boss3_spawn63, boss3_spawn64, boss3_spawn65, boss3_spawn66, boss3_spawn67, boss3_spawn68, boss3_spawn69, boss3_spawn70, boss3_spawn71, boss3_spawn72, boss3_spawn73, boss3_spawn74, boss3_spawn75, boss3_spawn76, boss3_spawn77, boss3_spawn78, boss3_spawn79, boss3_spawn80, boss3_spawn81, boss3_spawn82, boss3_spawn83, boss3_spawn84, boss3_spawn85, boss3_spawn86, boss3_spawn87, boss3_spawn88, boss3_spawn89, boss3_spawn90, boss3_spawn91, boss3_spawn92, boss3_spawn93, boss3_spawn94, boss3_spawn95, boss3_spawn96, boss3_spawn97, boss3_spawn98, boss3_spawn99, boss3_spawn100, boss3_taunt1, boss3_taunt2, boss3_taunt3, boss3_taunt4, boss3_taunt5, boss3_taunt6, boss3_taunt7, boss3_taunt8, boss3_taunt9, boss3_taunt10, boss3_taunt11, boss3_taunt12, boss3_taunt13, boss3_taunt14, boss3_taunt15, boss3_taunt16, boss3_taunt17, boss3_taunt18, boss3_taunt19, boss3_taunt20, boss3_taunt21, boss3_taunt22, boss3_taunt23, boss3_taunt24, boss3_taunt25, boss3_taunt26, boss3_taunt27, boss3_taunt28, boss3_taunt29, boss3_taunt30, boss3_taunt31, boss3_taunt32, boss3_taunt33, boss3_taunt34, boss3_taunt35, boss3_taunt36, boss3_taunt37, boss3_taunt38, boss3_taunt39, boss3_taunt40
};

enum int 
{
boss3b_base, boss3b_walk1, boss3b_walk2, boss3b_walk3, boss3b_walk4, boss3b_walk5, boss3b_walk6, boss3b_walk7, boss3b_walk8, boss3b_walk9, boss3b_walk10, boss3b_walk11, boss3b_walk12, boss3b_walk13, boss3b_walk14, boss3b_walk15, boss3b_walk16, boss3b_walk17, boss3b_walk18, boss3b_walk19, boss3b_walk20, boss3b_flail1, boss3b_flail2, boss3b_flail3, boss3b_flail4, boss3b_flail5, boss3b_flail6, boss3b_flail7, boss3b_flail8, boss3b_flail9, boss3b_flail10, boss3b_flail11, boss3b_flail12, boss3b_flail13, boss3b_flail14, boss3b_flail15, boss3b_summon1, boss3b_summon2, boss3b_summon3, boss3b_summon4, boss3b_summon5, boss3b_summon6, boss3b_summon7, boss3b_summon8, boss3b_summon9, boss3b_summon10, boss3b_summon11, boss3b_summon12, boss3b_summon13, boss3b_summon14, boss3b_summon15, boss3b_summon16, boss3b_summon17, boss3b_summon18, boss3b_summon19, boss3b_summon20, boss3b_summon21, boss3b_summon22, boss3b_summon23, boss3b_summon24, boss3b_summon25, boss3b_summon26, boss3b_summon27, boss3b_summon28, boss3b_summon29, boss3b_summon30, boss3b_summon31, boss3b_summon32, boss3b_summon33, boss3b_summon34, boss3b_summon35, boss3b_summon36, boss3b_summon37, boss3b_summon38, boss3b_summon39, boss3b_summon40, boss3b_summon41, boss3b_summon42, boss3b_summon43, boss3b_summon44, boss3b_summon45, boss3b_summon46, boss3b_summon47, boss3b_summon48, boss3b_summon49, boss3b_summon50
};

enum int 
{
boss3c_base, boss3c_sit1, boss3c_sit2, boss3c_sit3, boss3c_sit4, boss3c_sit5, boss3c_sit6, boss3c_sit7, boss3c_sit8, boss3c_sit9, boss3c_sit10, boss3c_sit11, boss3c_sit12, boss3c_sit13, boss3c_sit14, boss3c_sit15, boss3c_sit16, boss3c_sit17, boss3c_sit18, boss3c_sit19, boss3c_sit20, boss3c_flail1, boss3c_flail2, boss3c_flail3, boss3c_flail4, boss3c_flail5, boss3c_flail6, boss3c_flail7, boss3c_flail8, boss3c_flail9, boss3c_flail10, boss3c_flail11, boss3c_flail12, boss3c_flail13, boss3c_flail14, boss3c_flail15, boss3c_turn1, boss3c_turn2, boss3c_turn3, boss3c_turn4, boss3c_turn5, boss3c_turn6, boss3c_turn7, boss3c_turn8, boss3c_turn9, boss3c_turn10, boss3c_attackr1, boss3c_attackr2, boss3c_attackr3, boss3c_attackr4, boss3c_attackr5, boss3c_attackr6, boss3c_attackr7, boss3c_attackr8, boss3c_attackr9, boss3c_attackr10, boss3c_attackr11, boss3c_attackr12, boss3c_attackr13, boss3c_attackr14, boss3c_attackr15, boss3c_attackr16, boss3c_attackr17, boss3c_attackr18, boss3c_attackr19, boss3c_attackr20, boss3c_attackl1, boss3c_attackl2, boss3c_attackl3, boss3c_attackl4, boss3c_attackl5, boss3c_attackl6, boss3c_attackl7, boss3c_attackl8, boss3c_attackl9, boss3c_attackl10, boss3c_attackl11, boss3c_attackl12, boss3c_attackl13, boss3c_attackl14, boss3c_attackl15, boss3c_attackl16, boss3c_attackl17, boss3c_attackl18, boss3c_attackl19, boss3c_attackl20, boss3c_attackrng1, boss3c_attackrng2, boss3c_attackrng3, boss3c_attackrng4, boss3c_attackrng5, boss3c_attackrng6, boss3c_attackrng7, boss3c_attackrng8, boss3c_attackrng9, boss3c_attackrng10, boss3c_attackrng11, boss3c_attackrng12, boss3c_attackrng13, boss3c_attackrng14, boss3c_attackrng15, boss3c_attackrng16, boss3c_attackrng17, boss3c_attackrng18, boss3c_attackrng19, boss3c_attackrng20
};

enum int 
{
boss3d_base, boss3d_sit1, boss3d_sit2, boss3d_sit3, boss3d_sit4, boss3d_sit5, boss3d_sit6, boss3d_sit7, boss3d_sit8, boss3d_sit9, boss3d_sit10, boss3d_sit11, boss3d_sit12, boss3d_sit13, boss3d_sit14, boss3d_sit15, boss3d_sit16, boss3d_sit17, boss3d_sit18, boss3d_sit19, boss3d_sit20, boss3d_flail1, boss3d_flail2, boss3d_flail3, boss3d_flail4, boss3d_flail5, boss3d_flail6, boss3d_flail7, boss3d_flail8, boss3d_flail9, boss3d_flail10, boss3d_flail11, boss3d_flail12, boss3d_flail13, boss3d_flail14, boss3d_flail15, boss3d_turn1, boss3d_turn2, boss3d_turn3, boss3d_turn4, boss3d_turn5, boss3d_turn6, boss3d_turn7, boss3d_turn8, boss3d_turn9, boss3d_turn10, boss3d_attackr1, boss3d_attackr2, boss3d_attackr3, boss3d_attackr4, boss3d_attackr5, boss3d_attackr6, boss3d_attackr7, boss3d_attackr8, boss3d_attackr9, boss3d_attackr10, boss3d_attackr11, boss3d_attackr12, boss3d_attackr13, boss3d_attackr14, boss3d_attackr15, boss3d_attackr16, boss3d_attackr17, boss3d_attackr18, boss3d_attackr19, boss3d_attackr20, boss3d_attackl1, boss3d_attackl2, boss3d_attackl3, boss3d_attackl4, boss3d_attackl5, boss3d_attackl6, boss3d_attackl7, boss3d_attackl8, boss3d_attackl9, boss3d_attackl10, boss3d_attackl11, boss3d_attackl12, boss3d_attackl13, boss3d_attackl14, boss3d_attackl15, boss3d_attackl16, boss3d_attackl17, boss3d_attackl18, boss3d_attackl19, boss3d_attackl20, boss3d_attackrng1, boss3d_attackrng2, boss3d_attackrng3, boss3d_attackrng4, boss3d_attackrng5, boss3d_attackrng6, boss3d_attackrng7, boss3d_attackrng8, boss3d_attackrng9, boss3d_attackrng10, boss3d_attackrng11, boss3d_attackrng12, boss3d_attackrng13, boss3d_attackrng14, boss3d_attackrng15, boss3d_attackrng16, boss3d_attackrng17, boss3d_attackrng18, boss3d_attackrng19, boss3d_attackrng20, boss3d_mutil1, boss3d_mutil2, boss3d_mutil3, boss3d_mutil4, boss3d_mutil5, boss3d_mutil6, boss3d_mutil7, boss3d_mutil8, boss3d_mutil9, boss3d_mutil10, boss3d_mutil11, boss3d_mutil12, boss3d_mutil13, boss3d_mutil14, boss3d_mutil15, boss3d_mutil16, boss3d_mutil17, boss3d_mutil18, boss3d_mutil19, boss3d_mutil20
};

enum int 
{
boss3e_base, boss3e_sit1, boss3e_sit2, boss3e_sit3, boss3e_sit4, boss3e_sit5, boss3e_sit6, boss3e_sit7, boss3e_sit8, boss3e_sit9, boss3e_sit10, boss3e_sit11, boss3e_sit12, boss3e_sit13, boss3e_sit14, boss3e_sit15, boss3e_sit16, boss3e_sit17, boss3e_sit18, boss3e_sit19, boss3e_sit20, boss3e_flail1, boss3e_flail2, boss3e_flail3, boss3e_flail4, boss3e_flail5, boss3e_flail6, boss3e_flail7, boss3e_flail8, boss3e_flail9, boss3e_flail10, boss3e_flail11, boss3e_flail12, boss3e_flail13, boss3e_flail14, boss3e_flail15, boss3e_turn1, boss3e_turn2, boss3e_turn3, boss3e_turn4, boss3e_turn5, boss3e_turn6, boss3e_turn7, boss3e_turn8, boss3e_turn9, boss3e_turn10, boss3e_attackr1, boss3e_attackr2, boss3e_attackr3, boss3e_attackr4, boss3e_attackr5, boss3e_attackr6, boss3e_attackr7, boss3e_attackr8, boss3e_attackr9, boss3e_attackr10, boss3e_attackr11, boss3e_attackr12, boss3e_attackr13, boss3e_attackr14, boss3e_attackr15, boss3e_attackr16, boss3e_attackr17, boss3e_attackr18, boss3e_attackr19, boss3e_attackr20, boss3e_attackl1, boss3e_attackl2, boss3e_attackl3, boss3e_attackl4, boss3e_attackl5, boss3e_attackl6, boss3e_attackl7, boss3e_attackl8, boss3e_attackl9, boss3e_attackl10, boss3e_attackl11, boss3e_attackl12, boss3e_attackl13, boss3e_attackl14, boss3e_attackl15, boss3e_attackl16, boss3e_attackl17, boss3e_attackl18, boss3e_attackl19, boss3e_attackl20, boss3e_attackrng1, boss3e_attackrng2, boss3e_attackrng3, boss3e_attackrng4, boss3e_attackrng5, boss3e_attackrng6, boss3e_attackrng7, boss3e_attackrng8, boss3e_attackrng9, boss3e_attackrng10, boss3e_attackrng11, boss3e_attackrng12, boss3e_attackrng13, boss3e_attackrng14, boss3e_attackrng15, boss3e_attackrng16, boss3e_attackrng17, boss3e_attackrng18, boss3e_attackrng19, boss3e_attackrng20, boss3e_mutil1, boss3e_mutil2, boss3e_mutil3, boss3e_mutil4, boss3e_mutil5, boss3e_mutil6, boss3e_mutil7, boss3e_mutil8, boss3e_mutil9, boss3e_mutil10, boss3e_mutil11, boss3e_mutil12, boss3e_mutil13, boss3e_mutil14, boss3e_mutil15, boss3e_mutil16, boss3e_mutil17, boss3e_mutil18, boss3e_mutil19, boss3e_mutil20
};

enum int 
{
boss3f_base, boss3f_mutil1, boss3f_mutil2, boss3f_mutil3, boss3f_mutil4, boss3f_mutil5, boss3f_mutil6, boss3f_mutil7, boss3f_mutil8, boss3f_mutil9, boss3f_mutil10, boss3f_mutil11, boss3f_mutil12, boss3f_mutil13, boss3f_mutil14, boss3f_mutil15, boss3f_mutil16, boss3f_mutil17, boss3f_mutil18, boss3f_mutil19, boss3f_mutil20, boss3f_dspin1, boss3f_dspin2, boss3f_dspin3, boss3f_dspin4, boss3f_dspin5, boss3f_dspin6, boss3f_dspin7, boss3f_dspin8, boss3f_dspin9, boss3f_dspin10, boss3f_dspin11, boss3f_dspin12, boss3f_dspin13, boss3f_dspin14, boss3f_dspin15, boss3f_dspin16, boss3f_dspin17, boss3f_dspin18, boss3f_dspin19, boss3f_dspin20, boss3f_dspin21, boss3f_dspin22, boss3f_dspin23, boss3f_dspin24, boss3f_dspin25, boss3f_dspin26, boss3f_dspin27, boss3f_dspin28, boss3f_dspin29, boss3f_dspin30 
};

/* #region Reki rewrite */
.string connect1;
.string connect2;
.string connect3;
.string connect4;
.string connect5;
.string connect6;
.string connect7;
.string connect8;
.float weight;
.float boss_shockwave_time; // for player shockwave effect
class boss3_c;
boss3_c boss3_entity;
float boss3_orb_amount;

void Ent_UseTarget(entity t) // Reki (July 6 2023): these should be unneeded, but to avoid some compiler warnings I separated it out into its own function. Classes are buggy like that. :(
{
	if (!t.use)
		return;
	
	entity o_self = self;
	self = t;
	t.use();
	self = o_self;
}

void Ent_DoTouch(entity t1, entity t2) 
{
	entity o_self = self;
	entity o_other = other;

	if (t2.touch)
	{
		self = t2;
		other = t1;
		self.touch();
	}
	if (t1.touch)
	{
		self = t1;
		other = t2;
		self.touch();
	}

	self = o_self;
	other = o_other;
}

void tempent_expandingorb(vector org, vector color, vector rad, vector alp, float lifetime) // Reki (July 17 2023): expanding orb effect
{
	WriteByte(MSG_ALL, SVC_TEMPENTITY);
	WriteByte(MSG_ALL, TEMPENT::EXPANDING_ORB);
	WriteVectorL(MSG_ALL, org);
	WriteCoord(MSG_ALL, rad[0]);
	WriteCoord(MSG_ALL, rad[1]);
	WriteByte(MSG_ALL, alp[0] * 127);
	WriteByte(MSG_ALL, alp[1] * 127);
	WriteColor(MSG_ALL, color);
	WriteShort(MSG_ALL, lifetime * 100);
}

/* #region pathfinding */

class bossnav_c;
class bosspath_c {
	vector origin;
	bosspath_c to;
	bossnav_c rootnode;

	nonvirtual void() bosspath_c {
		this.classname = "bosspath_c";
		//setmodel(this, "models/dev/node.md3");
	};
};

class bossnav_c {
	bossnav_c connect[8];
	float weight;
	bossnav_c chain_master;

	float gScore;
	float fScore;
	bossnav_c cameFrom;
	bossnav_c chain_openset;

	nonvirtual void() bossnav_c;
	nonvirtual void() destructor;
	nonvirtual void() initialize_targets;
	nonvirtual void() openSet_clear;
	nonvirtual bossnav_c() openSet_pop;
	nonvirtual float() openSet_isEmpty;
	nonvirtual void(bossnav_c) openSet_push;
	nonvirtual float() openSet_isin;

	nonvirtual void() calltargets { // Reki (July 10 2023): We have to wrap this since 'self' is protected inside class member functions
		SUB_UseTargets();
	};
};

bossnav_c nav_list;
bossnav_c nav_openSet;
const .string bn_con[] = {connect1, connect2, connect3, connect4, connect5, connect6, connect7, connect8};

// Open Set
void() bossnav_c::openSet_clear {
	this.gScore = 99999;
	this.fScore = 99999;
	this.chain_openset = 0;
	this.cameFrom = 0;
}
bossnav_c() bossnav_c::openSet_pop {
	bossnav_c node = nav_openSet;
	nav_openSet = node.chain_openset;

	return node;
}
float() bossnav_c::openSet_isEmpty {
	return (nav_openSet == 0);
}
void(bossnav_c node) bossnav_c::openSet_push {
	if (!nav_openSet)
	{
		nav_openSet = node;
		return;
	}
	
	bossnav_c h;
	for(bossnav_c b = nav_openSet; b; h = b, b = b.chain_openset)
	{
		if (b.fScore > node.fScore)
		{
			if !(h)
			{
				nav_openSet = node;
				node.chain_openset = b;
				return;
			}

			h.chain_openset = node;
			node.chain_openset = b;
			return;
		}
	}

	h.chain_openset = node;
}
float() bossnav_c::openSet_isin {
	if (!nav_openSet)
		return FALSE;
	for(bossnav_c b = nav_openSet; b; b = b.chain_openset)
	{
		if (b == this)
			return TRUE;
	}
	return FALSE;
}
//
void() bossnav_c::initialize_targets {
	for(entity e = nextent(world); e; e = nextent(e))
	{
		for(float i = 0; i < 8; i++)
		{
			if (this.connect[i] != world) // we already filled this one in
				continue;

			.string confield = (::bn_con[i]);
			if (!this.confield)
				continue;

			if (strcmp(e.targetname, this.confield))
			{
				dprint(sprintf("%s vs %s\n", e.targetname, this.confield));
				continue;
			}
			
			dprint(sprintf("connected! %s vs %s\n", e.targetname, this.confield));
			this.connect[i] = (bossnav_c)e;
		}
	}
}
void() bossnav_c::bossnav_c {
	// add to chain
	this.chain_master = nav_list;
	nav_list = this;

	if (!this.weight)
		this.weight = 1;

	// set think to initialize targets
	this.think = this.initialize_targets;
	this.nextthink = time + 0.2;
}
void() bossnav_c::destructor {
	// clear from chain and connections
	bossnav_c h, b = nav_list;
	while(b)
	{
		if (b == this)
		{
			h.chain_master = b.chain_master;
			b = b.chain_master;
			remove(this);
			continue;
		}
		b = b.chain_master;
	}
}

bosspath_c(bossnav_c node) bossnav_reconstruct_path
{
	bosspath_c path, hold;
	for(; node; node = node.cameFrom)
	{
		if (path)
			hold = path;
		path = spawn(bosspath_c, origin: node.origin, rootnode: node);
		path.to = hold;
	}

	return path;
}

float bossnav_heuristic(bossnav_c node, bossnav_c goal)
{
	float d = vlen(node.origin - goal.origin) * 1.5;
	return d;
}

bosspath_c(bossnav_c start, bossnav_c goal, float(bossnav_c, bossnav_c) h) bossnav_astar
{
	for(bossnav_c b = nav_list; b; b = b.chain_master)
		b.openSet_clear();
	
	nav_openSet = 0; // clear openset even though it should be clear already
	start.gScore = 0;
	start.fScore = bossnav_heuristic(start, goal);

	start.openSet_push(start);
	
	while(nav_openSet)
	{
		bossnav_c current = start.openSet_pop();
		if (current == goal)
			return bossnav_reconstruct_path(current);

		for(float i = 0; i < 8; i++)
		{
			bossnav_c neighbor = current.connect[i];

			if !(neighbor)
				continue;
			
			float tenative_gScore = current.gScore + (vlen(current.origin - neighbor.origin) * neighbor.weight);
			if (tenative_gScore < neighbor.gScore)
			{
				neighbor.cameFrom = current;
				neighbor.gScore = tenative_gScore;
				neighbor.fScore = tenative_gScore + h(neighbor, goal);
				if !(neighbor.openSet_isin())
					neighbor.openSet_push(neighbor);
			}
		}
	}

	return world;
}

void() spawnfunc_boss_nav
{
	precache_model("models/dev/nodeline.md3");

	spawnfunc_bossnav_c();
	bossnav_c nav = (bossnav_c)self;
}
//
/* #endregion */

/* #region martyrs */

class bossmartyrorb_c {
	float recharge_time;
	float recharge_time_last;
	float recharge_duration;
	float recharge_animation;

	entity halo;
	vector true_origin;

	nonvirtual void() mainloop;
	nonvirtual float(entity to, float sendflags) sendent = {
		WriteByte(MSG_ENTITY, ENT::BOSS3HALO);
		WriteByte(MSG_ENTITY, sendflags);

		if (sendflags & 0x01)
		{
			WriteVectorL(MSG_ENTITY, this.origin);
		}

		if (sendflags & 0x02)
		{
			WriteByte(MSG_ENTITY, this.effects);
		}

		return TRUE;
	};

	nonvirtual void() orb_die;
	nonvirtual void() bossmartyrorb_c = {
		this.halo = spawn(entity, effects: EF_NODRAW, SendEntity: sendent);
		setmodel(this.halo, "models/enemies/boss3/halo_boss3.md3");

		setmodel(this, "models/enemies/boss3/sphere_boss3.md3");
		this.recharge_duration = 10;

		this.movetype = MOVETYPE_STEP;
		this.takedamage = DAMAGE_NO;
		this.th_die = orb_die;
		this.health = 100;

		this.bloodimpact = 6;

		this.think = this.mainloop;
		this.nextthink = time + 0.1;

		boss3_orb_amount++;
	};
};

class bossmartyr_c {
	float weight;
	bossmartyr_c chain_master; // master list of all martyrs
	bossmartyr_c chain_cycle; // determined at boss start, cw vs ccw

	string targetname; // name for nav node + glowy wall to point to
	string target; // summon point names
	bossnav_c navnode; // nav node edict corresponding to this martyr
	bossmartyrorb_c orb;
	entity glow_wall[4]; // entites pointed to this entity for glowmod purposes

	nonvirtual void() bossmartyr_c;
	nonvirtual void() findnavnode;
	nonvirtual float() isInCycle;
	nonvirtual bossmartyr_c() popCycle;
	nonvirtual void(float) addToCycle;
	nonvirtual void() appendCycle;
	nonvirtual void() prependCycle;
	nonvirtual void() explode;
	nonvirtual void() glowmod_transfer;


	// Reki (July 2 2023): animation lock
	float animlock_start;
	float animlock_end;
	var virtual float() animlock_think; // returns TRUE if it handled the animation logic
	nonvirtual void(float, float, float()) animation_start;
	
	nonvirtual float() anim_explode;
	nonvirtual float() anim_explode2;
	nonvirtual float() anim_summon;
	nonvirtual void() mainloop;
	//

	nonvirtual void(entity attacker, float dmg) pain;
	nonvirtual void() die {};
};

bossmartyr_c martyr_list;
bossmartyr_c martyr_cycle;
float martyr_cycle_isinverted;

string martyr_gib_list[] = {"arm_a_l", "arm_a_r", "arm_b_l", "arm_b_r", "foot_l", "foot_r", "hand_a_l", "hand_a_r", "hand_b_l", "hand_b_r", "horn_l", "horn_r", "leg_l", "leg_r", "pelvis", "torso_l", "torso_r"};
void() gib_fly_touch
{
	if(other.solid != SOLID_BSP)
		return;
	else
	{
		self.velocity = '0 0 0';
		pointparticles(particleeffectnum("heretic_bloodshower"), self.origin, '0 0 0', 1);
		te_customflash (self.origin + '0 0 8',96,1,'1 0.12 0.12');
		self.touch = SUB_Null;
		self.think = alphafade;
		self.nextthink = time + 0.025;
	}
}

void() bossmartyr_c::explode {

	//
	pointparticles(particleeffectnum("warp"), this.origin, '0 0 0', 1);

	for(float i = 0; i < 16; i++)
	{
		entity gib_fly = spawn();
		setmodel (gib_fly, "models/gibs/gib_large.md3");
		gib_fly.scale = random(1, 2);
		gib_fly.movetype = MOVETYPE_BOUNCE;
		gib_fly.origin = this.origin;
		gib_fly.solid = SOLID_TRIGGER;
		gib_fly.traileffectnum = particleeffectnum("bloodtraildense");		
		gib_fly.touch = gib_fly_touch;
		gib_fly.gravity = (gib_fly.scale / 2) + 1;
		gib_fly.origin = this.origin + [random(-64,64), random(-64,64), random(-64,64)];
		gib_fly.velocity = [random(-512,512), random(-512,512), random (512,768)];
	}	

	vector tagorg = tag_origin("tag_pelvis", this);// relvel: forward, right, up
	pointparticles(particleeffectnum("wretch_bloodshower"), tagorg , '0 0 0', 1);
	explo_blood(2, tagorg);	
	explo_blood(9, tagorg);
	//


	for(float i = 0; i < martyr_gib_list.length; i++)
	{
		vector tagorg = tag_origin(sprintf("tag_%s", martyr_gib_list[i]), this);
		ThrowGib3(this, sprintf("models/enemies/martyr/gibs/%s.md3", martyr_gib_list[i]), 0, 0.75, 1, 1, tagorg, (centervel(tagorg , this.origin) * random(128,192)) + [random(-120, 120), random(-120, 120), random(-120, 120)], 0, 3);	
	}
}

void(float start, float end, float() th) bossmartyr_c::animation_start {
	this.frame = start;
	this.animlock_start = start;
	this.animlock_end = end;
	this.animlock_think = th;
}

void() bossmartyrorb_c::mainloop = {
	frametime = 0.1;
	bossmartyr_c martyr = (bossmartyr_c)this.owner;

	float o_rectime = this.recharge_time_last;
	this.recharge_time = max(0, this.recharge_time - frametime);
	float frac = 1 - (this.recharge_time / this.recharge_duration);

	// Reki (July 13 2023): Handle different meat-ball animation lengths
	if (this.recharge_animation == 2)
		this.frame = 300 + bound(1, frac * 300, 300); // frame 301-600
	else if (this.recharge_animation == 1)
		this.frame = 100 + bound(1, frac * 200, 200); // frame 101-300
	else
		this.frame = 0 + bound(1, frac * 100, 100); // frame 1-100
	//

	this.origin[0] = this.true_origin[0] + sin((time + 11.3) * 0.2) * 6;
	this.origin[1] = this.true_origin[1] + sin(time * 0.22) * 6;
	this.origin[2] = this.true_origin[2] + sin(time * 0.7) * 8;

	this.angles[0] = this.owner.angles[0] + sin(time * 0.7) * 12;
	this.angles[1] = this.owner.angles[1] - sin(time * 0.22) * 8;
	this.angles[2] = this.owner.angles[2] - sin((time + 11.3) * 0.2) * 4;


	this.effects &= ~EF_NODRAW;
	this.solid = SOLID_BBOX;
	if (this.recharge_time <= 0 && o_rectime > 0) // we just finished recharging
	{
		this.takedamage = DAMAGE_YES;
		if (!martyr.isInCycle())
		{
			martyr.addToCycle(martyr_cycle_isinverted);
			//martyr.appendCycle();
		}

		this.halo.effects &= ~EF_NODRAW;
		this.halo.SendFlags |= 0x02;

		martyr.animation_start(26, 42, __NULL__);
		martyr.attack_finished = time + 5;
	}
	else if (this.recharge_time > this.recharge_duration)
	{
		this.effects |= EF_NODRAW;
		this.solid = SOLID_NOT;
	}

	if (this.recharge_time)
	{
		this.takedamage = DAMAGE_NO;
		this.health = 100;
		
		this.halo.effects |= EF_NODRAW;
		this.halo.SendFlags |= 0x02;

		// lower glow map to nearly zero intensity
		this.glowmod[2] = this.glowmod[1] = this.glowmod[0] = 0.01;
		//
	}
	else
	{
		// adjust glow map intensity
		this.glowmod[0] = bound(0.01, this.glowmod[0] + frametime * 1.1, 1); 
		this.glowmod[2] = this.glowmod[1] = this.glowmod[0];
		//
	}

	this.recharge_time_last = this.recharge_time;
	this.think = this.mainloop;
	this.nextthink = time + frametime;
}

float() bossmartyr_c::isInCycle {
	for(bossmartyr_c b = martyr_cycle; b; b = b.chain_cycle)
	{
		if (b == this)
			return TRUE;
	}
	return FALSE;
}

bossmartyr_c() bossmartyr_c::popCycle {
	if (!martyr_cycle) // empty cycle
		return world;
	bossmartyr_c node = martyr_cycle;
	martyr_cycle = node.chain_cycle;
	node.chain_cycle = 0;
	return node;
}

void() bossmartyr_c::prependCycle {
	this.chain_cycle = martyr_cycle;
	martyr_cycle = this;
}

void() bossmartyr_c::appendCycle {
	if (!martyr_cycle)
	{
		martyr_cycle = this; 
		return;
	}

	bossmartyr_c h;
	for(bossmartyr_c b = martyr_cycle; b; h = b, b = b.chain_cycle); // loop to end of cycle chain
	h.chain_cycle = this;
	this.chain_cycle = 0;
}

void(float inverse) bossmartyr_c::addToCycle {
	if (!martyr_cycle)
	{
		martyr_cycle = this;
		return;
	}
	
	bossmartyr_c h;
	for(bossmartyr_c b = martyr_cycle; b; h = b, b = b.chain_cycle)
	{
		if ((!inverse && b.weight > this.weight) || (inverse && b.weight < this.weight))
		{
			if !(h)
			{
				martyr_cycle = this;
				this.chain_cycle = b;
				return;
			}

			h.chain_cycle = this;
			this.chain_cycle = b;
			return;
		}
	}

	h.chain_cycle = this;
}

void() bossmartyr_c::findnavnode {
	this.think = this.mainloop;
	this.nextthink = time + 0.1;

	if (!this.targetname)
		return;
	
	for(bossnav_c node = nav_list; node; node = node.chain_master)
	{
		if (node.target != this.targetname)
			continue;

		this.navnode = node;
		break;
	}

	for(float w = 0, entity wall = findchain(::target, this.targetname); w < bossmartyr_c::glow_wall.length && wall != world; wall = wall.chain)
	{
		if (wall.solid != SOLID_BSP)
			continue;

		this.glow_wall[w] = wall;
		w++;
	}
}

void() bossmartyr_c::bossmartyr_c {
	precache_model("models/enemies/boss3/sphere_boss3.md3");
	precache_model("models/enemies/boss3/halo_boss3.md3");
	precache_model("models/enemies/boss3/deathsphere.md3");
	precache_model("models/enemies/martyr/martyr.md3");
    setmodel(this, "models/enemies/martyr/martyr.md3");
	setsize(this, '-56 -56 -64', '56 56 140');

	// add to chain
	this.chain_master = martyr_list;
	martyr_list = this;

	this.think = this.findnavnode;
	this.nextthink = time + 0.2;

	this.th_die = this.die;
	this.th_pain = this.pain;
	this.bloodimpact = 2;
}

void(entity attacker, float dmg) bossmartyr_c::pain
{
	if (!this.orb)
		return;

	if (!this.orb.recharge_time)
		return;
	
	if (this.orb.recharge_time > 0)
	{
		if (this.orb.recharge_time > this.orb.recharge_duration)
		{
			this.orb.recharge_time -= dmg * 0.01;
			this.orb.recharge_time = max(this.orb.recharge_time, this.orb.recharge_duration - 0.05);
		}
		else
		{
			this.orb.recharge_time -= dmg * 0.003;
		}

		this.orb.recharge_time = max(0.01, this.orb.recharge_time);
	}

	if (this.animlock_think == this.anim_summon)
		return;

	if (time >= this.attack_finished)
	{
		//this.frame = 24;
		//this.think = martyr_pain;
		//this.nextthink = time + 0.1;
		this.animation_start(23, 42, __NULL__);
		this.attack_finished = time + 0.45;
	}

	this.health = 9999;
	this.pain_finished = time + 0.05;
}

void() spawnfunc_boss_martyr
{
	spawnfunc_bossmartyr_c();
	bossmartyr_c martyr = (bossmartyr_c)self;

	//martyr.think = martyr_assign_owner;
	//martyr.nextthink = time + random(0.3, 1);
	martyr.health = 9999;
	martyr.takedamage = DAMAGE_YES;
	//martyr.th_die = martyr_fdeath;
	martyr.solid = SOLID_BBOX;
	//martyr.use = martyr_die;
}
/* #endregion */

/* #region physics */
vector VectorMA(vector a, float scale, vector b, __out vector c)
{
	c[0] = a[0] + (scale * b[0]);
	c[1] = a[1] + (scale * b[1]);
	c[2] = a[2] + (scale * b[2]);
	
	return c;
}

vector CrossProduct(vector a, vector b)
{
	vector c;

	c_x = a_y * b_z - a_z * b_y;
	c_y = a_z * b_x - a_x * b_z;
	c_z = a_x * b_y - a_y * b_x;

	return c;
}

/*
==================
ClipVelocity

Slide off of the impacting object
returns the blocked flags (1 = floor, 2 = step / wall)
==================
*/
#define STOP_EPSILON 0.1
void ClipVelocity (vector in, vector normal, __out vector out, float overbounce)
{
	float backoff;
	
	local vector oldout = in;
	
	backoff = -(in * normal) * overbounce;
	VectorMA(in, backoff, normal, out);

	///*
	if (out_x > -STOP_EPSILON && out_x < STOP_EPSILON)
		out_x = 0;
	if (out_y > -STOP_EPSILON && out_y < STOP_EPSILON)
		out_y = 0;
	if (out_z > -STOP_EPSILON && out_z < STOP_EPSILON)
		out_z = 0;
	//*/
}

// adapted from Quake 2
#define MAX_CLIP_PLANES 5
float Boss_StepSlideMove(entity ent, float delta, vector move)
{
    float       bumpcount, numbumps;
    vector      dir;
    float       d;
    float         numplanes;
    vector      planes[MAX_CLIP_PLANES];
    vector      primal_velocity;
    float       i, j;
    vector      endv;
    float       time_left;

    numbumps = 4;
	
	primal_velocity = move;
    numplanes = 0;

    time_left = delta;
	
	float blocked;
	
    for (bumpcount = 0; bumpcount < numbumps; bumpcount++) {
        //for (i = 0; i < 3; i++)
        endv[0] = ent.origin[0] + time_left * move[0];
		endv[1] = ent.origin[1] + time_left * move[1];
		endv[2] = ent.origin[2] + time_left * move[2];
			
		tracebox(ent.origin, ent.mins, ent.maxs, endv, MOVE_NORMAL, ent);
		
        if (trace_allsolid) {
            // entity is trapped in another solid
			move[2] = 0;    // don't build up falling damage
            return 3;
        }

        if (trace_fraction > 0) {
            // actually covered some distance
			ent.origin = trace_endpos;
            numplanes = 0;
        }

        if (trace_fraction >= 1)
            break;     // moved the entire distance
		
		if (trace_plane_normal[2])
		{
			if (trace_plane_normal[2] > 0.7)
			{
				// floor
				blocked |= 1;

				ent.flags |= FL_ONGROUND;
				ent.groundentity = trace_ent;
			}
		}

        time_left -= time_left * trace_fraction;

        // slide along this plane
        if (numplanes >= MAX_CLIP_PLANES) {
            // this shouldn't really happen
			move = 0;
            break;
        }
		
		planes[numplanes] = trace_plane_normal;
        numplanes++;

		//
		// modify original_velocity so it parallels all of the clip planes
		//
        for (i = 0; i < numplanes; i++) {
            ClipVelocity(move, planes[i], move, 1.01);
            for (j = 0; j < numplanes; j++)
                if (j != i) {
                    if (move * planes[j] < 0)
                        break;  // not ok
                }
            if (j == numplanes)
                break;
        }

        if (i != numplanes) {
            // go along this plane
        } else {
            // go along the crease
            if (numplanes != 2) {
				move = 0;
                break;
            }
			dir = normalize(CrossProduct(planes[0], planes[1]));
            d = move * dir;
            move = dir * d;
        }

        //
        // if velocity is against the original velocity, stop dead
        // to avoid tiny occilations in sloping corners
        //
        if (move * primal_velocity <= 0) {
            move = 0;
            break;
        }
    }

	return blocked;
}
/* #endregion */

/* #region boss 3 entity */
#define BOSS3_ATTACKPATTERNS 3
#define BOSS3_ATTACKSWEEP	0
#define BOSS3_ATTACKFLUSH	1
#define BOSS3_ATTACKSUMMON	2
class boss3_c {

	float stage; // stage index

	// Reki (June 21 2023): animation lock
	// set an animation by calling this.animation_start(frame_start, frame_end, frame_func);
	// these are stage agnostic, and will return to normal stage logic after being completed
	float animlock_start;
	float animlock_end;
	var virtual float() animlock_think; // returns TRUE if it handled the animation logic
	//

	// pathfinding
	bosspath_c path;
	vector last_seen; // last known location of the player
	float last_seen_time;
	//

	// movement
	float yaw_speed;
	float yaw_goal;
	entity flail_bbox;
	float flail_time;
	//

	nonvirtual void() boss3_c;
	nonvirtual void(float, float, float()) animation_start;
	nonvirtual float(float, float) walk;
	nonvirtual bossnav_c() findnearestnode;
	nonvirtual void(float) trigger_stage;

	// transformation
	float monologue_frames;
	nonvirtual void() stage0;
	nonvirtual float() anim_monologue;
	nonvirtual float() anim_transform;
	nonvirtual void() face_player;
	nonvirtual void() activate_transform;
	//

	// walk train
	nonvirtual void() stage1;
	nonvirtual float() anim_flail;
	nonvirtual float() anim_summon;
	nonvirtual void(entity, float) pain_stage1;
	bossmartyr_c s1_summontarget;
	bossnav_c s1_homenode;
	float s1_endpathsummon;
	float s1_preparingsummon;
	float s1_headtocenter;
	//

	float boss_health; // used with s2 and s3
	
	// hold and shoot
	nonvirtual void() stage2;
	nonvirtual float() anim_sweepleft;
	nonvirtual float() anim_sweepright;
	nonvirtual float() anim_summonleft;
	nonvirtual float() anim_firehoming;
	nonvirtual void() attack_sweep;
	nonvirtual void() attack_homing;
	nonvirtual void() attack_summon;
	float attack_score[BOSS3_ATTACKPATTERNS];
	virtual void() attack_func[BOSS3_ATTACKPATTERNS];
	nonvirtual void(entity, float) pain_stage2;
	float s2_mutilation;
	vector s2_homelocation;
	//

	// last stand
	nonvirtual void() stage3;
	nonvirtual float() anim_death;
	nonvirtual float() anim_raiseinair;
	nonvirtual void() attack_spam;
	nonvirtual void(entity, float) pain_stage3;
	float s3_projectiletype;
	entity s3_enemytarget;
	//

	nonvirtual void() mainloop;
};

void() boss3_c::boss3_c {
	precache_model("models/enemies/boss3/boss3_start.md3");
	precache_model("models/enemies/boss3/boss3_end.md3");
	precache_model("models/enemies/boss3/boss3_a.md3");
	precache_model("models/enemies/boss3/boss3_b.md3");
	precache_model("models/enemies/boss3/boss3_c.md3");
	precache_model("models/enemies/boss3/boss3_d.md3");
	precache_model("models/enemies/boss3/boss3_e.md3");
	precache_model("models/enemies/boss3/boss3_f.md3");
	precache_model("models/projectiles/proj_boss3.md3");
	precache_model("models/projectiles/proj_boss3homing.md3");
	precache_model("models/projectiles/proj_boss3summon.md3");

	precache_sound("enemies/keeper/shield_loop.ogg");

	setmodel(this,"models/enemies/boss3/boss3_start.md3");
	setsize(this, '-16 -16 -32', '16 16 64');

	this.classname = "boss_guardian3";
	this.health = boss3_health;
	this.movetype = MOVETYPE_STEP;
	this.takedamage = DAMAGE_AIM;
	this.solid = SOLID_BBOX;
	this.th_die = SUB_Null;

	this.use = this.activate_transform;
	this.stage = 0;

	this.attack_func[BOSS3_ATTACKSWEEP] = this.attack_sweep;
	this.attack_func[BOSS3_ATTACKFLUSH] = this.attack_homing;
	this.attack_func[BOSS3_ATTACKSUMMON] = this.attack_summon;
	this.s2_mutilation = -1; // to let the boss know we aren't initialized yet for stage 2

	this.think = this.mainloop;
	this.nextthink = time + 0.2;
}

void(float start, float end, float() th) boss3_c::animation_start {
	this.frame = start;
	this.animlock_start = start;
	this.animlock_end = end;
	this.animlock_think = th;
}

#define BOSS3_STEPHEIGHT 48
float(float yaw, float dist) boss3_c::walk {
	
	vector u = [cos(DEG2RAD * yaw), sin(DEG2RAD * yaw), 0];
	vector start = this.origin;
	vector goal = this.origin + (dist * u);

	vector old_mins = this.mins;
	vector old_maxs = this.maxs;
	setsize(this, '-100 -100 -192', '100 100 192');

	this.flags &= ~FL_ONGROUND; // remove onground for now

	// do a little step up
	tracebox(this.origin, this.mins, this.maxs, this.origin + [0, 0, BOSS3_STEPHEIGHT], MOVE_NORMAL, this);
	float up = trace_fraction * BOSS3_STEPHEIGHT;
	this.origin = trace_endpos;

	// run slide physics
	Boss_StepSlideMove(this, frametime, u * dist);

	// do a little stepdown so it doesn't look too silly
	tracebox(this.origin, this.mins, this.maxs, this.origin + [0, 0, -(BOSS3_STEPHEIGHT + up)], MOVE_NORMAL, this);
	if (trace_fraction < 1)
	{
		this.origin = trace_endpos;
		this.flags |= FL_ONGROUND;
	}

	// relink entity
	setsize(this, old_mins, old_maxs);
	setorigin(this, this.origin);

	return (vlen(start - this.origin) >= vlen(start - goal)); // if we made it at least as far as our goal, return true
}

bossnav_c() boss3_c::findnearestnode {

	bossnav_c bestNav = nav_list;
	float bestDist = 99999;
	for(bossnav_c node = nav_list; node; node = node.chain_master)
	{
		float diff = vlen(node.origin - this.origin);
		if (diff >= bestDist) // ignore nodes farther away than our current best
			continue;
		bestNav = node;
		bestDist = diff;
	}
	return bestNav;
}

float(float vel, float dist, float height_diff) boss3_calculate_firing_angle {
	float angle;
	float gravity = cvar("sv_gravity");

	angle = -atan((pow(vel, 2) + sqrt(pow(vel, 4) - gravity * (gravity * pow(dist, 2) + 2 * height_diff * pow(vel, 2)))) / (gravity * dist));

    return angle * RAD2DEG;
}

.string targetfieldarray[] = {target, target, target2, target3, target4, target5, target6, target7};
void(float st) boss3_c::trigger_stage {
	
	if (st < 0 || st > 7) // keep within bounds
		return;

	.string fld = (::targetfieldarray[st]);
	if (!this.fld)
		return;

	for(entity t = find(world, ::targetname, this.fld); t; t = t = find(t, ::targetname, this.fld))
	{
		if (!t.use)
			continue;

		Ent_UseTarget(t);
	}
}

/* #region stage 0 (standing and monologuing) */
void() boss3_c::face_player {
	this.yaw_goal = vectoangles(single_player.origin - this.origin)[1];
	float adiff = angle_difference(this.angles[1], this.yaw_goal);
	if (fabs(adiff) > 1)
	{
		float delta = fabs(adiff) * 3 * frametime;
		delta = min(delta, fabs(adiff));
		if (adiff > 0)
			this.angles[1] -= delta;
		else
			this.angles[1] += delta;
	}
}

void() boss3_martyr_generate_cycle;
void() boss3_c::stage0 {
	this.skin = 0;
	this.takedamage = DAMAGE_NO;

	this.face_player();
}

void() boss3_c::activate_transform {
	if (this.stage != 0)
		return;
	
	this.monologue_frames = 0;
	this.animation_start(1, 2, this.anim_monologue);
}

float() boss3_c::anim_monologue {
	this.frame = 0;

	if (this.monologue_frames < 95)
	{
		this.face_player();
	}

	string sample = __NULL__;
	if (this.monologue_frames == 10)
	{
		centerprint(single_player, "&$SHEPHERD: $SHEPHERD_BOSS3_LINE1_01");
		sample = sprintf("sound/npc/shepherd_voicing_medium%.0f.ogg", 3);
	}
	else if (this.monologue_frames == 55)
	{
		centerprint(single_player, "&$SHEPHERD_BOSS3_LINE1_02");
		sample = sprintf("sound/npc/shepherd_voicing_short%.0f.ogg", 1);
	}
	else if (this.monologue_frames == 80)
	{
		centerprint(single_player, "&$SHEPHERD_BOSS3_LINE1_03");
		sample = sprintf("sound/npc/shepherd_voicing_medium%.0f.ogg", 2);
	}
	else if (this.monologue_frames == 115)
	{
		centerprint(single_player, "&$SHEPHERD_BOSS3_LINE1_04");
		sample = sprintf("sound/npc/shepherd_voicing_short%.0f.ogg", 2);
	}
	else if ((monologue_frames) > 120)
	{
		// if we haven't gotten a cycle yet, generate one
		if (!martyr_cycle)
		{
			boss3_martyr_generate_cycle();
		}
		//

		setmodel(this, "models/enemies/boss3/boss3_a.md3");
		setsize(this, '-16 -16 -32', '16 16 64');
		this.flags |= FL_ONGROUND;

		animation_start(boss3_spawn1, boss3_spawn100, this.anim_transform);
		soundwrath(this, CHAN_BODY, "enemies/boss3/transform.ogg", 1, 0.125, 0, 0, 0.8);
		return TRUE;
	}

	if (sample)
		sound(this, CHAN_AUTO, sample, 1, ATTN_NONE);

	this.monologue_frames++;
	return TRUE;
}

float() boss3_c::anim_transform {
	
	if((this.frame >= boss3_spawn72) && (this.frame <= boss3_spawn90)) // expand boss
	{
		// Reki (June 21 2023)
		// FIXME: wobble from origin setting, this should be more matched to specific frames
		setorigin (this, this.origin + '0 0 9');
		setsize (this, this.mins - '4 4 8', this.maxs + '4 4 8');
		Controller_Rumble(world, 0.8, 0.4, 120);
	}
	else if (this.frame == boss3_spawn91) // boss is now fully expanded
	{
		this.stage = 1;
		this.trigger_stage(this.stage);
		this.s1_headtocenter = 0;
		this.s1_homenode = this.findnearestnode();

		setsize (this, '-100 -100 -192', '100 100 192');
		setorigin(this, this.origin + '0 0 16');
		droptofloor();
		Controller_Rumble(world, 0.2, 0.07, 180);
	}
	else if (this.frame < boss3_spawn25 || (this.frame >= boss3_spawn51 && this.frame <= boss3_spawn61))
	{
		Controller_Rumble(world, 0.02, 0.04, 80);
	}

	if (this.frame == boss3_spawn25)
	{
		this.skin = 1;

		float tag = gettagindex(this, "tag_blood");
		explo_blood_sprite(6, gettaginfo(this, tag));
		Controller_Rumble(world, 0.7, 0.5, 150);
	}
	else if (this.frame == boss3_spawn32)
	{
		this.skin = 2;

		float tag = gettagindex(this, "tag_blood");
		explo_blood_sprite(6, gettaginfo(this, tag));
		Controller_Rumble(world, 0.7, 0.5, 150);
	}
	else if (this.frame == boss3_spawn50)
		this.skin = 3;
	else if (this.frame == boss3_spawn70)
		this.skin = 4;

	return FALSE;
}
/* #endregion */

/* #region stage 1 (choo choo train) */
void() boss_summoner_use;
void() boss_summoner_wait =
{
	self.frame = 0;
	self.alpha = 0.00001;
	if (!self.classmonster1)
		self.classmonster1 = 1;
	if (!self.classmonster2)
		self.classmonster2 = self.classmonster1;
	if (!self.classmonster3)
		self.classmonster3 = self.classmonster1;
	if (!self.classmonster4)
		self.classmonster4 = self.classmonster1;
	if (!self.classmonster5)
		self.classmonster5 = self.classmonster1;

	if(!self.wait) // Reki (July 1 2023): allow each summon point adjustable wait times
		self.wait = 1.5;
	
	self.count = 5;
	self.use = boss_summoner_use;
};

const .float classmonst[] = {classmonster1, classmonster1, classmonster2, classmonster3, classmonster4, classmonster5};
void() boss_summoner_summon = 
{
	self.local_classmonster = bound(0, boss3_orb_amount, classmonst.length - 1);
	self.local_classmonster = self.(classmonst[self.local_classmonster]);

	if (self.local_classmonster <= 0)
	{
		remove(self);
		return;
	}

	pointparticles(particleeffectnum("martyr_impact2"), self.origin, '0 0 0', 1);

	if ((self.fastwarp) && (!self.frame))
	{
		self.frame = 2;
		self.cnt = 35;
		self.effects &= ~EF_NODRAW;
		sound(self, CHAN_AUTO, "fx/warp_fast.ogg", 1, 0.125);
		self.alpha = 1;
	}
	self.cnt += 1;
	if ((!self.fastwarp))
	{
		if ((self.alpha < 1) && (self.cnt <= 10))
			self.alpha += 0.1;
	}

	if (self.cnt == 36)
	{
		enemy_spawner_use();
		pointparticles(particleeffectnum("warp"), self.origin, '0 0 0', 1);
	}
	if (self.cnt > 36)
		self.alpha -= 0.1;
	self.rise = 1;
	if (self.cnt >= 45)
	{	
		self.think = boss_summoner_wait;
		self.effects |= EF_NODRAW;
	}
	else
		self.think = boss_summoner_summon;
	self.nextthink = time + 0.05;
};

void() boss_summoner_use
{
	// Reki (July 12 2023): abort early if our pop cap is reached...
	// this is kind of a hack since we do the actual operations in enemy_spawner_use anyway
	// but this way at least we don't get the spawn orb + sound under ideal circumstances
	if (population_control && self.local_classmonster <= population_control_fields.length)
	{
		if (population_control.(population_control_fields[self.local_classmonster - 1]) == 0)
		{
			self.nextthink = time + 0.05;
			self.think = boss_summoner_wait;
			self.effects |= EF_NODRAW;
			return;
		}
	}
	//

	self.think = boss_summoner_summon;
	self.nextthink = time + self.wait + random(0, 0.8);
}

void() boss_summoner = 
{ 
	self.wrathflags += FL_SPAWNER;
	self.type = 1;
	self.frame = 0;
	self.alpha = 0.00001;
	if (!self.nodroptofloor)
		self.nodroptofloor = 1;
	setmodel(self, "models/warp/warp.md3");
	setsize (self,'-1 -1 -1','1 1 1');
	self.effects += EF_NODRAW;
	self.warped = 1;
    self.fastwarp = 1;
	if(self.spawnflags & 1)
	{
		if (!self.classmonster1)
			self.classmonster1 = 6;
	}
	if (!self.classmonster1)
		self.classmonster1 = 1;
	if (!self.classmonster2)
		self.classmonster2 = self.classmonster1;
	if (!self.classmonster3)
		self.classmonster3 = self.classmonster1;
	if (!self.classmonster4)
		self.classmonster4 = self.classmonster1;
	if (!self.classmonster5)
		self.classmonster5 = self.classmonster1;

	self.local_classmonster = self.classmonster1;
	self.count = 5;
	self.use = boss_summoner_use;
};

float() bossmartyr_c::anim_summon {
	if(this.frame == 16)
	{
		pointparticles(particleeffectnum("martyr_impact"), this.origin, '0 0 0', 3);
		pointparticles(particleeffectnum("martyr_impact2"), this.origin, '0 0 0', 3);
		te_customflash (this.origin, 256, 1, '1 0.12 0.12');
		soundwrath(this, CHAN_AUTO, "enemies/boss3/summon_success.ogg", 1, 0.125, random(75,80), 0, 0.25);
	}

	if (this.frame == 13)
	{
		entity martyr = this;
		activator = boss3_entity;
		other = martyr;
		
		for(float i = 0; i < 1; i++)
		{
			.string fld = (::targetfieldarray[i]);
			if (!martyr.fld)
				continue;

			for(entity t = find(world, ::targetname, martyr.fld); t; t = t = find(t, ::targetname, martyr.fld))
			{
				if (!t.use)
					continue;

				Ent_UseTarget(t);
			}
		}
	}

	return FALSE;
}

float() bossmartyr_c::anim_explode2 {
	this.scale += frametime * 6;
	this.alpha -= frametime * 0.8;
	this.frame = 0;

	if (this.alpha < 0.02)
	{
		remove(this);
	}

	return TRUE;
}

float() bossmartyr_c::anim_explode {
	this.frame++;

	float s = this.frame - 3;
	s = s / 10;
	s = (s * 10);

	this.glowmod[0] = 1 + (s);
	this.glowmod[1] = this.glowmod[2] = 1 + (s * 0.2);

	if (this.frame == 14)
	{
		/* Reki (July 17 2023): replaced with a tempentity
		this.origin += '0 0 112';

		this.explode();
		sound(this, CHAN_AUTO, "fx/warp_fast.ogg", 1, 0.125);
		setmodel(self, "models/dev/sphere.md3");
		this.scale = 1;
		this.alpha = 0.2;
		this.colormod = '1 0 0';
		this.effects = EF_ADDITIVE;

		this.animation_start(1, 7, this.anim_explode2);
		*/

		this.glowmod = '0 0 0';
		this.glowmod_transfer();

		this.explode();
		sound(this, CHAN_AUTO, "fx/warp_fast.ogg", 1, 0.125);

		tempent_expandingorb(this.origin + '0 0 112', '1 0 0', '64 450', '0.6 0', 0.3);

		remove(this);
		return TRUE;
	}

	return FALSE;
}

void() bossmartyr_c::glowmod_transfer {
	// Reki (July 13 2023): Transfer glowmod to glow_wall ents
	float average_glow = ((this.glowmod[0] + this.glowmod[1] + this.glowmod[2]) / 3);
	vector glow_to_use =  ((this.glowmod - '0.2 0.25 0.22') * 0.8);

	if (average_glow < 0.2) // special case for very low glow
	{
		average_glow -= 0.2;
		glow_to_use = lerpVector(glow_to_use, [max(0.002, average_glow + 0.1), max(0.00001, average_glow), max(0.00001, average_glow)], 0.66);
	}
	else
		glow_to_use = lerpVector(glow_to_use, [average_glow, average_glow, average_glow], 0.66);
	

	for(float i = 0; i < bossmartyr_c::glow_wall.length; i++)
	{
		if (!glow_wall[i])
			continue;
		
		if (wasfreed(glow_wall[i]))
		{
			glow_wall[i] = world;
			continue;
		}

		glow_wall[i].glowmod = glow_to_use;
	}
}

void() bossmartyr_c::mainloop {
	frametime = 0.1;

	// Reki (July 3 2023): Glowmod
	if (this.orb)
	{
		float delta = frametime * 0.3;
		if (this.orb.recharge_time <= 0)
		{
			if (boss3_entity.animlock_think == boss3_entity.anim_summon && boss3_entity.s1_summontarget == this)
			{
				float s = boss3_entity.frame - boss3b_summon1;
				s = s / 50;
				s = (s * 10);
			
				this.glowmod[0] = 1 + (s);
				this.glowmod[1] = this.glowmod[2] = 1 + (s * 0.2);
			}
			else
			{
				float delta = frametime * 0.3;
				this.glowmod[2] = min(this.glowmod[2] + delta, 0.8);
				this.glowmod[1] = this.glowmod[2];
				this.glowmod[0] = (this.glowmod[2] + 0.2) + (sin(time * 2) * 0.2);
			}
		}
		else
		{
			float frac = 1 - bound(0, this.orb.recharge_time / (20), 1);
			float goal_low = bound(0.2, frac, 0.4);
			float goal_high = bound(0.3, frac, 1);
			float delta_low = frametime * 0.8;
			float delta_high = frametime * 3;
			
			
			if (this.glowmod[0] < goal_high)
				this.glowmod[0] = min(goal_high, this.glowmod[0] + delta_high);
			else
				this.glowmod[0] = max(goal_high, this.glowmod[0] - delta_high);

			if (this.glowmod[1] < goal_low)
				this.glowmod[1] = min(goal_low, this.glowmod[1] + delta_low);
			else
				this.glowmod[1] = max(goal_low, this.glowmod[1] - delta_low);

			if (this.glowmod[2] < goal_low)
				this.glowmod[2] = min(goal_low, this.glowmod[2] + delta_low);
			else
				this.glowmod[2] = max(goal_low, this.glowmod[2] - delta_low);
		}
	}
	else
	{
		float delta = frametime * 0.4;
		this.glowmod[0] = max(this.glowmod[0] - delta * 0.45, 0.001);
		this.glowmod[1] = max(this.glowmod[1] - delta, 0.001);
		this.glowmod[2] = max(this.glowmod[2] - delta, 0.001);
	}

	this.glowmod_transfer();


	// Reki (July 2 2023): Animation locks
	if (this.animlock_start)
	{
		float do_anim = TRUE;
		if (this.animlock_think != __NULL__)
			do_anim = !this.animlock_think(); // this will return TRUE if it handled the animation logic
		
		if (do_anim)
		{
			this.frame++;
			if (this.frame >= this.animlock_end)
			{
				this.animlock_start = 0;
				this.animlock_end = 0;
				this.animlock_think = __NULL__;
			}
		}
	}
	else
	{
		this.frame = 1;
		if (this.orb)
		{
			if (this.orb.recharge_time > 0 && this.orb.recharge_time <= this.orb.recharge_duration)
			{
				this.frame = 2;
			}
		}
	}

	this.think = this.mainloop;
	this.nextthink = time + frametime;
}

void() bossmartyrorb_c::orb_die = {
	bossmartyr_c martyr = (bossmartyr_c)this.owner;

	if (boss3_entity && boss3_entity.s1_summontarget == martyr) // oh ****, we need to divert the big man!
	{
		dprint("diverting the dude!\n");
		for(bosspath_c node = boss3_entity.path; node; node = node.to)
		{
			dprint("removing path");
			node.think = SUB_Remove;
			node.nextthink = time + 0.1;
		}
		boss3_entity.path = 0;
		boss3_entity.s1_preparingsummon = FALSE;
		boss3_entity.s1_endpathsummon = FALSE;
	}

	// Reki (July 3 2023): Let's lower the recharge time of all the other orbs, otherwise the big guy may be stuck waiting for a while
	for(bossmartyr_c m = martyr_list; m; m = m.chain_master)
	{
		if (!m.orb)
			continue;

		if (m.orb.recharge_time < m.orb.recharge_duration)
			continue;
		
		m.orb.recharge_time = max(m.orb.recharge_duration, m.orb.recharge_time - 8);
	}

	// skip most of the animation if he was already summoning
	if (boss3_entity.animlock_start && (boss3_entity.frame >= boss3b_summon1 && boss3_entity.frame <= boss3b_summon38) && boss3_entity.s1_summontarget == martyr) // if it's summoning at this martyr
	{
		boss3_entity.animation_start(boss3b_summon42, boss3b_summon50, boss3_entity.anim_summon);
	}

	soundwrath(this, CHAN_BODY, "fx/tele4.ogg", 1, 0.3, random(80, 120), 0, 0.5);
	
	boss3_orb_amount--;
	martyr.orb = 0;
	soundwrath(martyr, CHAN_AUTO, "enemies/boss3/tower_destroy.ogg", 1, 0.125, 0, 0, 0.25);
	martyr.animation_start(3, 23, martyr.anim_explode); // explosion anim
	remove(this.halo);
	remove(this);
};

#define BOSS3_YAWSPEED 120
float() boss3_c::anim_flail {

	this.walk(this.angles[1], 42);

	this.frame++;
	if (this.frame != boss3b_flail6)
		return FALSE;
	
	entity lst = findradius(this.origin, 350);
	for(; lst ; lst = lst.chain)
	{
		if (lst.movetype != MOVETYPE_STEP && lst.movetype != MOVETYPE_WALK)
			continue;
		if (lst.solid == SOLID_NOT || lst.solid == SOLID_TRIGGER)
			continue;

		vector dir = normalize(lst.origin - [this.origin[0], this.origin[1], this.absmin[2]]);
		if (lst.classname == "player")
		{
			if(lst.stoptime < time)
			{    
				lst.flags &= ~FL_ONGROUND;
				lst.flags |= FL_IGNOREINPUT;
				lst.stoptime = time + 1.5;
				lst.hardstoptime = lst.stoptime - 0.85;
				
				// Reki (January 26 2024): Removed this, not really sure it had any
				// noticable impact, and was causing bugs when blade altfiring
				/*
				if (!lst.oldmovetype)
					lst.oldmovetype = lst.movetype;
				lst.movetype = MOVETYPE_BOUNCE;
				lst.gravity = 0.15;
				lst.backedtonormal = 0; 
				lst.oldthink = lst.think;
				lst.think = backtonormal;
				lst.nextthink = time + 0.1;
				*/

				lst.velocity = '0 0 384' + (dir * 900);
				T_Damage(lst, this, this, boss3_pushdamage);
				pointparticles(particleeffectnum("forcefieldboss3"), lst.origin + dir * 32 + '0 0 24', '0 0 0',1);
			}
		}
		else if (lst.flags & FL_MONSTER)
		{
			lst.velocity = '0 0 384' + (dir * 900);
			T_Damage(lst, this, this, boss3_pushdamage);
			pointparticles(particleeffectnum("forcefieldboss3"), lst.origin + dir * 32 + '0 0 24', '0 0 0',1);
		}
	}

	return FALSE;
}

void() boss3_flail_bbox_touch {
	boss3_c boss = (boss3_c)self.owner;

	// destroy certain types of ents
	if (other.classname ==  "crystallised" || other.classname ==  "func_destruct")
	{
		T_Damage (other, boss, boss, 1200);
		return;
	}
	//

	if (boss.animlock_start)
		return;

	if (other.movetype != MOVETYPE_STEP && other.movetype != MOVETYPE_WALK)
		return;
	
	if (other.solid == SOLID_NOT || other.solid == SOLID_TRIGGER)
		return;

	if (other == boss || other.owner == boss)
		return;
	
	if (other.takedamage == DAMAGE_NO)
		return;

	if (time < boss.flail_time)
		return;

	if (other.flags & FL_MONSTER)
		return;
	
	boss.flail_time = time + 3;
	boss.animation_start(boss3b_flail1, boss3b_flail15, boss.anim_flail);
};

void() boss3_martyr_generate_cycle
{
	martyr_cycle_isinverted = FALSE;

	// generate orbs for all martyrs
	for(bossmartyr_c martyr = martyr_list; martyr; martyr = martyr.chain_master)
	{
		if (martyr.orb)
			continue;
		
		bossmartyrorb_c o = martyr.orb = spawn(bossmartyrorb_c);
		setorigin(o, martyr.origin + '0 0 248');
		o.true_origin = o.origin;
		setorigin(o.halo, o.origin);

		setsize(o, '-32 -32 -32', '32 32 32');
		o.solid = SOLID_BBOX;
		o.owner = martyr;
		o.scale = martyr.scale;

		o.think = o.mainloop;
		o.nextthink = time + 0.1;
	}

	// add all points to the cycle
	for(bossmartyr_c martyr = martyr_list; martyr; martyr = martyr.chain_master)
	{
		if (martyr.weight == 1)
			continue;
		
		martyr.addToCycle(martyr_cycle_isinverted);
	}

	// put the 1st martyr at the beginning, since it'll be the one we always want to start with
	for(bossmartyr_c martyr = martyr_list; martyr; martyr = martyr.chain_master)
	{
		if (martyr.weight != 1)
			continue;

		//if !(martyr_cycle_isinverted)
			martyr.prependCycle();
		//else
		//	martyr.appendCycle();
	}
};

const string orbtimecvar[] = {"orbtime1", "orbtime1", "orbtime2", "orbtime3", "orbtime4", "orbtime5"};
float() boss3_c::anim_summon {
	bossmartyr_c martyr = this.s1_summontarget;
	bossmartyrorb_c morb = martyr.orb;
	if (!martyr || !morb)
		return FALSE;

	if (this.frame == boss3b_summon30)
	{
		martyr.animation_start(4, 23, martyr.anim_summon);
	}

	if (this.frame == boss3b_summon40)
	{
		float charge_time = cvar(orbtimecvar[bound(0, boss3_orb_amount, orbtimecvar.length - 1)]);
		if (charge_time > 35) // 300 frame animation
		{
			morb.recharge_duration = 30;
			morb.recharge_animation = 2;
		}
		else if (charge_time > 25) // 200 frame animation
		{
			morb.recharge_duration = 20;
			morb.recharge_animation = 1;
		}
		else // 100 frame animation
		{
			morb.recharge_duration = 10;
			morb.recharge_animation = 0;
		}

		morb.recharge_time = max(morb.recharge_duration, charge_time);
		morb.solid = SOLID_NOT;

		if (!martyr_cycle_isinverted)
			martyr.weight += boss3_orb_amount;
		else
			martyr.weight -= boss3_orb_amount;

		explo_blood(1, morb.origin);
		pointparticles(particleeffectnum("heretic_bloodshower"), morb.origin, '0 0 0', 1);
		pointparticles(particleeffectnum("martyr_impact"), morb.origin, '0 0 0', 7);
		te_customflash (morb.origin - '0 0 12',256,0.55,'0.75 0.6 0.2');

		for(float i = 0; i < 16; i++)
		{
			entity gib_fly = spawn();
			setmodel (gib_fly, "models/gibs/gib_small.md3");
			gib_fly.movetype = MOVETYPE_BOUNCE;
			gib_fly.scale = random(0.5,1);
			gib_fly.origin = morb.origin;
			gib_fly.owner = morb;
			gib_fly.solid = SOLID_NOT;
			gib_fly.traileffectnum = particleeffectnum("bloodtraildense");		
			gib_fly.nextthink = time + (1 + random(1.5));
			gib_fly.think = SUB_Remove;
			gib_fly.origin_x = morb.origin_x + random(-16, 16);
			gib_fly.origin_y = morb.origin_y + random(-16, 16);
			gib_fly.origin_z = morb.origin_z + random(-16, 16);
			gib_fly.velocity_x = random(-368, 368);
			gib_fly.velocity_y = random(-368, 368);
			gib_fly.velocity_z = random(256, 512);
		}
	}

	return FALSE;
};

void(entity attacker, float dmg) boss3_c::pain_stage1 {
	if (this.stage != 1)
		return;

	if (attacker.flags & FL_CLIENT)
	{
		this.pain_finished = time + 0.5;
		this.glowmod[0] = 1;
	}
	else // monster hit gets a quick flash, nothing crazy
	{
		this.glowmod[0] = max(this.glowmod[0], 0.5);
		this.pain_finished = max(this.pain_finished, time + 0.1);
	}

	this.glowmod[2] = this.glowmod[1] = this.glowmod[0];
}

void() boss3_c::stage1 {
	this.th_pain = this.pain_stage1;
	this.bloodimpact = 0;

	this.yaw_speed = BOSS3_YAWSPEED;
	this.takedamage = DAMAGE_YES;
	if (this.model != "models/enemies/boss3/boss3_b.md3")
	{
		this.s1_endpathsummon = FALSE;
		this.frame = 85;
		setmodel(this, "models/enemies/boss3/boss3_b.md3");
		setsize(this, '-50 -50 -192', '50 50 180');
		return;
	}

	if (!self.flail_bbox)
	{
		const vector padding = '96 96 24';
		entity bbox = this.flail_bbox = spawn();
		setsize(bbox, this.mins - padding, this.maxs + padding);
		bbox.touch = boss3_flail_bbox_touch;
		bbox.solid = SOLID_TRIGGER;
		bbox.owner = this;
	}
	
	//
	if !(this.s1_preparingsummon) // if we're not actively trying to summon, find a path
	{
		if (this.path) // change our yaw goal to the path
		{
			float path_tolerance = 112;
			if (!this.path.to && this.s1_endpathsummon) // final one, we want to keep it pretty strict
				path_tolerance = 72;

			if (vlen([this.origin[0], this.origin[1], this.absmin[2]] - this.path.origin) < path_tolerance) // if we're close enough to the path to call it nav'd to
			{
				// trigger the node's targets
				if (this.path.rootnode)
					this.path.rootnode.calltargets();

				// cleanup path entity
				bosspath_c hold = this.path;
				this.path = hold.to;
				remove(hold);
			}
			else
			{
				vector a = vectoangles(this.path.origin - this.origin);
				this.yaw_goal = a[1];
			}
		}
		else // we're out of paths, choose a new martyr to go to
		{
			if (this.s1_endpathsummon)
			{
				this.s1_endpathsummon = FALSE;
				this.s1_preparingsummon = time;
				this.frame = boss3b_base;
				this.yaw_goal = vectoangles(this.s1_summontarget.origin - this.origin)[1];
				return;
			}

			if (s1_headtocenter == 999) // if we're going to the center
			{
				if (boss3_orb_amount <= 0) // if we're out of orbs, go onto stage 2
				{
					if (vlen(this.s1_homenode.origin - [this.origin[0], this.origin[1], this.absmin[2]]) < 64)
					{
						this.stage = 2;
						this.trigger_stage(this.stage);
						this.s2_homelocation = this.origin;
						this.frame = boss3c_base;
						return;
					}
				}
			}

			bossmartyr_c new;
			do {
				new = bossmartyr_c::popCycle(); // keep poppin' until we find one with an orb
				if (!new) // if we're out of martyrs... be sad :(
					break;
			} while (new.orb == world);

			if (new && new.orb) // Reki (June 26 2023): if we have a martyr go to it, otherwise go sit in the middle and wait
			{
				//new.appendCycle(); // Reki (June 25 2023): moved this to the orb regenerate code
				this.goalentity = new.navnode;
				this.s1_summontarget = new;
				this.s1_endpathsummon = TRUE;
				this.s1_headtocenter = 0;
			}
			else
			{
				dprint("go home!\n");
				this.goalentity = this.s1_homenode;
				this.s1_endpathsummon = FALSE;
				this.s1_headtocenter = 999;

				if (!this.s1_homenode)
					dprint("I don't have a home :c\n");
			}

			bossnav_c startnode;// = (bossnav_c)find(world, ::targetname, this.target);
			startnode = this.findnearestnode();
			if (this.goalentity && startnode && startnode != this.goalentity)
			{
				this.path = bossnav_astar(startnode, (bossnav_c)this.goalentity, bossnav_heuristic);
			}

			if (!this.path) // whoops we're too close to the node, so make one up
				this.path = spawn(bosspath_c, origin: startnode.origin);
		}
	}
	//

	if (this.frame == boss3b_base)
	{
		float ang_threshold = 15;
		if (this.s1_preparingsummon)
		{
			this.yaw_speed = BOSS3_YAWSPEED * 0.7;
			ang_threshold = 0.1;
		}

		float adiff = angle_difference(this.angles[1], this.yaw_goal);
		if (fabs(adiff) > ang_threshold)
		{
			float delta = this.yaw_speed * frametime;
			delta = min(delta, fabs(adiff));
			if (adiff > 0)
				this.angles[1] -= delta;
			else
				this.angles[1] += delta;
			return;
		}

		if !(this.s1_preparingsummon)
		{
			this.frame = boss3b_walk1;
		}
		else
		{
			soundwrath(this, CHAN_VOICE, "enemies/boss3/summon_vocal.ogg", 1, 0.25, 0, 0, 0.25);
			animation_start(boss3b_summon1, boss3b_summon50, this.anim_summon);
			this.s1_preparingsummon = FALSE;

			if (s1_summontarget)
			{
				//this.s1_summontarget.think = martyr_summon;
				//this.s1_summontarget.nextthink = time + 0.01;
			}
			return;
		}
	}
	else if (this.frame >= boss3b_walk1 && this.frame <= boss3b_walk20)
	{
		float adiff = angle_difference(this.angles[1], this.yaw_goal);
		if (this.frame < boss3b_walk1 || this.frame >= boss3b_walk20)
		{
			this.frame = boss3b_walk1;
			if (fabs(angle_difference(this.angles[1], this.yaw_goal)) > 50) // go to stand and turn state
			{
				this.frame = boss3b_base;
				return;
			}
		}
		else
		{
			this.frame++;
		}

		// footstep sound
		makevectors(this.angles);
		vector soundpos = this.origin;
		float soundflag = 0;
		if (this.frame == boss3b_walk5)
		{
			soundpos += (v_forward * 64) + (v_right * 48);
			soundflag |= 1 | 2; // happening and squishy
		}
		else if (this.frame == boss3b_walk10)
		{
			soundpos += (v_forward * 220) + (v_right * 120);
			soundflag |= 1; // not squishy
		}
		else if (this.frame == boss3b_walk15)
		{
			soundpos += (v_forward * 48) - (v_right * 96);
			soundflag |= 1; // not squishy
		}
		else if (this.frame == boss3b_walk20)
		{
			soundpos += (v_forward * 96) - (v_right * 48);
			soundflag |= 1 | 2; // happening and squishy
		}

		if (soundflag & 1)
		{
			// screen shake
			float shakeamt = 0.3;
			if (soundflag & 2)
				shakeamt = 0.4;
			spawn_shaker(this, 20, shakeamt, 768); 

			float rumbleamt = 1;
			float rumbledist = vlen(soundpos - single_player.origin);
			if (rumbledist < 1400)
			{
				rumbleamt *= 1 - (rumbledist / 1400);
				rumbleamt *= shakeamt;
				Controller_Rumble(single_player, 1 * rumbleamt, 0.6 * rumbleamt, 220);
			}

			// sound ent and effects
			entity soundent = spawn();
			setorigin(soundent, soundpos);
			soundwrath(soundent, CHAN_AUTO, sprintf("enemies/boss3/step%.0f.ogg", floor(random(3)) + 1), 1, 0.125, 100, 0, 0.25);
			if (soundflag & 2) // squishy sound
				soundwrath(soundent, CHAN_AUTO, sprintf("impact/gibs/gib_hit%.0f.ogg", floor(random(6)) + 1), 0.25, 0.5, 40, 0, 0.25);
			remove(soundent);
		}

		// turn while moving
		if (fabs(adiff) > 1)
		{
			float delta = this.yaw_speed * 0.8 * frametime;
			delta = min(delta, fabs(adiff));
			if (adiff > 0)
				this.angles[1] -= delta;
			else
				this.angles[1] += delta;
		}
		this.walk(this.angles[1], 168);
	}
	else if (this.frame >= boss3b_flail1)
	{
		this.frame = boss3b_base;
	}
}
/* #endregion */

/* #region stage 2 (stand and shoot) */
float boss3_fallencount;
void(entity attacker, float dmg) boss3_c::pain_stage2 {
	if (this.stage != 2 || this.s2_mutilation < 0)
		return;

	this.health = 99999; // keep our true health very high always

	if (time < this.pain_finished) // if we just got mutilated, have a cooldown before we can take damage again
		return;

	if !(attacker.flags & FL_CLIENT) // if the damage isn't coming from a client, divide it by 8
		dmg *= 0.125;
	
	dmg = min(dmg, 800); // limit damage to 800 per hit so we don't insta-fuck
	this.boss_health -= dmg; 
	
	if (this.boss_health <= 0)
	{
		string model_to_use[] = {"models/enemies/boss3/boss3_c.md3", "models/enemies/boss3/boss3_d.md3", "models/enemies/boss3/boss3_e.md3"};
		float health_to_use[] = {boss3_health, boss3_mutilationahealth, boss3_mutilationbhealth};
		this.s2_mutilation++;
		this.pain_finished = time + 4;

		if (this.s2_mutilation == 1) // first mutilation hit
		{
			soundwrath(this, CHAN_VOICE, "enemies/boss3/pain1.ogg", 1, 0.125, 0, 0, 0.5);

			vector tagorg = tag_origin("tag_claw_r",self);
			explo_blood(2, tagorg);	
			ThrowGib3(self, "models/enemies/boss3/gibs/claw_r.md3", 0, 0.75, 1, 1, tagorg, centervel(tagorg , self.origin) * random(128,192), 0, 3);	 
			tagorg = tag_origin("tag_flip_l",self);
			explo_blood(2, tagorg);	
			ThrowGib3(self, "models/enemies/boss3/gibs/flip_l.md3", 0, 0.75, 1, 1, tagorg, centervel(tagorg , self.origin)* random(128,192), 0, 3);
			tagorg = tag_origin("tag_clwarm_r",self);
			explo_blood(9, tagorg);	
			this.animation_start(boss3d_mutil1, boss3d_mutil20, __NULL__);
		}
		else if (this.s2_mutilation == 2) // second mutilation hit
		{
			soundwrath(this, CHAN_VOICE, "enemies/boss3/pain2.ogg", 1, 0.125, 0, 0, 0.5);

			tagorg = tag_origin("tag_claw_l",self);
			explo_blood(2, tagorg);	
			ThrowGib3(self, "models/enemies/boss3/gibs/claw_l.md3", 0, 0.75, 1, 1, tagorg, centervel(tagorg , self.origin) * random(128,192), 0, 3);	 
			tagorg = tag_origin("tag_flip_r",self);
			explo_blood(2, tagorg);	
			ThrowGib3(self, "models/enemies/boss3/gibs/flip_r.md3", 0, 0.75, 1, 1, tagorg, centervel(tagorg , self.origin)* random(128,192), 0, 3);
			tagorg = tag_origin("tag_clwarm_l1",self);
			explo_blood(9, tagorg);	
			tagorg = tag_origin("tag_clwarm_l2",self);
			explo_blood(9, tagorg);	
			this.animation_start(boss3e_mutil1, boss3e_mutil20, __NULL__);
		}
		else if (this.s2_mutilation > 2) // boss is really fucked up, going to stage 3, handle the actual transition in the stage code tho for smooth animation
		{
			soundwrath(this, CHAN_VOICE, "enemies/boss3/pain3.ogg", 1, 0.125, 0, 0, 0.5);

			this.boss_health = boss3_mutilationchealth;
			return;
		}

		setmodel(this, model_to_use[this.s2_mutilation]);
		setsize (this, '-100 -100 -192', '100 100 192');
		this.boss_health = health_to_use[this.s2_mutilation];
	}
	
}

void() monster_fallen_boss3_die {
	boss3_fallencount--;
	fallen_death();
}

void() monster_fallen_boss3 { // Reki (July 9 2023): we use this wrapper function to count total spawned fallens, so we know when to spawn more
	monster_fallen();
	boss3_fallencount++;
	self.th_die = monster_fallen_boss3_die;
}

void() boss3_proj_turnintoexplosion { // change 'self' to the visual effect of the boss 3 projectile explosion
	spawn_shaker (self, 12, 0.5, 256);
	pointparticles(particleeffectnum("bruteproj"), self.origin, '0 0 0', 3);
	setmodel(self, "models/projectiles/proj_slag1_explo.md3");
	self.touch = SUB_Null;
	self.movetype = 0; 
	self.velocity = '0 0 0';
	self.touch = SUB_Null;
	self.solid = SOLID_NOT;
	self.angles = '0 0 0';
	self.frame = 0;
	self.scale = 2;
	self.skin = 1;
	self.alpha = 1;
	self.think = cannon_proj_touch_fade;
	self.nextthink = time + 0.05;
}

void() boss3_smallproj_explode {

	if (self.owner && other == self.owner)
		return;
	if (other.solid == SOLID_TRIGGER)
		return;
	if (other.wrathflags & FL_PROJECTILE)
		return;

	// sound
	sound(self, CHAN_BODY, "misc/null.wav", 0, 0); // stop loop
	float r = random();
	if (r < 0.33)
		sound7(self, CHAN_AUTO, "enemies/oppressor/proj_impact1.ogg", 1, 0.25, random(95,105), 0);
	else if (r < 0.67)
		sound7(self, CHAN_AUTO, "enemies/oppressor/proj_impact2.ogg", 1, 0.25, random(95,105), 0);
	else
		sound7(self, CHAN_AUTO, "enemies/oppressor/proj_impact3.ogg", 1, 0.25, random(95,105), 0);
	//

	// deal damage
	float dmg_to_players = 0; // we need to track this to adjust our attack priorities
	float dmg = boss3_regularprojsplashdamage;
	float range = boss3_regularprojsplashradius;
	for(entity lst = findradius(self.origin, range + 32); lst; lst = lst.chain)
	{
		if (lst.takedamage == DAMAGE_NO)
			continue;
		if (lst == other) // we'll apply direct damage to them
			continue;

		vector center_point = ((lst.absmin + lst.absmax)/2);
		float dmg_mult = 1 - (vlen(self.origin - center_point) / range);
		if (dmg_mult <= 0) // ent was out of range
			continue;
		if (lst.flags & FL_MONSTER) // monsters should take reduced splash damage
			dmg_mult *= 0.25;
		
		// for players
		if (lst.flags & FL_CLIENT)
		{
			// Reki (July 11 2023): for players, let's be a bit more discerning about thru-wall hits
			traceline(self.origin, center_point, MOVE_NOMONSTERS, self);
			if (trace_fraction < 1)
			{
				float hitwall = TRUE;
				vector jiggle_vecs[] = {'8 0 0', '-8 0 0', '0 8 0', '0 -8 0', '0 0 8', '0 0 -8'};
				for(float i = 0; i < jiggle_vecs.length; i++)
				{
					traceline(self.origin + jiggle_vecs[i], center_point, MOVE_NOMONSTERS, self);
					if (trace_fraction < 1)
						continue;
					hitwall = FALSE;
					break;
				}
				if (hitwall) // cut the range in half on a thru-wall
				{
					dmg_mult -= 0.5;
					if (dmg_mult <= 0)
						continue;
				}
			}

			// rein in damage a bit to make it more predictable
			dmg_mult = bound(0.2, dmg_mult, 0.85);

			// apply knockback
			lst.flags &= ~FL_ONGROUND;
			lst.velocity[2] += 100 * dmg_mult;
			lst.velocity += normalize(center_point - self.origin) * 400 * dmg_mult;

			dmg_to_players += dmg * dmg_mult;
		}
		//

		T_Damage(lst, self, self.owner, dmg * dmg_mult);
	}

	if (other.takedamage != DAMAGE_NO)
	{
		if (other.flags & FL_CLIENT)
		{
			other.flags &= ~FL_ONGROUND;
			other.velocity[2] += 320;
			other.velocity += normalize(((other.absmin + other.absmax)/2) - self.origin) * 600;

			dmg_to_players += dmg;
		}

		T_Damage(other, self, self.owner, dmg);
	}

	// adjust the boss' attack priority, to tell him these attack types are working (so keep it up)
	boss3_c boss = (boss3_c)self.owner;
	boss.attack_score[BOSS3_ATTACKSWEEP] += dmg_to_players * 0.3;
	//

	boss3_proj_turnintoexplosion();
	self.scale = 1.25;
}

void() fallenspawnedthink =
{
	droptofloor();
	self.fastwarp = 1;
	self.classname = "monster_fallen_boss3";
	self.think = enemy_spawner_warp_use;
	self.nextthink = time + 0.1;
};

void() boss3_summonball_explode {

	if (self.owner && other == self.owner)
		return;
	if (other.solid == SOLID_TRIGGER)
		return;
	if (other.wrathflags & FL_PROJECTILE)
		return;

	// sound
	sound(self, CHAN_BODY, "misc/null.wav", 0, 0); // stop loop
	float r = random();
	if (r < 0.33)
		sound7(self, CHAN_AUTO, "enemies/brute/proj_impact1.ogg", 1, 0.25, random(95,105), 0);
	else if (r < 0.67)
		sound7(self, CHAN_AUTO, "enemies/brute/proj_impact2.ogg", 1, 0.25, random(95,105), 0);
	else
		sound7(self, CHAN_AUTO, "enemies/brute/proj_impact3.ogg", 1, 0.25, random(95,105), 0);
	//

	// deal damage
	float dmg_to_players = 0; // we need to track this to adjust our attack priorities
	float dmg = boss3_regularprojsplashdamage;
	float range = boss3_regularprojsplashradius;
	for(entity lst = findradius(self.origin, range + 32); lst; lst = lst.chain)
	{
		if (lst.takedamage == DAMAGE_NO)
			continue;
		if (lst == other) // we'll apply direct damage to them
			continue;

		vector center_point = ((lst.absmin + lst.absmax)/2);
		float dmg_mult = 1 - (vlen(self.origin - center_point) / range);
		if (dmg_mult <= 0) // ent was out of range
			continue;
		if (lst.flags & FL_MONSTER) // monsters should take reduced splash damage
			dmg_mult *= 0.25;
		
		// for players
		if (lst.flags & FL_CLIENT)
		{
			// rein in damage a bit to make it more predictable
			dmg_mult = bound(0.2, dmg_mult, 0.85);

			// apply knockback
			lst.flags &= ~FL_ONGROUND;
			lst.velocity[2] += 100 * dmg_mult;
			lst.velocity += normalize(center_point - self.origin) * 400 * dmg_mult;

			dmg_to_players += dmg * dmg_mult;
		}
		//

		T_Damage(lst, self, self.owner, dmg * dmg_mult);
	}

	dmg = boss3_regularprojdamage;
	if (other.takedamage != DAMAGE_NO)
	{
		if (other.flags & FL_CLIENT)
		{
			other.flags &= ~FL_ONGROUND;
			other.velocity[2] += 320;
			other.velocity += normalize(((other.absmin + other.absmax)/2) - self.origin) * 600;

			dmg_to_players += dmg;
		}

		T_Damage(other, self, self.owner, dmg);
	}

	//
	local entity fallenspawned = spawn();
	setmodel(fallenspawned, "models/warp/warp.md3");
	fallenspawned.solid = SOLID_TRIGGER;
	fallenspawned.origin = self.origin + '0 0 16';
	setsize(fallenspawned,'-32 -32 -32', '32 32 32');
	fallenspawned.movetype = MOVETYPE_WALK;
	fallenspawned.classmonster1 = 1;
	fallenspawned.local_classmonster = 1;
	fallenspawned.effects += EF_NODRAW;
	fallenspawned.warped = 1;
	fallenspawned.count = 1;
	fallenspawned.think = fallenspawnedthink;
	fallenspawned.nextthink = time + 0.5;

	// jiggle the fallen around until they're free
	float jiggle_success = FALSE;
	for(float i = 0; i < 32; i++)
	{	
		vector jiggle = fallenspawned.origin + [crandom() * 64, crandom() * 64, -16  + (random() * 96)];
		tracebox(jiggle, fallenspawned.mins, fallenspawned.maxs, jiggle + '0 0 1', MOVE_NORMAL, fallenspawned);
		if (trace_startsolid) // damn, we're still in a solid... next!
			continue;
		
		// we finally found a suitable place
		tracebox(jiggle, fallenspawned.mins, fallenspawned.maxs, jiggle + '0 0 -1024', MOVE_NORMAL, fallenspawned);
		fallenspawned.origin = trace_endpos; // move down to the floor, and we're good to go
		jiggle_success = TRUE;
		break;
	}

	if (!jiggle_success) // we can't spawn the fallen if they didn't find a successful jiggle spot
		remove(fallenspawned);
	//

	boss3_proj_turnintoexplosion();
}

entity(boss3_c boss, float offs_a) boss3_firesummon {

	local vector tagorg;
	local float tagindex;
	tagindex = gettagindex(boss, "tag_mouth");
	tagorg = gettaginfo(boss, tagindex);

	soundwrath(boss, CHAN_BODY, sprintf("enemies/boss3/firesummon%.0f.ogg", floor(random(3)) + 1), 1, 0.17, random(80, 120), 0, 0.1);

	entity missile = spawn ();
    missile.owner = boss;
    missile.movetype = MOVETYPE_TOSS;
    missile.solid = SOLID_TRIGGER;
	missile.wrathflags |= FL_PROJECTILE;
	missile.touch = boss3_summonball_explode;

	setorigin(missile, tagorg);

	sound7(missile, CHAN_BODY, "enemies/keeper/shield_loop.ogg", 1, 0.5, random(80, 120), 0); // start loop
	missile.traileffectnum = particleeffectnum("boss3projsummon");
	setmodel(missile, "models/projectiles/proj_boss3summon.md3");
    setsize (missile, '-5 -5 -5', '5 5 5');


	// 
	boss.enemy = single_player;
	vector destination = boss.enemy.origin;
	float brute_projvel = 500;
	float dist = min(768, vlen(boss.enemy.origin - tagorg));

	if(fabs(boss.enemy.origin[2] - tagorg[2]) > 512)
		brute_projvel = brute_projvel + ((dist - brute_projvel) * 0.23);



	vector wish_enemyorigin = destination;
	float disttime = vlen (destination - tagorg);
	disttime = disttime / brute_projvel; //aprox time

	wish_enemyorigin_x += boss.enemy.velocity_x * disttime * 0.55;// * disttime * 0.25;
	wish_enemyorigin_y += boss.enemy.velocity_y * disttime * 0.55;// * disttime * 0.25;
	wish_enemyorigin_z += boss.enemy.velocity_z * disttime * 0.15;// * disttime * 0.05;
		
	vector xofs = wish_enemyorigin - (tagorg + '0 0 32');
	float z = xofs_z;
	xofs_z = 0;
	float y = vlen(xofs);

	float a = 0.5 * 600 * y * y / (brute_projvel * brute_projvel);
	float b = -y;
	float c = a + z;

	if(b*b < 4*a*c)
	{
		float gravity_modifier =  (4*a*c)/(b*b); 
		float degree_proj =  42.5;
	}
	else
	{
		float tanx = (-b - (sqrt(b * b - (4*a*c )))) / (2*a);
		degree_proj =  atan(tanx) * RAD2DEG;
	}

	vector vec = normalize(wish_enemyorigin - tagorg);
	vector ang = vectoangles(vec);
	ang[0] = -degree_proj;
	ang[1] = boss.angles[1] + offs_a;
	makevectors (ang);
	

	missile.velocity = v_forward * brute_projvel;
	missile.velocity[2] += (70 + random(30));
	//

	
	
	pointparticles(particleeffectnum("brutemuzzle"), tagorg, '0 0 0', 3);
	te_customflash (tagorg,92,0.55,'0.75 0.6 0.2');

	entity slag_explo = spawn();
	setattachment(slag_explo, boss, "tag_mouth");
	float skinn = ceil(random() *4);
	if (skinn == 4)
		skinn = 0;
	slag_explo.scale =  0.75;
	slag_explo.alpha = 0.75;
	slag_explo.colormod = '0.75 0.75 0.2';
	slag_explo.skin = skinn * 10;
	setmodel(slag_explo, "particles/explo/explo_slag2.md3");
	slag_explo.think = slag2_explode1;
	slag_explo.nextthink = time + 0.05;	

	return missile;
}

void() boss3_projectileangle {
	self.angles = vectoangles(self.velocity);

	self.frame = min(vlen(self.velocity) / 800, 3);

	self.think = boss3_projectileangle;
	self.nextthink = time + 0.05;
}

entity(boss3_c boss, float offs_a) boss3_fireproj {

	local vector tagorg;
	local float tagindex;
	tagindex = gettagindex(boss, "tag_mouth");
	tagorg = gettaginfo(boss, tagindex);

	soundwrath(boss, CHAN_BODY, sprintf("enemies/boss3/fire%.0f.ogg", floor(random(5)) + 1), 1, 0.17, random(80, 120), 0, 0.1);

	entity missile = spawn ();
    missile.owner = boss;
    missile.movetype = MOVETYPE_TOSS;
    missile.solid = SOLID_TRIGGER;
	missile.wrathflags |= FL_PROJECTILE;
	missile.touch = boss3_smallproj_explode;
	missile.think = boss3_projectileangle; // think chain to align angle :(
	missile.nextthink = time + random(0.05);
	missile.deflection_cost = 4 | DEFLECTION::BYPASSTIMER;

	setorigin(missile, tagorg);

	sound7(missile, CHAN_BODY, "enemies/brute/proj_loop.ogg", 1, 0.5, random(80, 120), 0); // start loop
	missile.traileffectnum = particleeffectnum("boss3projfireball");
	setmodel(missile, "models/projectiles/proj_boss3.md3");
    setsize (missile, '-5 -5 -5', '5 5 5');


	// 
	boss.enemy = single_player;
	vector destination = boss.enemy.origin;
	float brute_projvel = 900;
	float dist = vlen (boss.enemy.origin - tagorg);


	if(dist > 1200 || fabs(boss.enemy.origin[2] - tagorg[2]) > 512)
		brute_projvel = brute_projvel + ((dist - brute_projvel) * 0.23);

	if(brute_projvel > 1900)
		brute_projvel = 1900;



	vector wish_enemyorigin = destination;
	float disttime = vlen (destination - tagorg);
	disttime = disttime / brute_projvel; //aprox time

	wish_enemyorigin_x += boss.enemy.velocity_x * disttime * 0.55;// * disttime * 0.25;
	wish_enemyorigin_y += boss.enemy.velocity_y * disttime * 0.55;// * disttime * 0.25;
	wish_enemyorigin_z += boss.enemy.velocity_z * disttime * 0.15;// * disttime * 0.05;
		
	vector xofs = wish_enemyorigin - (tagorg + '0 0 32');
	float z = xofs_z;
	xofs_z = 0;
	float y = vlen(xofs);

	float a = 0.5 * 600 * y * y / (brute_projvel * brute_projvel);
	float b = -y;
	float c = a + z;

	if(b*b < 4*a*c)
	{
		float gravity_modifier =  (4*a*c)/(b*b); 
		float degree_proj =  42.5;
	}
	else
	{
		float tanx = (-b - (sqrt(b * b - (4*a*c )))) / (2*a);
		degree_proj =  atan(tanx) * RAD2DEG;
	}

	vector vec = normalize(wish_enemyorigin - tagorg);
	vector ang = vectoangles(vec);
	ang[0] = -degree_proj;
	offs_a = boss.angles[1] + offs_a;
	ang[1] -= angle_difference(ang[1], offs_a) * 0.45;

	makevectors (ang);
	

	missile.velocity = v_forward * brute_projvel;
	missile.velocity[2] += (70 + random(120));
	//

	
	
	pointparticles(particleeffectnum("brutemuzzle"), tagorg, '0 0 0', 3);
	te_customflash (tagorg,92,0.55,'0.75 0.6 0.2');

	entity slag_explo = spawn();
	setattachment(slag_explo, boss, "tag_mouth");
	float skinn = ceil(random() *4);
	if (skinn == 4)
		skinn = 0;
	slag_explo.scale =  0.75;
	slag_explo.alpha = 0.75;
	slag_explo.colormod = '0.75 0.75 0.2';
	slag_explo.skin = skinn * 10;
	setmodel(slag_explo, "particles/explo/explo_slag2.md3");
	slag_explo.think = slag2_explode1;
	slag_explo.nextthink = time + 0.05;	

	return missile;
}

float() boss3_c::anim_sweepleft {
	float frame_first = boss3c_attackl4;
	float frame_last = boss3c_attackl16;

	if (this.s2_mutilation > 0 && FALSE)
	{
		frame_first = boss3d_attackl4;
		frame_last = boss3d_attackl16;
	}

	if (this.frame >= frame_first && this.frame <= frame_last)
	{
		float m = this.frame % 2;
		float a = (this.frame - frame_first) / 12;
		if (m == 1)
			return FALSE;
		
		a -= 0.5;
		a *= 90;
		boss3_fireproj(this, -a);
	}

	return FALSE;
}

float() boss3_c::anim_sweepright {

	float frame_first = boss3c_attackr4;
	float frame_last = boss3c_attackr16;

	if (this.s2_mutilation > 0 && FALSE)
	{
		frame_first = boss3d_attackr4;
		frame_last = boss3d_attackr16;
	}

	if (this.frame >= frame_first && this.frame <= frame_last)
	{
		float m = this.frame % 2;
		float a = (this.frame - frame_first) / 12;
		if (m == 1)
			return FALSE;
		
		a -= 0.5;
		a *= -90;
		boss3_fireproj(this, -a);
	}

	return FALSE;
}

float() boss3_c::anim_summonleft {

	if (this.frame >= boss3c_attackl4 && this.frame <= boss3c_attackl16)
	{
		float m = this.frame % 2;
		float a = (this.frame - boss3c_attackl4) / 12;
		if (m == 1)
			return FALSE;
		
		a -= 0.5;
		a *= 90;
		boss3_firesummon(this, -a);
	}

	return FALSE;
}

#define HOMINGPROJ_FRAMETIME 0.013
class boss3_homingprojectile_c {
	vector thrust_vec;
	vector last_seen;

	entity debug;

	nonvirtual void(entity, float) pain;
	nonvirtual void() die;
	nonvirtual void() phys;
	nonvirtual void() explode;
};

void() boss3_homingprojectile_c::explode {
	
	if (self.owner && other == self.owner)
		return;
	if (other.solid == SOLID_TRIGGER)
		return;
	if (other.wrathflags & FL_PROJECTILE)
		return;

	// sound
	sound(self, CHAN_BODY, "misc/null.wav", 0, 0); // stop loop
	sound7(self, CHAN_AUTO, "enemies/symbol/impact.ogg", 1, 0.25, random(95,105), 0);
	sound7(self, CHAN_AUTO, "enemies/wraith/pain2.ogg", 1, 0.25, random(105,120), 0);
	//

	// deal damage
	float dmg_to_players = 0; // we need to track this to adjust our attack priorities
	float dmg = boss3_homingprojsplashdamage;
	float range = boss3_homingprojsplashradius;
	for(entity lst = findradius(self.origin, range + 32); lst; lst = lst.chain)
	{
		if (lst.takedamage == DAMAGE_NO)
			continue;
		if (lst == other) // we'll apply direct damage to them
			continue;

		vector center_point = ((lst.absmin + lst.absmax)/2);
		float dmg_mult = 1 - (vlen(self.origin - center_point) / range);
		if (dmg_mult <= 0) // ent was out of range
			continue;
		if (lst.flags & FL_MONSTER) // monsters should take reduced splash damage
			dmg_mult *= 0.25;
		
		// for players
		if (lst.flags & FL_CLIENT)
		{
			// Reki (July 11 2023): for players, let's be a bit more discerning about thru-wall hits
			traceline(this.origin, center_point, MOVE_NOMONSTERS, this);
			if (trace_fraction < 1)
			{
				float hitwall = TRUE;
				vector jiggle_vecs[] = {'8 0 0', '-8 0 0', '0 8 0', '0 -8 0', '0 0 8', '0 0 -8'};
				for(float i = 0; i < jiggle_vecs.length; i++)
				{
					traceline(this.origin + jiggle_vecs[i], center_point, MOVE_NOMONSTERS, this);
					if (trace_fraction < 1)
						continue;
					hitwall = FALSE;
					break;
				}
				if (hitwall) // cut the range in half on a thru-wall
				{
					dmg_mult -= 0.5;
					if (dmg_mult <= 0)
						continue;
				}
			}

			// rein in damage a bit to make it more predictable
			dmg_mult = bound(0.2, dmg_mult, 0.85);
			
			// apply knockback
			float old_vel = vlen(lst.velocity);
			lst.flags &= ~FL_ONGROUND;
			lst.velocity[2] += 350 * dmg_mult;
			lst.velocity += normalize(center_point - self.origin) * 700 * dmg_mult;
			if (vlen(lst.velocity) > 800)
				lst.velocity = normalize(lst.velocity) * max(800, old_vel);

			dmg_to_players += dmg * dmg_mult;
		}
		//

		T_Damage(lst, self, self.owner, dmg * dmg_mult);
	}

	dmg = boss3_homingprojdamage;
	if (other.takedamage != DAMAGE_NO)
	{
		if (other.flags & FL_CLIENT)
		{
			float old_vel = vlen(other.velocity);
			other.flags &= ~FL_ONGROUND;
			other.velocity[2] += 450;
			other.velocity += normalize(((other.absmin + other.absmax)/2) - self.origin) * 800;
			if (vlen(other.velocity) > 800)
				other.velocity = normalize(other.velocity) * max(800, old_vel);

			dmg_to_players += dmg;
		}

		T_Damage(other, self, self.owner, dmg);
	}

	// adjust the boss' attack priority, to tell him these attack types are working (so keep it up)
	if (random() < 0.5)
	{
		boss3_c boss = (boss3_c)self.owner;
		boss.attack_score[BOSS3_ATTACKFLUSH] += (dmg_to_players > 0) * 2;
	}
	//

	if (this.debug)
	{
		remove(this.debug);
		this.debug = 0;
	}

	boss3_proj_turnintoexplosion();
	self.scale = 4;
}

void() boss3_homingprojectile_c::phys {
	frametime = HOMINGPROJ_FRAMETIME;
	this.think = this.phys;
	this.nextthink = time + HOMINGPROJ_FRAMETIME;
	
	this.flags |= FL_ONGROUND;

	if (this.trinket_touched) // we got hit by the orb of deflection
	{
		this.trinket_touched = 0;
		this.thrust_vec = -this.thrust_vec;
		this.enemy = boss3_entity;
	}
	
	// update last seen location of the player
	traceline(this.origin, this.enemy.origin, MOVE_NORMAL, this);
	if (trace_fraction >= 1 || trace_ent == this.enemy)
		this.last_seen = trace_endpos;
	//

	// check if we need to steer around some obstacles
	vector org_base = (this.origin + (this.thrust_vec * 0.4));
	tracebox(org_base, '-4 -4 -4', '4 4 4', this.last_seen, MOVE_NORMAL, this);
	if ((trace_ent != this.enemy) && (trace_fraction < 1 || trace_startsolid))
	{
		makevectors(this.angles); // hack
		float steerage = 1.35;
		float check_dist = 96;

		vector vecs_to_try[] = {v_right * 0.5, -v_right * 0.5, v_up * 0.5, -v_up * 0.5, v_right, -v_right, v_up, -v_up};

		for(float i = 0; i < vecs_to_try.length; i++)
		{
			vector vec = vecs_to_try[i]; // try each vector

			traceline(org_base + (vec * check_dist), this.last_seen, MOVE_NORMAL, this.enemy);
			if (trace_fraction >= 1) // woohoo, it worked
			{
				this.thrust_vec = (this.thrust_vec + (vec * steerage * frametime)); // steer right a bit
				break;
			}
		}
	}
	//

	float turning_mult = 1.58;
	this.thrust_vec = lerpVector(this.thrust_vec, normalize(this.last_seen - this.origin), turning_mult * frametime);
	vector thrust_to_use = (this.thrust_vec);
	if (vlen(thrust_to_use) < 0.75 && time > this.pain_finished)
		thrust_to_use = normalize(thrust_to_use) * 0.75;

	vector goal = this.origin + ((thrust_to_use * 700) * frametime);
	traceline(this.origin, goal, MOVE_NORMAL, this);
	setorigin(this, trace_endpos);

	if (this.debug)
		setorigin(this.debug, this.last_seen);

	this.angles = vectoangles(this.thrust_vec);

	// do touches
	vector diff = (this.origin - this.last_seen);

	if (trace_fraction < 1)
	{
		Ent_DoTouch(this, trace_ent);
	}
	else if (vlen(diff) < 128 && (diff * this.thrust_vec > 0)) // we went past, explode!
	{
		this.touch();
	}
}

void(entity attacker, float dmg) boss3_homingprojectile_c::pain {
	if !(attacker.flags & FL_CLIENT)
		return;
	
	float knock = dmg * 0.02;
	this.thrust_vec *= 0.4;
	this.thrust_vec += (normalize(this.origin - attacker.origin) + ([crandom(), crandom(), crandom()] * 0.1)) * knock;
	this.pain_finished = time + 1; // Reki (July 11 2023): pain_finished to track when to enforce minimum speed
}

void() boss3_homingprojectile_c::die {
	this.explode();
}

void(entity ent) boss3_homingprojectile_deflect {
	boss3_homingprojectile_c proj = (boss3_homingprojectile_c)ent;
	proj.thrust_vec = -proj.thrust_vec * 2;
	proj.last_seen = boss3_entity.origin;
}

void() boss3_homingprojectile_setup {
	boss3_homingprojectile_c proj = (boss3_homingprojectile_c)self;
	spawnfunc_boss3_homingprojectile_c();

	// poll last known location of the player from the boss
	proj.last_seen = ((boss3_c)proj.owner).last_seen;
	//

	proj.velocity = 0;
	proj.touch = proj.explode;

	//proj.debug = spawn();
	//setmodel(proj.debug, "models/dev/node.md3");
	
	proj.think = proj.phys;
	proj.nextthink = time + HOMINGPROJ_FRAMETIME;
}

float() boss3_c::anim_firehoming {

	if (this.frame == boss3c_attackrng7)
	{
		float separation = 45;
		float offs = -separation * 0.5 * this.s2_mutilation;
		for(float i = 0; i <= this.s2_mutilation; i++)
		{
			boss3_homingprojectile_c proj = (boss3_homingprojectile_c)boss3_fireproj(this, 0);
			soundwrath(this, CHAN_BODY, "enemies/boss3/firehoming.ogg", 1, 0.17, random(80, 120), 0, 0.1);

			proj.classname = "boss3_homingprojectile_c";
			proj.dphitcontentsmask = DPCONTENTS_SOLID | DPCONTENTS_BODY | DPCONTENTS_MONSTERCLIP;
			proj.movetype = MOVETYPE_STEP;
			proj.flags |= FL_ONGROUND;
			proj.wrathflags |= FL_PROJECTILE;
			proj.enemy = this.enemy;
			proj.owner = this;
			proj.takedamage = DAMAGE_YES;
			proj.th_pain = proj.pain;
			proj.th_die = proj.die;
			proj.health = 170;
			proj.solid = DPCONTENTS_WEAPONCLIP; // Reki (July 11 2023): Does this work...? I hope so.
			proj.traileffectnum = particleeffectnum("boss3projhoming");
			sound7(proj, CHAN_BODY, "enemies/symbol/proj_loop.ogg", 1, 0.125, random(80, 120), 0); // start loop

			setmodel(proj, "models/projectiles/proj_boss3homing.md3");
			setsize(proj, '-16 -16 -16', '16 16 16');

			proj.think = boss3_homingprojectile_setup;
			proj.nextthink = time + 0.01;

			makevectors(this.angles + [offs * 0.1, offs, 0]);
			proj.thrust_vec = [0, 0, random(-0.1, 0.3)] + (v_forward * random(0.1, 0.4));
			offs += separation;
		}
	}


	return FALSE;
}

void() boss3_c::attack_sweep {
	this.attack_score[BOSS3_ATTACKSWEEP] = max(0, this.attack_score[BOSS3_ATTACKSWEEP] - 8);

	if (random() < 0.5)
	{
		//if (this.s2_mutilation == 2)
		//	this.animation_start(boss3d_attackl1, boss3d_attackl20, this.anim_sweepleft);
		//else if (this.s2_mutilation == 1)
		//	this.animation_start(boss3e_attackl1, boss3e_attackl20, this.anim_sweepleft);
		//else
			this.animation_start(boss3c_attackl1, boss3c_attackl20, this.anim_sweepleft);
	}
	else
	{
		//if (this.s2_mutilation == 2)
		//	this.animation_start(boss3d_attackr1, boss3d_attackr20, this.anim_sweepright);
		//else if (this.s2_mutilation == 1)
		//	this.animation_start(boss3e_attackr1, boss3e_attackr20, this.anim_sweepright);
		//else
			this.animation_start(boss3c_attackr1, boss3c_attackr20, this.anim_sweepright);
	}
}

void() boss3_c::attack_summon {
	this.attack_score[BOSS3_ATTACKSUMMON] = max(0, this.attack_score[BOSS3_ATTACKSUMMON] - 35);
	this.animation_start(boss3c_attackl1, boss3c_attackl20, this.anim_summonleft);
}

void() boss3_c::attack_homing {
	this.attack_score[BOSS3_ATTACKFLUSH] = max(0, this.attack_score[BOSS3_ATTACKFLUSH] - 37);

	this.animation_start(boss3c_attackrng1, boss3c_attackrng20, this.anim_firehoming);
}

void() boss3_c::stage2 {
	this.th_pain = this.pain_stage2;
	this.velocity = '0 0 0';
	this.bloodimpact = 6;
	setorigin(this, this.s2_homelocation);

	if (this.s2_mutilation == -1)
	{
		this.boss_health = boss3_health;
		this.s2_mutilation = 0;
		this.frame = boss3c_base;
		this.solid = SOLID_BBOX;
		animation_start(501, 620, __NULL__);
		setmodel(this, "models/enemies/boss3/boss3_c.md3");
		setsize (this, '-100 -100 -192', '100 100 192');
		this.attack_score[BOSS3_ATTACKSWEEP] = 30;
		animation_start(boss3c_sit1, boss3c_sit10, __NULL__);
		return;
	}
	else if (this.s2_mutilation > 2)
	{
		this.stage = 3;
		this.trigger_stage(this.stage);
		this.frame = boss3f_base;
		setmodel(this, "models/enemies/boss3/boss3_f.md3");
		setsize (this, '-100 -100 -192', '100 100 192');
		this.boss_health = boss3_mutilationchealth;
		this.animation_start(boss3f_mutil1, boss3f_mutil20, this.anim_raiseinair);

		// Reki (July 12 2023): throw crown gibs since model f doesn't have a crown
		vector tagorg = tag_origin("tag_crown_l", this);
		explo_blood(2, tagorg);	
		ThrowGib3(this, "models/enemies/boss3/gibs/crown_l.md3", 0, 0.75, 1, 1, tagorg, centervel(tagorg , this.origin) * random(128,192), 0, 3);	 
		tagorg = tag_origin("tag_crown_r",self);
		explo_blood(2, tagorg);	
		ThrowGib3(this, "models/enemies/boss3/gibs/crown_r.md3", 0, 0.75, 1, 1, tagorg, centervel(tagorg , this.origin)* random(128,192), 0, 3);
		//
		return;
	}

	if (!this.flail_bbox) // flail bbox
	{
		const vector padding = '96 96 24';
		entity bbox = this.flail_bbox = spawn();
		setsize(bbox, this.mins - padding, this.maxs + padding);
		bbox.touch = boss3_flail_bbox_touch;
		bbox.solid = SOLID_TRIGGER;
		bbox.owner = this;
	}

	// set yaw goal
	this.yaw_goal = vectoangles((single_player.origin + (single_player.velocity * 0.8)) - this.origin)[1];

	// turn torwards player
	float adiff = angle_difference(this.angles[1], this.yaw_goal);
	if (fabs(adiff) > 1)
	{
		float delta = this.yaw_speed * 0.8 * frametime;
		delta = min(delta, fabs(adiff));
		if (adiff > 0)
			this.angles[1] -= delta;
		else
			this.angles[1] += delta;
	}

	if (fabs(adiff) > 8)
	{
		this.frame = max(boss3c_turn1, this.frame + 1);
		if (this.frame > boss3c_turn10)
			this.frame = boss3c_turn1;
		return;
	}
	else
	{
		this.frame = boss3c_sit10;
	}

	// evaluate attack priorities
	for(float i = 0; i < BOSS3_ATTACKPATTERNS; i++)
	{
		this.attack_score[i] = min(this.attack_score[i] + frametime, 60);
	}

	// special case for summoning attack
	float count_to_use[] = {boss3_fallennumbera, boss3_fallennumberb, boss3_fallennumberc};
	this.attack_score[BOSS3_ATTACKSUMMON] = min(this.attack_score[BOSS3_ATTACKSUMMON] + (frametime * 2), (count_to_use[s2_mutilation] - boss3_fallencount) * 6);

	//execute attack with highest priority
	if (time > this.attack_finished)
	{
		//this.attack_func[BOSS3_ATTACKSWEEP]();
		float best_attack, best_score = -1;
		for(float i = 0; i < BOSS3_ATTACKPATTERNS; i++)
		{
			if (this.attack_score[i] < best_score)
				continue;
			
			best_score = this.attack_score[i];
			best_attack = i;
		}

		this.attack_func[best_attack]();
		this.attack_finished = time + 3;
	}
	//
}
/* #endregion */

/* #region stage 3 (last stand... shoop-da-whoop) */
#define BOSS3_DEATHROTATESPEED	200
void(entity attacker, float dmg) boss3_c::pain_stage3 {
	if (this.stage != 3 || this.s2_mutilation < 0)
		return;

	if !(attacker.flags & FL_CLIENT) // we don't want any monsters to finish the boss off
		return;

	this.health = 99999; // keep our true health very high always
	this.boss_health -= dmg;

	if (this.boss_health <= 0)
	{
		spawn_shaker(this, 25, 0.5, 2048);
		this.stage = 4;
		this.bloodimpact = 1;
		this.trigger_stage(this.stage);

		this.animation_start(boss3f_dspin1, boss3f_dspin10, this.anim_death);
		soundwrath(this, CHAN_VOICE, "enemies/boss3/die1.ogg", 1, 0.1, 0, 0, 0.5);
	}
}

float() boss3_c::anim_raiseinair {
	float f_frame = boss3f_mutil12;
	
	if (this.frame < f_frame)
		return FALSE;

	float spd = ((this.frame - f_frame) / (boss3f_mutil20 - f_frame));
	this.origin[2] += 24 * slerp(0, 1, 1 - spd);
	this.angles[1] -= spd * BOSS3_DEATHROTATESPEED * frametime;

	this.flags |= FL_ONGROUND;

	setorigin(this, this.origin);

	return FALSE;
}

class boss3_deathorb_c {
	float lifetime;
	float starttime;

	float radius_start;
	float radius_end;

	nonvirtual void() mainloop {
		float frac = (time - starttime) / lifetime;
		float rad = lerp(radius_start, radius_end, frac);

		for(entity lst = findflags(world, ::flags, FL_MONSTER); lst; lst = findflags(lst, ::flags, FL_MONSTER))
		{
			if (lst.takedamage == DAMAGE_NO)
				continue;

			if (vlen(lst.origin - this.origin) > rad)
				continue;

			T_Damage(lst, this, world, 1024);
		}

		// player effect
		if (!single_player.boss_shockwave_time && vlen(single_player.origin - this.origin) <= rad)
		{
			single_player.boss_shockwave_time = time + 5;
			single_player.r_healthhaze = 0.9;
			spawn_shaker(single_player, 20, 3, 768);

			// knockback player with the shockwave
			vector diff = normalize(single_player.origin - this.origin);
			diff[2] *= 0.2; // less Z effect
			single_player.velocity *= 0.2; // less player starting velocity

			if (single_player.flags & FL_ONGROUND)
			{
				diff[2] = max(0, diff[2]);
				single_player.velocity_z += 270;
			}

			Controller_Rumble(single_player, 1, 0.75, 900);
			single_player.velocity += diff * 650;
			single_player.flags &= ~FL_ONGROUND;
		}

		this.think = this.mainloop;
		this.nextthink = time + 0.025;
	};
	nonvirtual void() boss3_deathorb_c {
		this.starttime = time;
		setorigin(this, this.origin);

		this.think = this.mainloop;
		this.nextthink = time + 0.025;
	};
};

/* #region death orb */
static const float boss3_orbmovements_pos[] = {
	50,
	45,
	43,
	40,
	35,
	15,
	-10,
	-50,
	-100,
	-170,
	-300,
	-530,
	-530,
	-530,
};

static const float boss3_orbmovements_scale[] = {
	3,
	3,
	3,
	5,
	9,
	6,
	7,
	9,
	10,
	10,
	8,
	6,
	2,
	0.001,
};

const float boss3_orbmovements_period = 0.7;

void boss3_soulorb_think(void)
{
	if (time >= self.attack_finished)
	{
		if (self.health == 0) // first sim
		{
			self.lorigin = self.origin;
		}
		
		self.attack_finished = time + boss3_orbmovements_period;
		self.health++;
		if (self.health >= boss3_orbmovements_pos.length)
		{
			remove(self);
			return;
		}
	}

	makevectors(self.v_angle);
	float ind1 = bound(0, self.health - 1, boss3_orbmovements_pos.length - 1);
	float pos1 = boss3_orbmovements_pos[ind1];
	float scale1 = boss3_orbmovements_scale[ind1];
	// movement is relative
	vector move1 = self.lorigin + ('0 0 1' * pos1);

	float ind2 = bound(0, self.health, boss3_orbmovements_pos.length - 1);
	float pos2 = boss3_orbmovements_pos[ind2];
	float scale2 = boss3_orbmovements_scale[ind2];
	// movement is relative
	vector move2 = self.lorigin + ('0 0 1' * pos2);


	// interpolate
	float frac = 1 - ((self.attack_finished - time) / boss3_orbmovements_period);
	self.scale = lerp(scale1, scale2, frac);
	self.origin = lerpVector(move1, move2, frac);

	self.light_lev = 800 * (self.scale / 10);


	// using armorvalue as a scratch to track if we've passed the lava boundary yet
	if !(self.armorvalue)
	{
		if (self.origin[2] < (self.lorigin[2] - 480))
		{
			self.armorvalue = 1;
			vector org = self.lorigin + '0 0 -512';
			for(float i = 0; i < 5; i++)
			{
				float yaw = i * (360 / 5);
				float mag = random(1, 128);
				makevectors([0, yaw, 0]);
				entity ball = spawn_lava_ball(org + (v_forward * mag));
				ball.scale = random(1.5, 2);
				ball.velocity = [random(-30, 30), random(-30, 30), random(400, 800)];
				ball.velocity += v_forward * (mag + random(100, 200));
				ball.origin[2] += random(-10, -20);
			}

			entity proj = spawn();
			setorigin(proj, self.origin);

			entity o_self = self;
			self = proj;
			cannon_proj_touch_impact(1);
			string snd = strcat("impact/projectiles/slag1_explo", ftos(floor(random() * 4) + 1), ".ogg");
			pointparticles(particleeffectnum("slag"), org, v_forward *(-550), 1);
			sound(self, CHAN_AUTO, snd, 1, 0.25);
			self = o_self;
		}
	}
	//

	self.think = boss3_soulorb_think;
	self.nextthink = time + 0.013889;
}

entity boss3_soulorb_spawn(vector ang)
{
	entity orb = spawn();
	setmodel(orb, "models/enemies/boss3/boss3_end.md3");
	orb.scale = 0.001;

	orb.health = 0;
	orb.v_angle = ang;

	orb.think = boss3_soulorb_think;
	orb.nextthink = time + 0.025;

	orb.pflags = PFLAGS_FULLDYNAMIC | PFLAGS_NOSHADOW;
	orb.color = '1.2 0.9 0.4';
	
	//orb.effects = EF_NOPVSCULL;// | EF_NODEPTHTEST;

	return orb;
}
/* #endregion */

float() boss3_c::anim_death {

	this.frame++;
	this.flags |= FL_ONGROUND;

	if (this.frame < boss3f_dspin10)
	{
		float spd = 1 - ((boss3f_dspin10 - this.frame) / 10);
		this.angles[1] -= 30 + (110 * spd);
		this.origin[2] += 35 * spd;
		setorigin(this, this.origin);
	}
	else
	{
		this.angles[1] -= 140;
	}
	
	vector org = (this.absmin + this.absmax) / 2;
	if (this.frame == boss3f_dspin10)
	{
		tempent_expandingorb(org, '1 0 0', '24 512', '0.5 0', 0.2);
	}
	else if (this.frame == boss3f_dspin12)
	{
		tempent_expandingorb(org, '1 0 0', '24 900', '0.5 0', 0.4);
	}
	else if (this.frame == boss3f_dspin20)
	{
		entity orb = boss3_soulorb_spawn(this.angles);
		setorigin(orb, this.origin);

		//tempent_expandingorb(org, '1 0 0', '128 920', '2 0', 2);
		//tempent_expandingorb(org, '1 0 0', '128 1600', '2 0', 3);
		tempent_expandingorb(org, '1 0 0', '128 5120', '2 0', 3);
		spawn(boss3_deathorb_c, origin: org, lifetime: 3, radius_start: 128, radius_end: 5120);
		bossmartyr_c::explode();
		killed_monsters ++;
		WriteByte(MSG_ALL, SVC_KILLEDMONSTER);
		remove(this);
		return TRUE;
	}

	return TRUE;
}

void() boss3_c::attack_spam {
	if (!this.s3_enemytarget)
		this.s3_enemytarget = spawn();
	vector org;
	this.enemy = this.s3_enemytarget;
	if (custom_infront(single_player, this.angles, this.origin, 60))
	{
		org = (single_player.origin) + (single_player.velocity * 1.2);
	}
	else
	{
		makevectors(this.angles);
		float dist = vlen(this.origin - single_player.origin);
		org = v_forward * dist;
	}
	org_x += random(-64, 64);
	org_y += random(-64, 64);
	org_z += random(-32, 64);
	setorigin (this.s3_enemytarget, org);

	this.s3_projectiletype = max(1, this.s3_projectiletype + 1);
	if (this.s3_projectiletype > 5)
		this.s3_projectiletype = 0;

	vector mouthorigin =  tag_origin("tag_mouth", this);
	if(this.s3_projectiletype == 0)
	{
		wraith_StartFast();
	}
	else if(this.s3_projectiletype == 1)
	{
		vector dir = normalize(this.enemy.origin - mouthorigin);
		launch_projectile_wre(mouthorigin, dir, this);
	}
	else if(this.s3_projectiletype == 2)
	{
		strickenprojectile2(this, -1);
		strickenprojectile2(this, 0);
		strickenprojectile2(this, 1);
	} 
	else if(this.s3_projectiletype == 3)
	{
		oppressor_missileattack(this, "tag_mouth", "tag_muzzleb");
	}
	else if(this.s3_projectiletype == 4)
	{
		vector dir = normalize(this.enemy.origin - mouthorigin);
		launch_projectile_heretic(mouthorigin, dir, this);
	}
	else if(this.s3_projectiletype == 5)
		symbol_missileattack(this,"tag_mouth",0,1);
}

void() boss3_c::stage3 {
	this.th_pain = this.pain_stage3;
	this.flags |= FL_ONGROUND;
	this.gravity = 0.001;
	this.angles[1] -= BOSS3_DEATHROTATESPEED * frametime;
	this.bloodimpact = 6;

	if (this.flail_bbox)
	{
		remove(this.flail_bbox);
		this.flail_bbox = 0;
	}

	this.frame = max(boss3f_dspin1, this.frame + 1);
	if (this.frame >= boss3f_dspin30)
		this.frame = boss3f_dspin1;

	// throw projectiles
	for(float k = 0; k < 8; k++)
	{
		this.attack_spam();

		if (random() < 0.5)
			break;
	}
}
/* #endregion */

float(entity ent) boss3_crosshairhighlight {
	if (ent.classname != "boss_guardian3")
		return FALSE;

	boss3_c boss = (boss3_c)ent;
	return (boss.stage > 1);
}

void() boss3_c::mainloop {
	frametime = 0.1;

	this.health = 99999; // always keep health super high
	this.flags &= ~FL_ONGROUND; // remove onground so we apply faux gravity

	// Reki (July 3 2023): Special case for shield graphic
	if (this.stage == 1 && this.animlock_think != this.anim_transform)
	{
		this.flags |= FL_NOTARGET;
		if (this.glowmod[0] > 0.1)
		{
			this.skin = 1;
			if (time > this.pain_finished)
			{
				this.glowmod[0] -= frametime * 3;
				this.glowmod[0] = max(0.0001, this.glowmod[0]);
				this.glowmod[2] = this.glowmod[1] = this.glowmod[0];
			}
		}
		else
		{
			this.skin = 0;
		}
	}
	else
	{
		this.flags &= ~FL_NOTARGET;
	}

	// Reki (July 6 2023): update last seen location of the player
	if (!this.enemy)
		this.enemy = single_player;

	tracebox(this.origin + [0, 0, this.maxs[2] * 0.8], '-4 -4 -4', '4 4 4', this.enemy.origin, MOVE_NORMAL, this);
	if (trace_fraction >= 1 || trace_ent == this.enemy)
	{
		this.last_seen = trace_endpos;
		this.last_seen_time = time + 8;
	}

	if (time > this.last_seen_time)
	{
		float k = 8;
		while(time > this.last_seen_time && k > 0)
		{
			k--;

			vector jiggle_loc = this.enemy.origin;
			vector jiggle_vec = normalize([crandom(), crandom(), random()]);
			jiggle_loc += jiggle_vec * (128 + (random() * 384));

			tracebox(this.enemy.origin, '-8 -8 -8', '8 8 8', jiggle_loc, MOVE_NORMAL, this.enemy);
			jiggle_loc = trace_endpos;

			tracebox(this.origin + [0, 0, this.maxs[2] * 0.8], '-4 -4 -4', '4 4 4', jiggle_loc, MOVE_NORMAL, this);
			if (trace_fraction >= 1)
			{
				this.last_seen = trace_endpos;
				this.last_seen_time = time + 3;
				break;
			}
		}
		
	}
	//

	// Reki (June 21 2023): Animation locks
	if (this.animlock_start)
	{
		float do_anim = TRUE;
		if (this.animlock_think != __NULL__)
			do_anim = !this.animlock_think(); // this will return TRUE if it handled the animation logic
		
		if (do_anim)
		{
			this.frame++;
			if (this.frame >= this.animlock_end)
			{
				this.animlock_start = 0;
				this.animlock_end = 0;
				this.animlock_think = __NULL__;
			}
		}
	}
	else // Reki (June 21 2023): Proceed to normal states if we're not in a locked animation
	{
		switch(this.stage)
		{
			case 0: this.stage0(); break;
			case 1: this.stage1(); break;
			case 2: this.stage2(); break;
			case 3: this.stage3(); break;
		}
	}

	// gravity
	if !(this.flags & FL_ONGROUND)
	{
		tracebox(this.origin, this.mins, this.maxs, this.origin + [0, 0, -800 * frametime], MOVE_NORMAL, this);
		setorigin(this, trace_endpos);
		this.flags |= FL_ONGROUND; // to stop MOVETYPE_STEP doing dumb shit
	}
	//

	// move bbox
	if (this.flail_bbox)
	{
		setorigin(this.flail_bbox, this.origin);
		force_retouch = 2;
	}

	this.think = this.mainloop;
	this.nextthink = time + 0.1;
}	

void() spawnfunc_boss_guardian3
{
	precache_sound("enemies/boss3/transform.ogg");
	precache_sound("enemies/boss3/pain1.ogg");
	precache_sound("enemies/boss3/pain2.ogg");
	precache_sound("enemies/boss3/pain3.ogg");
	precache_sound("enemies/boss3/die1.ogg");
	precache_sound("enemies/boss3/step1.ogg");
	precache_sound("enemies/boss3/step2.ogg");
	precache_sound("enemies/boss3/step3.ogg");
	precache_sound("enemies/boss3/summon_vocal.ogg");
	precache_sound("enemies/boss3/summon_success.ogg");
	precache_sound("enemies/boss3/fire1.ogg");
	precache_sound("enemies/boss3/fire2.ogg");
	precache_sound("enemies/boss3/fire3.ogg");
	precache_sound("enemies/boss3/fire4.ogg");
	precache_sound("enemies/boss3/fire5.ogg");
	precache_sound("enemies/boss3/firesummon1.ogg");
	precache_sound("enemies/boss3/firesummon2.ogg");
	precache_sound("enemies/boss3/firesummon3.ogg");
	precache_sound("enemies/boss3/firehoming.ogg");
	precache_sound("enemies/boss3/tower_destroy.ogg");

    spawnfunc_boss3_c(); // spawn the class
	boss3_c boss = (boss3_c)self;
	boss3_entity = boss;

	boss.dphitcontentsmask = DPCONTENTS_SOLID | DPCONTENTS_BOSSCLIP;
	boss.stage = 0;
}
#endif
