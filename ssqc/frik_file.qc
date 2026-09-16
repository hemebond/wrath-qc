/////////////////////////////////////////////
////////////CLIENT FRIK_FILE////////////
/////////////////////////////////////////////
float sliding_fps;
float sliding_ammount_d;
float sliding_ammount_i;
float jumpad_noinput_time;
float lava_speed;
float lava_damage;
float lava_damage_time;
float player_zviewofs;
void check_player() {
	sliding_fps         = 10;    // fps sliding factor
	sliding_ammount_d   = 0.05;  // sliding decrease factor
	sliding_ammount_i   = 0.05;  // sliding increase factor
	jumpad_noinput_time = 0.5;   // jumppad no input time
	lava_speed          = 0.9;   // lava player speed
	lava_damage         = 10;    // lava damage speed
	lava_damage_time    = 0.1;   // lava damage time
	player_zviewofs     = 22;    // player view_ofs height

	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("player.txt", FILE_READ);
	readtext = fgets(readfrik);
	sliding_fps = stof(readtext);
	readtext = fgets(readfrik);
	sliding_ammount_d = stof(readtext);
	readtext = fgets(readfrik);
	sliding_ammount_i = stof(readtext);
	readtext = fgets(readfrik);
	jumpad_noinput_time = stof(readtext);
	readtext = fgets(readfrik);
	lava_speed = stof(readtext);
	readtext = fgets(readfrik);
	lava_damage = stof(readtext);
	readtext = fgets(readfrik);
	lava_damage_time = stof(readtext);
	readtext = fgets(readfrik);
	player_zviewofs = stof(readtext);
	fclose(readfrik);
	*/
}


float lunge_vel;
float lunge_velz;
float lunge_velzog;
.string melee_model;

void check_melee() {
	self.melee_model = "models/weapons/melee/v_gauntlet.md3";	// strzone(readtext);
	self.dvweapon_x = 4;	//stof(readtext);
	self.dvweapon_y = -7;	// stof(readtext);
	self.dvweapon_z = -7;	//stof(readtext);
	self.dvweapon_scale = 1;	//stof(readtext);
	self.vweaponangles_x = 0;	// stof(readtext);
	self.vweaponangles_y = 0;	//stof(readtext);
	self.vweaponangles_z = 0;	//stof(readtext);

	lunge_vel    = 1024;  // lunge velocity multiplier
	lunge_velz   = 160;   // lunge jump height on ground
	lunge_velzog = 96;    // lunge jump height on air

	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("weapons/melee.txt", FILE_READ);
	readtext = fgets(readfrik);
	readtext = fgets(readfrik);
	readtext = fgets(readfrik);
	readtext = fgets(readfrik);
	readtext = fgets(readfrik);
	readtext = fgets(readfrik);
	readtext = fgets(readfrik);
	readtext = fgets(readfrik);
	readtext = fgets(readfrik);
	lunge_vel = stof(readtext);
	readtext = fgets(readfrik);
	lunge_velz = stof(readtext);
	readtext = fgets(readfrik);
	lunge_velzog = stof(readtext);
	fclose(readfrik);
	*/
}


float mace_damage;          // primary fire damage
float mace_additional_damage;          // primary fire damage
float mace_proj_damage;           // projectile impact damage
float mace_proj_splashdamage;          // projectile splash damage
float mace_proj_speed;           // projectile speed
float mace_proj_splashradius;
float mace_proj_homingfactor;            // projectile homing strength /*?????????*/
float mace_proj_acelerationfactor;            // projectile homing strength /*?????????*/


void check_mace() {
	self.macevweapon_x          = 4;     // x (forward)
	self.macevweapon_y          = -7;    // y (side)
	self.macevweapon_z          = -7;    // z (up )
	self.macevweapon_scale      = 1;     // scale
	mace_damage                 = 250;   // primary fire damage
	mace_additional_damage      = 100;   // additional fire damage per ammo
	mace_proj_damage            = 1500;  // projectile impact damage
	mace_proj_splashdamage      = 150;   // projectile splash damage
	mace_proj_splashradius      = 256;   // projectile splash radius
	mace_proj_speed             = 256;   // projectile speed
	mace_proj_homingfactor      = 1;     // projectile homing strength /*?????????*/ 0 to 1
	mace_proj_acelerationfactor = 1.15;  // projectile aceleration factor

	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("weapons/mace.txt", FILE_READ);
	readtext = fgets(readfrik);
	self.macevweapon_x = stof(readtext);
	readtext = fgets(readfrik);
	self.macevweapon_y = stof(readtext);
	readtext = fgets(readfrik);
	self.macevweapon_z = stof(readtext);
	readtext = fgets(readfrik);
	self.macevweapon_scale = stof(readtext);
	readtext = fgets(readfrik);
	mace_damage = stof(readtext);
	readtext = fgets(readfrik);
	mace_additional_damage = stof(readtext);
	readtext = fgets(readfrik);
	mace_proj_damage = stof(readtext);
	readtext = fgets(readfrik);
	mace_proj_splashdamage = stof(readtext);
	readtext = fgets(readfrik);
	mace_proj_splashradius = stof(readtext);
	readtext = fgets(readfrik);
	mace_proj_speed = stof(readtext);
	readtext = fgets(readfrik);
	mace_proj_homingfactor = stof(readtext);
	readtext = fgets(readfrik);
	mace_proj_acelerationfactor = stof(readtext);
	fclose(readfrik);
	*/
}



void check_vmodel() {
	self.vvweapon_model   = "models/weapons/chrystaliser/v_chrystaliser.md3";
	self.vvweapon_x       = 5;    // x (forward)
	self.vvweapon_y       = -3;   // y (side)
	self.vvweapon_z       = -7;   // z (up )
	self.vvweapon_scale   = 1.1;  // scale
	self.vvweaponangles_x = 0;    // x angles (yellow gizmo)
	self.vvweaponangles_y = 0;    // y angles (blue gizmo)
	self.vvweaponangles_z = 0;    // z angles (red gizmo)

	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("weapons/viewmodel.txt", FILE_READ);
	readtext = fgets(readfrik);
	self.vvweapon_model = strzone(readtext);
	readtext = fgets(readfrik);
	self.vvweapon_x = stof(readtext);
	readtext = fgets(readfrik);
	self.vvweapon_y = stof(readtext);
	readtext = fgets(readfrik);
	self.vvweapon_z = stof(readtext);
	readtext = fgets(readfrik);
	self.vvweapon_scale = stof(readtext);
	readtext = fgets(readfrik);
	self.vvweaponangles_x = stof(readtext);
	readtext = fgets(readfrik);
	self.vvweaponangles_y = stof(readtext);
	readtext = fgets(readfrik);
	self.vvweaponangles_z = stof(readtext);
	fclose(readfrik);
	*/
}


void check_shotgun_pos() {
	self.svweapon_x               = 10.5;  // x (forward)
	self.svweapon_y               = -7;    // y (side)
	self.svweapon_z               = -9.5;  // z (up )
	self.sweaponangles_x          = 0;     // x angles (yellow gizmo/up)
	self.sweaponangles_y          = -3;    // y angles (blue gizmo)
	self.sweaponangles_z          = 0;     // z angles (red gizmo)
	self.centered_svweapon_x      = 10;    // x (forward) CENTERED
	self.centered_svweapon_y      = 0;     // y (side) CENTERED
	self.centered_svweapon_z      = -9.5;  // z (up ) CENTERED
	self.centered_sweaponangles_x = -5;    // x angles (yellow gizmo/up) CENTERED
	self.centered_sweaponangles_y = 0;     // y angles (blue gizmo) CENTERED
	self.centered_sweaponangles_z = 0;     // z angles (red gizmo) CENTERED
	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("weapons/shotgun_pos.txt", FILE_READ);
	readtext = fgets(readfrik);
	self.svweapon_x = stof(readtext);
	readtext = fgets(readfrik);
	self.svweapon_y = stof(readtext);
	readtext = fgets(readfrik);
	self.svweapon_z = stof(readtext);
	readtext = fgets(readfrik);
	self.sweaponangles_x = stof(readtext);
	readtext = fgets(readfrik);
	self.sweaponangles_y = stof(readtext);
	readtext = fgets(readfrik);
	self.sweaponangles_z = stof(readtext);
	readtext = fgets(readfrik);
	self.centered_svweapon_x = stof(readtext);
	readtext = fgets(readfrik);
	self.centered_svweapon_y = stof(readtext);
	readtext = fgets(readfrik);
	self.centered_svweapon_z = stof(readtext);
	readtext = fgets(readfrik);
	self.centered_sweaponangles_x = stof(readtext);
	readtext = fgets(readfrik);
	self.centered_sweaponangles_y = stof(readtext);
	readtext = fgets(readfrik);
	self.centered_sweaponangles_z = stof(readtext);
	fclose(readfrik);
	*/
}


void check_shotgun() {
	self.shotgun_damage1      = 25;       // damage fire 1 (20 projectiles) (500 / 1.7 = 295 DPS)
	self.shotgun_damage1_mp   = 10;       // damage fire 1 (200 projectiles) (140 / 1.7 = 118 DPS) MULTIPLAYER
	self.shotgun_time1        = 1.7;      // time fire 1
	self.shotgun_time2        = 1.97;     // time fire 2
	self.shotgun_spread1      = .6;       // shotgun spread fire 1
	self.svweapon_scale       = 1;        // scale
	shotbbox                  = '2 2 2';  // bbox for tracebox (positive values)
	self.buckshot_count       = 20;       // buckshot counts
	self.charge_shotgun_count = 0.8;      // viewzoomvalue
	self.shotgun_proj_speed   = 2048;     // projectyile speed
	self.shotgun_proj_dmg     = 300;      // projectile damage (per projectile)
	self.shotgun_proj_dmg_mp  = 60;       // projectile damage (per projectile) MULTIPLAYER
	proj_shotgun_drunkfactorv = 10;       // drunk factor vertical
	proj_shotgun_drunkfactorh = 100;      // drunk factor horizontal
	proj_shotgun_timing       = 0.1;      // drunk time refresh
	proj_shotgun_bbox         = '2 2 2';    // bbox projectile

	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("weapons/shotgun.txt", FILE_READ);
	readtext = fgets(readfrik);
	self.shotgun_damage1 = stof(readtext);
	readtext = fgets(readfrik);
	self.shotgun_damage1_mp = stof(readtext);
	readtext = fgets(readfrik);
	self.shotgun_time1 = stof(readtext);
	readtext = fgets(readfrik);
	self.shotgun_time2 = stof(readtext);
	readtext = fgets(readfrik);
	self.shotgun_spread1 = stof(readtext);
	readtext = fgets(readfrik);
	self.svweapon_scale = stof(readtext);
	readtext = fgets(readfrik);
	shotbbox = stov(readtext);
	readtext = fgets(readfrik);
	self.buckshot_count = stof(readtext);
	readtext = fgets(readfrik);
	self.charge_shotgun_count = stof(readtext);
	readtext = fgets(readfrik);
	self.shotgun_proj_speed = stof(readtext);
	readtext = fgets(readfrik);
	self.shotgun_proj_dmg = stof(readtext);
	readtext = fgets(readfrik);
	self.shotgun_proj_dmg_mp = stof(readtext);
	readtext = fgets(readfrik);
	proj_shotgun_drunkfactorv = stof(readtext);
	readtext = fgets(readfrik);
	proj_shotgun_drunkfactorh = stof(readtext);
	readtext = fgets(readfrik);
	proj_shotgun_timing = stof(readtext);
	readtext = fgets(readfrik);
	proj_shotgun_bbox = stov(readtext);
	fclose(readfrik);
	*/
}


float coach_proj_vel;
void check_revolver_pos() {
	self.cgvweapon_x               = 13.5;  // x (forward)
	self.cgvweapon_y               = -6;    // y (side)
	self.cgvweapon_z               = -9.5;  // z (up )
	self.cgweaponangles_x          = 0;     // x angles (yellow gizmo/up)
	self.cgweaponangles_y          = -2;    // y angles (blue gizmo)
	self.cgweaponangles_z          = 0;     // z angles (red gizmo)
	self.centered_cgvweapon_x      = 12;    // x (forward)					CENTERED
	self.centered_cgvweapon_y      = 0;     // y (side)					CENTERED
	self.centered_cgvweapon_z      = -10;   // z (up )						CENTERED
	self.centered_cgweaponangles_x = -5;    // x angles (yellow gizmo/up)	CENTERED
	self.centered_cgweaponangles_y = 0;     // y angles (blue gizmo)		CENTERED
	self.centered_cgweaponangles_z = 0;     // z angles (red gizmo)		CENTERED

	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("weapons/revolver_pos.txt", FILE_READ);
	readtext = fgets(readfrik);
	self.cgvweapon_x = stof(readtext);
	readtext = fgets(readfrik);
	self.cgvweapon_y = stof(readtext);
	readtext = fgets(readfrik);
	self.cgvweapon_z = stof(readtext);
	readtext = fgets(readfrik);
	self.cgweaponangles_x = stof(readtext);
	readtext = fgets(readfrik);
	self.cgweaponangles_y = stof(readtext);
	readtext = fgets(readfrik);
	self.cgweaponangles_z = stof(readtext);
	readtext = fgets(readfrik);
	self.centered_cgvweapon_x = stof(readtext);
	readtext = fgets(readfrik);
	self.centered_cgvweapon_y = stof(readtext);
	readtext = fgets(readfrik);
	self.centered_cgvweapon_z = stof(readtext);
	readtext = fgets(readfrik);
	self.centered_cgweaponangles_x = stof(readtext);
	readtext = fgets(readfrik);
	self.centered_cgweaponangles_y = stof(readtext);
	readtext = fgets(readfrik);
	self.centered_cgweaponangles_z = stof(readtext);
	readtext = fgets(readfrik);	fclose(readfrik);
	*/
}


void check_revolver() {
	self.revolver_damage1    = 60;       // damage mutiplier fire1 (1 projectile 200 DPS )
	self.revolver_damage1_mp = 25;       // damage mutiplier fire1 (1 projectile 83 DPS )MULTIPLAYER
	self.revolver_damage2    = 50;       // damage multiplier fire2 (3 projectiles, 300 DPS)
	self.revolver_damage2_mp = 20;       // damage multiplier fire2 (3 projectiles, 120 DPS)MULTIPLAYER
	self.revolver_time1      = 0.3;      // time fire 1
	self.revolver_time2      = 0.5;      // time fire 2
	self.revolver_spread1    = 0.1;      // revolver spread fire 1
	self.revolver_spread2    = .1;       // revolver spread fire 2
	self.cgvweapon_scale     = 0;        // scale
	coachbbox                = '2 2 2';  // bbox for tracebox (positive values)
	coach_proj_vel           = 3072;     // projectile vel

	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("weapons/revolver.txt", FILE_READ);
	readtext = fgets(readfrik);
	self.revolver_damage1 = stof(readtext);
	readtext = fgets(readfrik);
	self.revolver_damage1_mp = stof(readtext);
	readtext = fgets(readfrik);
	self.revolver_damage2 = stof(readtext);
	readtext = fgets(readfrik);
	self.revolver_damage2_mp = stof(readtext);
	readtext = fgets(readfrik);
	self.revolver_time1 = stof(readtext);
	readtext = fgets(readfrik);
	self.revolver_time2 = stof(readtext);
	readtext = fgets(readfrik);
	self.revolver_spread1 = stof(readtext);
	readtext = fgets(readfrik);
	self.revolver_spread2 = stof(readtext);
	readtext = fgets(readfrik);
	self.cgvweapon_scale = stof(readtext);
	readtext = fgets(readfrik);
	coachbbox = stov(readtext);
	readtext = fgets(readfrik);
	coach_proj_vel = stof(readtext);
	fclose(readfrik);
	*/
}


vector bboxretcher;
vector bboxretcher2;

float retcherdamg;
float retcherdamg2;
float retcherdamg_mp;
float retcherdamg2_mp;
float retchersplashdamage;
float retchersplashradius;
float retchersplashdamage_mp;
float retchersplashradius_mp;
float retcheraoeradius;
float retcheraoetime;
float retcheraoedamage;
float retcheraoedamage_mp;
float retcheraoeframetime;
float retcher_proj_velz;
float retcher_proj_vel;
float retcher_proj_grav;

void check_retcher_pos() {
	self.rvweapon_x               = 17;   // x (forward)
	self.rvweapon_y               = -10;  // y (side)
	self.rvweapon_z               = -14;  // z (up )
	self.rweaponangles_x          = 0;    // x angles (yellow gizmo)
	self.rweaponangles_y          = 0;    // y angles (blue gizmo)
	self.rweaponangles_z          = 0;    // z angles (red gizmo)
	self.centered_rvweapon_x      = 17;   // x (forward)
	self.centered_rvweapon_y      = 0;    // y (side)
	self.centered_rvweapon_z      = -15;  // z (up )
	self.centered_rweaponangles_x = 0;    // x angles (yellow gizmo/up)CENTERED
	self.centered_rweaponangles_y = 0;    // y angles (blue gizmo)CENTERED
	self.rweaponangles_z          = 0;    // z angles (red gizmo)CENTERED

	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("weapons/retcher_pos.txt", FILE_READ);
	readtext = fgets(readfrik);
	self.rvweapon_x = stof(readtext);
	readtext = fgets(readfrik);
	self.rvweapon_y = stof(readtext);
	readtext = fgets(readfrik);
	self.rvweapon_z = stof(readtext);
	readtext = fgets(readfrik);
	self.rweaponangles_x = stof(readtext);
	readtext = fgets(readfrik);
	self.rweaponangles_y = stof(readtext);
	readtext = fgets(readfrik);
	self.rweaponangles_z = stof(readtext);
	readtext = fgets(readfrik);
	self.centered_rvweapon_x = stof(readtext);
	readtext = fgets(readfrik);
	self.centered_rvweapon_y = stof(readtext);
	readtext = fgets(readfrik);
	self.centered_rvweapon_z = stof(readtext);
	readtext = fgets(readfrik);
	self.centered_rweaponangles_x = stof(readtext);
	readtext = fgets(readfrik);
	self.centered_rweaponangles_y = stof(readtext);
	readtext = fgets(readfrik);
	self.rweaponangles_z = stof(readtext);	fclose(readfrik);
	*/
}


void check_retcher() {
	retcherdamg            = 350;      // damage modifier fire1 (480 DPS + 300 splash)
	retcherdamg_mp         = 200;      // damage modifier fire1 (240 DPS + 300 splash) MULTIPLAYER
	retcherdamg2           = 200;      // damage modifier 2  (600 DPS + 300 splash)
	retcherdamg2_mp        = 100;      // damage modifier 2 (300 DPS + 300 splash)MULTIPLAYER
	self.voidbombs_time1   = 0.8;      // time fire 1
	self.voidbombs_time2   = 1;        // time fire 2
	self.rvweapon_scale    = 1;        // scale
	bboxretcher            = '5 5 5';  // bboxsizeproj1;
	bboxretcher2           = '5 5 5';  // bboxsizeproj2;
	retchersplashdamage    = 300;      // splash damage
	retchersplashdamage_mp = 300;      // splash damage MULTIPLAYER
	retchersplashradius    = 128;      // splash radius
	retchersplashradius_mp = 128;      // splash radius MULTIPLAYER
	retcheraoeradius       = 128;      // aoe radius
	retcheraoetime         = 3.5;      // aoe time
	retcheraoedamage       = 30;       // aoe damage
	retcheraoedamage_mp    = 20;       // aoe damage  MULTIPLAYER
	retcheraoeframetime    = 0.5;      // aoe timerefresh in seconds
	retcher_proj_velz      = 288;      // projectile z velocity
	retcher_proj_vel       = 1280;     // projectile velocity
	retcher_proj_grav      = 2;        // projectile gravity

	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("weapons/retcher.txt", FILE_READ);
	readtext = fgets(readfrik);
	retcherdamg = stof(readtext);
	readtext = fgets(readfrik);
	retcherdamg_mp = stof(readtext);
	readtext = fgets(readfrik);
	retcherdamg2 = stof(readtext);
	readtext = fgets(readfrik);
	retcherdamg2_mp = stof(readtext);
	readtext = fgets(readfrik);
	self.voidbombs_time1 = stof(readtext);
	readtext = fgets(readfrik);
	self.voidbombs_time2 = stof(readtext);
	readtext = fgets(readfrik);
	self.rvweapon_scale = stof(readtext);
	readtext = fgets(readfrik);
	bboxretcher = stov(readtext);
	readtext = fgets(readfrik);
	bboxretcher2 = stov(readtext);
	readtext = fgets(readfrik);
	retchersplashdamage = stof(readtext);
	readtext = fgets(readfrik);
	retchersplashdamage_mp = stof(readtext);
	readtext = fgets(readfrik);
	retchersplashradius = stof(readtext);
	readtext = fgets(readfrik);
	retchersplashradius_mp = stof(readtext);
	readtext = fgets(readfrik);
	retcheraoeradius = stof(readtext);
	readtext = fgets(readfrik);
	retcheraoetime = stof(readtext);
	readtext = fgets(readfrik);
	retcheraoedamage = stof(readtext);
	readtext = fgets(readfrik);
	retcheraoedamage_mp = stof(readtext);
	readtext = fgets(readfrik);
	retcheraoeframetime = stof(readtext);
	readtext = fgets(readfrik);
	retcher_proj_velz = stof(readtext);
	readtext = fgets(readfrik);
	retcher_proj_vel = stof(readtext);
	readtext = fgets(readfrik);
	retcher_proj_grav = stof(readtext);

	fclose(readfrik);
	*/
}


void check_slagcannon_pos() {
	self.cvweapon_x               = 17;   // x           (forward)
	self.cvweapon_y               = -9;   // y           (side)
	self.cvweapon_z               = -9;   // z           (up )
	self.cweaponangles_x          = 0;    // x angles    (yellow gizmo)
	self.cweaponangles_y          = 0;    // y angles    (blue gizmo)
	self.cweaponangles_z          = 0;    // z angles    (red gizmo)
	self.centered_cvweapon_x      = 15;   // x           (forward)           CENTERED
	self.centered_cvweapon_y      = 0;    // y           (side)              CENTERED
	self.centered_cvweapon_z      = -12;  // z           (up )               CENTERED
	self.centered_cweaponangles_x = 0;    // x angles    (yellow gizmo/up)   CENTERED
	self.centered_cweaponangles_y = 0;    // y angles    (blue gizmo)        CENTERED
	self.centered_cweaponangles_z = 0;    // z angles    (red gizmo)         CENTERED
	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("weapons/slagcannon_pos.txt", FILE_READ);
	readtext = fgets(readfrik);
	self.cvweapon_x = stof(readtext);
	readtext = fgets(readfrik);
	self.cvweapon_y = stof(readtext);
	readtext = fgets(readfrik);
	self.cvweapon_z = stof(readtext);
	readtext = fgets(readfrik);
	self.cweaponangles_x = stof(readtext);
	readtext = fgets(readfrik);
	self.cweaponangles_y = stof(readtext);
	readtext = fgets(readfrik);
	self.cweaponangles_z = stof(readtext);
	readtext = fgets(readfrik);
	self.centered_cvweapon_x = stof(readtext);
	readtext = fgets(readfrik);
	self.centered_cvweapon_y = stof(readtext);
	readtext = fgets(readfrik);
	self.centered_cvweapon_z = stof(readtext);
	readtext = fgets(readfrik);
	self.centered_cweaponangles_x = stof(readtext);
	readtext = fgets(readfrik);
	self.centered_cweaponangles_y = stof(readtext);
	readtext = fgets(readfrik);
	self.centered_cweaponangles_z = stof(readtext);
	readtext = fgets(readfrik);
	fclose(readfrik);
	*/
}


void check_slagcannon() {
	slagcannon_damage1    = 150;      // damage modifier fire1 (1000 DPS + 0 splash)  cost 5/sec
	slagcannon_damage1_mp = 40;       // damage modifier fire1  MULTIPLAYER (200 DPS + 0 splash)  cost 5/sec
	slagcannon_damage2    = 400;      // damage modifier fire2 (1000 DPS + 600 splash) cost 10/sec
	slagcannon_damage2_mp = 50;       // damage modifier fire2  MULTIPLAYER (100 DPS + 100 splash) cost 10/sec MULTIPLAYER
	self.slagcannon_time1 = 0.2;      // time fire 1
	self.slagcannon_time2 = .5;       // time fire 2
	self.cvweapon_scale   = 0;        // scale
	self.slagcannonspread = 0;        // slagcannon spread fire 1
	bboxslag              = '2 2 2';  // bboxsizeproj1;
	bboxslag2             = '6 6 6';  // bboxsizeproj2;
	slagspeed             = 1280;     // speed 1
	slagspeed2            = 1440;     // speed 2
	slagsplashradius      = 128;      // splash radius 1
	slagsplashradius2     = 256;      // splash radius 2
	slagsplashdamage      = 0;        // slagsplashdamage 1
	slagsplashdamage_mp   = 0;        // slagsplashdamage 1 MULTIPLAYER
	slagsplashdamage2     = 300;      // slagsplashdamage 2
	slagsplashdamage2_mp  = 50;       // slagsplashdamage 2 MULTIPLAYER
	slagrocketjump        = 50;       // rockty jump value

	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("weapons/slagcannon.txt", FILE_READ);
	readtext = fgets(readfrik);
	slagcannon_damage1 = stof(readtext);
	readtext = fgets(readfrik);
	slagcannon_damage1_mp = stof(readtext);
	readtext = fgets(readfrik);
	slagcannon_damage2 = stof(readtext);
	readtext = fgets(readfrik);
	slagcannon_damage2_mp = stof(readtext);
	readtext = fgets(readfrik);
	self.slagcannon_time1 = stof(readtext);
	readtext = fgets(readfrik);
	self.slagcannon_time2 = stof(readtext);
	readtext = fgets(readfrik);
	self.cvweapon_scale = stof(readtext);
	readtext = fgets(readfrik);
	self.slagcannonspread = stof(readtext);
	readtext = fgets(readfrik);
	bboxslag = stov(readtext);
	readtext = fgets(readfrik);
	bboxslag2 = stov(readtext);
	readtext = fgets(readfrik);
	slagspeed = stof(readtext);
	readtext = fgets(readfrik);
	slagspeed2 = stof(readtext);
	readtext = fgets(readfrik);
	slagsplashradius = stof(readtext);
	readtext = fgets(readfrik);
	slagsplashradius2 = stof(readtext);
	readtext = fgets(readfrik);
	slagsplashdamage = stof(readtext);
	readtext = fgets(readfrik);
	slagsplashdamage_mp = stof(readtext);
	readtext = fgets(readfrik);
	slagsplashdamage2 = stof(readtext);
	readtext = fgets(readfrik);
	slagsplashdamage2_mp = stof(readtext);
	readtext = fgets(readfrik);
	slagrocketjump = stof(readtext);
	fclose(readfrik);
	*/
}


vector bboxspitter;
vector bboxspitter2;
float spitterdamg;
float spitterdamg2;
float spitterdamg_mp;
float spitterdamg2_mp;
float spittervel;
float spittervel2;
float spitter_svpf;
float spitter_svsf;
void check_spitter_pos() {
	self.pvweapon_x               = 12;  //  x (forward)
	self.pvweapon_y               = -5;  //  y (side)
	self.pvweapon_z               = -7;  //  z (up )
	self.pweaponangles_x          = 0;   //  x angles (yellow gizmo)
	self.pweaponangles_y          = 0;   //  y angles (blue gizmo)
	self.pweaponangles_z          = 0;   //  z angles (red gizmo)
	self.centered_pvweapon_x      = 12;  //  x (forward)CENTERED
	self.centered_pvweapon_y      = 0;   //  y (side)CENTERED
	self.centered_pvweapon_z      = -7;  //  z (up )CENTERED
	self.centered_pweaponangles_x = 0;   //  x angles (yellow gizmo/up)CENTERED
	self.centered_pweaponangles_y = 0;   //  y angles (blue gizmo)CENTERED
	self.centered_pweaponangles_z = 0;   //  z angles (red gizmo)CENTERED
	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("weapons/spitter_pos.txt", FILE_READ);
	readtext = fgets(readfrik);
	self.pvweapon_x = stof(readtext);
	readtext = fgets(readfrik);
	self.pvweapon_y = stof(readtext);
	readtext = fgets(readfrik);
	self.pvweapon_z = stof(readtext);
	readtext = fgets(readfrik);
	self.pweaponangles_x = stof(readtext);
	readtext = fgets(readfrik);
	self.pweaponangles_y = stof(readtext);
	readtext = fgets(readfrik);
	self.pweaponangles_z = stof(readtext);
	readtext = fgets(readfrik);
	self.centered_pvweapon_x = stof(readtext);
	readtext = fgets(readfrik);
	self.centered_pvweapon_y = stof(readtext);
	readtext = fgets(readfrik);
	self.centered_pvweapon_z = stof(readtext);
	readtext = fgets(readfrik);
	self.centered_pweaponangles_x = stof(readtext);
	readtext = fgets(readfrik);
	self.centered_pweaponangles_y = stof(readtext);
	readtext = fgets(readfrik);
	self.centered_pweaponangles_z = stof(readtext);
	fclose(readfrik);
	*/
}


void check_spitter() {
	spitterdamg             = 50;              //  spitter damage  (500 DPS, 10 ammo/sec)
	spitterdamg_mp          = 20;              //  spitter damage  MULTIPLAYER (200 DPS, 10 ammo/sec)
	spitterdamg2            = 120;             //  spitter damage  (480 DPS, 8 ammo/sec, stunlock)
	spitterdamg2_mp         = 35;              //  spitter damage  MULTIPLAYER (140 DPS, 8 ammo/sec,)
	self.flamethrower_time1 = 0.1;             //  time fire 1
	self.flamethrower_time2 = 0.25;            //  time fire 2
	self.pvweapon_scale     = 1;               //  scale
	bboxspitter             = '.25 .25 .25';   //  bboxsizeproj1;
	bboxspitter2            = '2 2 2';         //  bboxsizeproj2;
	spittervel              = 3072;            //  spitter vel projectile
	spittervel2             = 2048;            //  spitter vel projectile2
	spitter_svpf            = 5;               //  number of primary fire sound variations
	spitter_svsf            = 3;               //  number of secondary fire sound variations
	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("weapons/spitter.txt", FILE_READ);
	readtext = fgets(readfrik);
	spitterdamg = stof(readtext);
	readtext = fgets(readfrik);
	spitterdamg_mp = stof(readtext);
	readtext = fgets(readfrik);
	spitterdamg2 = stof(readtext);
	readtext = fgets(readfrik);
	spitterdamg2_mp = stof(readtext);
	readtext = fgets(readfrik);
	self.flamethrower_time1 = stof(readtext);
	readtext = fgets(readfrik);
	self.flamethrower_time2 = stof(readtext);
	readtext = fgets(readfrik);
	self.pvweapon_scale = stof(readtext);
	readtext = fgets(readfrik);
	bboxspitter = stov(readtext);
	readtext = fgets(readfrik);
	bboxspitter2 = stov(readtext);
	readtext = fgets(readfrik);
	spittervel = stof(readtext);
	readtext = fgets(readfrik);
	spittervel2 = stof(readtext);
	readtext = fgets(readfrik);
	spitter_svpf = stof(readtext);
	readtext = fgets(readfrik);
	spitter_svsf = stof(readtext);
	fclose(readfrik);
	*/
}


.float lance_muzzle_scale;
void check_lance() {
	self.lance_damage        = 1000;  // fire 1 damage   (500 DPS single target, unlimited target penetration)
	self.lance_damage_mp     = 90;    // fire 1 damage   MULTIPLAYER (45 DPS, 90 instant)
	self.lance_damage2       = 50;    // fire 2 damage   (1000 DPS)
	self.lance_damage2_mp    = 6;     // fire 2 damage   MULTIPLAYER (120 DPS)
	self.lvweapon_scale      = 1;     // scale
	self.lance_muzzle_scale  = 4;     // scale field model of secondary fire
	self.lance_time          = 2;     // primary fire wait
	self.lance_time2         = 0.05;  // secondary fire update
	self.lance_alpha_time    = 0.5;   // primary fire alpha time
	self.lance_viewzoom      = 0.5;   // maxviewzoom range
	self.lance_viewzoom_rate = 2;     // maxviewzoom time
	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("weapons/lance.txt", FILE_READ);
	readtext = fgets(readfrik);
	self.lance_damage = stof(readtext);
	readtext = fgets(readfrik);
	self.lance_damage_mp = stof(readtext);
	readtext = fgets(readfrik);
	self.lance_damage2 = stof(readtext);
	readtext = fgets(readfrik);
	self.lance_damage2_mp = stof(readtext);
	readtext = fgets(readfrik);
	self.lvweapon_scale = stof(readtext);
	readtext = fgets(readfrik);
	self.lance_muzzle_scale = stof(readtext);
	readtext = fgets(readfrik);
	self.lance_time = stof(readtext);
	readtext = fgets(readfrik);
	self.lance_time2 = stof(readtext);
	readtext = fgets(readfrik);
	self.lance_alpha_time = stof(readtext);
	readtext = fgets(readfrik);
	self.lance_viewzoom = stof(readtext);
	readtext = fgets(readfrik);
	self.lance_viewzoom_rate = stof(readtext);
	fclose(readfrik);
	*/
}


void check_lance_pos() {
	self.lvweapon_x               = 12;                  //  x (forward)
	self.lvweapon_y               = -6;                  //  y (side)
	self.lvweapon_z               = -6;                  //  z (up )
	self.lweaponangles_x          = 0;                   //  x angles (yellow gizmo)
	self.lweaponangles_y          = 0;                   //  y angles (blue gizmo)
	self.lweaponangles_z          = 0;                   //  z angles (red gizmo)
	self.centered_lvweapon_x      = 12;                  //  x (forward)CENTERED
	self.centered_lvweapon_y      = 0;                   //  y (side)CENTERED
	self.centered_lvweapon_z      = -8;                  //  z (up )CENTERED
	self.centered_lweaponangles_x = -6;                  //  x angles (yellow gizmo/up)CENTERED
	self.centered_lweaponangles_y = 0;                   //  y angles (blue gizmo)CENTERED
	self.centered_lweaponangles_z = 0;                   //  z angles (red gizmo)CENTERED
	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("weapons/lance_pos.txt", FILE_READ);
	readtext = fgets(readfrik);
	self.lvweapon_x = stof(readtext);
	readtext = fgets(readfrik);
	self.lvweapon_y = stof(readtext);
	readtext = fgets(readfrik);
	self.lvweapon_z = stof(readtext);
	readtext = fgets(readfrik);
	self.lweaponangles_x = stof(readtext);
	readtext = fgets(readfrik);
	self.lweaponangles_y = stof(readtext);
	readtext = fgets(readfrik);
	self.lweaponangles_z = stof(readtext);
	readtext = fgets(readfrik);
	self.centered_lvweapon_x = stof(readtext);
	readtext = fgets(readfrik);
	self.centered_lvweapon_y = stof(readtext);
	readtext = fgets(readfrik);
	self.centered_lvweapon_z = stof(readtext);
	readtext = fgets(readfrik);
	self.centered_lweaponangles_x = stof(readtext);
	readtext = fgets(readfrik);
	self.centered_lweaponangles_y = stof(readtext);
	readtext = fgets(readfrik);
	self.centered_lweaponangles_z = stof(readtext);
	fclose(readfrik);
	*/
}


.vector chvweapon;
.vector chvweaponangles;
.vector centered_chvweapon;
.vector centered_chvweaponangles;

void check_crystal_pos() {
	self.chvweapon_x                = 12;          //  x (forward)
	self.chvweapon_y                = -6;          //  y (side)
	self.chvweapon_z                = -6;          //  z (up )
	self.chvweaponangles_x          = 0;           //  x angles
	self.chvweaponangles_y          = 0;           //  y angles
	self.chvweaponangles_z          = 0;           //  z angles
	self.centered_chvweapon_x       = 4;           //  x (forward) CENTERED
	self.centered_chvweapon_y       = -0;          //  y (side) CENTERED
	self.centered_chvweapon_z       = -7;          //  z (up ) CENTERED
	self.centered_chvweaponangles_x = 0;           //  x angles  CENTERED
	self.centered_chvweaponangles_y = 0;           //  y angles CENTERED
	self.centered_chvweaponangles_z = 0;           //  z angles CENTERED
	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("weapons/crystal_pos.txt", FILE_READ);
	readtext = fgets(readfrik);
	self.chvweapon_x = stof(readtext);
	readtext = fgets(readfrik);
	self.chvweapon_y = stof(readtext);
	readtext = fgets(readfrik);
	self.chvweapon_z = stof(readtext);
	readtext = fgets(readfrik);
	self.chvweaponangles_x = stof(readtext);
	readtext = fgets(readfrik);
	self.chvweaponangles_y = stof(readtext);
	readtext = fgets(readfrik);
	self.chvweaponangles_z = stof(readtext);
	readtext = fgets(readfrik);
	self.centered_chvweapon_x = stof(readtext);
	readtext = fgets(readfrik);
	self.centered_chvweapon_y = stof(readtext);
	readtext = fgets(readfrik);
	self.centered_chvweapon_z = stof(readtext);
	readtext = fgets(readfrik);
	self.centered_chvweaponangles_x = stof(readtext);
	readtext = fgets(readfrik);
	self.centered_chvweaponangles_y = stof(readtext);
	readtext = fgets(readfrik);
	self.centered_chvweaponangles_z = stof(readtext);
	fclose(readfrik);
	*/
}


float crystal1_damage;
float crystal1_damage_mp;
float crystal1secondary_damage;
float crystal1secondary_damage_mp;
float crystal2_damage;
float crystal2_damage_mp;

void check_crystal() {
	crystal1_damage             = 80;
	crystal1_damage_mp          = 30;
	crystal1secondary_damage    = 40;
	crystal1secondary_damage_mp = 20;
	crystal2_damage             = 60;
	crystal2_damage_mp          = 30;
	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("weapons/crystal.txt", FILE_READ);
	readtext = fgets(readfrik);
	crystal1_damage = stof(readtext);
	readtext = fgets(readfrik);
	crystal1_damage_mp = stof(readtext);
	readtext = fgets(readfrik);
	crystal1secondary_damage = stof(readtext);
	readtext = fgets(readfrik);
	crystal1secondary_damage_mp = stof(readtext);
	readtext = fgets(readfrik);
	crystal2_damage = stof(readtext);
	readtext = fgets(readfrik);
	crystal2_damage_mp = stof(readtext);
	fclose(readfrik);
	*/
}


void Check_FrikFile() {
	check_melee();
	check_revolver();
	check_revolver_pos();
	check_shotgun();
	check_shotgun_pos();
	check_retcher();
	check_retcher_pos();
	check_slagcannon();
	check_slagcannon_pos();
	check_spitter();
	check_spitter_pos();
	check_vmodel();
	check_lance();
	check_lance_pos();
	check_mace();
	check_player();
	check_crystal();
	check_crystal_pos();
}


/////////////////////////////////////////////
////////////ITEMS FRIK_FILE/////////////
/////////////////////////////////////////////


float attar_vel;          // projectile vel
float attar_velz;         // projectile angle
float attar_grav;         // projectile gravity
vector attar_pbbox;       // projectile bbox size
vector attar_pbboxn;      // projectile bbox size negative
vector attar_bbox;        // AOE bbox size
vector attar_bboxn;       // AOE bbox size negative
float attar_time;         // AOE duration
float attar_effect_time;  // affected enemy duration
void check_attar() {
	attar_vel         = 600;             //  projectile vel
	attar_velz        = 300;             //  projectile vel z
	attar_grav        = 1;               //  projectile gravity
	attar_pbbox       = '8 8 8';         //  projectile bbox size
	attar_pbboxn      = '-8 -8 -8';      //  projectile bbox size negative
	attar_bbox        = '64 64 64';      //  AOE bbox size
	attar_bboxn       = '-64 -64 -64';   //  AOE bbox size negative
	attar_time        = 20;              //  AOE duration
	attar_effect_time = 30;              //  affected enemy duration
	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("artifacts/attar.txt", FILE_READ);
	readtext = fgets(readfrik);
	attar_vel = stof(readtext);
	readtext = fgets(readfrik);
	attar_velz = stof(readtext);
	readtext = fgets(readfrik);
	attar_grav = stof(readtext);
	readtext = fgets(readfrik);
	attar_pbbox = stov(readtext);
	readtext = fgets(readfrik);
	attar_pbboxn = stov(readtext);
	readtext = fgets(readfrik);
	attar_bbox = stov(readtext);
	readtext = fgets(readfrik);
	attar_bboxn = stov(readtext);
	readtext = fgets(readfrik);
	attar_time = stof(readtext);
	readtext = fgets(readfrik);
	attar_effect_time = stof(readtext);
	fclose(readfrik);
	*/
}


float shockwave_radius;		//total radius
float shockwave_dmg;		//initial damage
float shockwave_critical_radius;		//critical zone radius
float shockwave_time;		//explosion duration (in seconds)

void check_shockwave() {
	shockwave_radius          = 512;   //total radius
	shockwave_dmg             = 3000;  //initial damage
	shockwave_critical_radius = 92;    //critical zone radius
	shockwave_time            = 1;     //explosion duration (in seconds)
	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("artifacts/shockwave.txt", FILE_READ);
	readtext = fgets(readfrik);
	shockwave_radius = stof(readtext);
	readtext = fgets(readfrik);
	shockwave_dmg = stof(readtext);
	readtext = fgets(readfrik);
	shockwave_critical_radius = stof(readtext);
	readtext = fgets(readfrik);
	shockwave_time = stof(readtext);
	fclose(readfrik);
	*/
}


float shotgun_ammount;
float revolver_ammount;
float spitter_ammount;
float retcher_ammount;
float cannon_ammount;
float lance_ammount;
float crystal_ammount;
float mace_ammount;

void check_itemammount() {
	revolver_ammount = 15;  // revolver ammo
	shotgun_ammount  = 20;  // shotgun ammo
	spitter_ammount  = 15;  // spitter ammo
	retcher_ammount  = 3;  // retcher ammo
	cannon_ammount   = 5;  // cannon ammo
	lance_ammount    = 5;  // lance ammo
	crystal_ammount  = 50;  // crystal ammo
	mace_ammount     = 10;  // mace ammo

	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("items/ammount.txt", FILE_READ);
	readtext = fgets(readfrik);
	revolver_ammount = stof(readtext);
	readtext = fgets(readfrik);
	shotgun_ammount = stof(readtext);
	readtext = fgets(readfrik);
	spitter_ammount = stof(readtext);
	readtext = fgets(readfrik);
	retcher_ammount = stof(readtext);
	readtext = fgets(readfrik);
	cannon_ammount = stof(readtext);
	readtext = fgets(readfrik);
	lance_ammount = stof(readtext);
	readtext = fgets(readfrik);
	crystal_ammount = stof(readtext);
	readtext = fgets(readfrik);
	mace_ammount = stof(readtext);
	readtext = fgets(readfrik);
	fclose(readfrik);
	*/
}


float max_ammo_revolver;
float max_ammo_shotgun;
float max_ammo_spitter;
float max_ammo_retcher;
float max_ammo_cannon;
float max_ammo_lance;
float max_ammo_crystal;


void check_maxammo() {
	max_ammo_revolver = 100;  // revolver max ammo
	max_ammo_shotgun  = 100;  // shotgun max ammo
	max_ammo_spitter  = 150;  // fangspitter max ammo
	max_ammo_retcher  = 100;  // retcher max ammo
	max_ammo_cannon   = 100;  // cannon max ammo
	max_ammo_lance    = 50;   // lance max ammo
	max_ammo_crystal  = 200;  // crystaliser max ammo

	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("items/maxammo.txt", FILE_READ);
	readtext = fgets(readfrik);
	max_ammo_revolver = stof(readtext);
	readtext = fgets(readfrik);
	max_ammo_shotgun = stof(readtext);
	readtext = fgets(readfrik);
	max_ammo_spitter = stof(readtext);
	readtext = fgets(readfrik);
	max_ammo_retcher = stof(readtext);
	readtext = fgets(readfrik);
	max_ammo_cannon = stof(readtext);
	readtext = fgets(readfrik);
	max_ammo_lance = stof(readtext);
	readtext = fgets(readfrik);
	max_ammo_crystal = stof(readtext);
	fclose(readfrik);
	*/
}


float artifact_lightlev;
vector artifact_light_col;
float dark_helm_lightlev;
vector dark_helm_light_col;
float dark_armor_lightlev;
vector dark_armor_light_col;
float dark_shard_lightlev;
vector dark_shard_light_col;
float helm_lightlev;
vector helm_light_col;
float armor_lightlev;
vector armor_light_col;
float shard_lightlev;
vector shard_light_col;
float cofferkey_lightlev;
vector cofferkey_light_col;

void check_itemlight() {
	artifact_lightlev    = 32;         // artifact_lightlev
	artifact_light_col   = '1 1 1';    // artifact_light_col
	dark_helm_lightlev   = 24;         // dark_helm_lightlev
	dark_helm_light_col  = '.7 .7 1';  // dark_helm_light_col
	dark_armor_lightlev  = 32;         // dark_armor_lightlev
	dark_armor_light_col = '.7 .7 1';  // dark_armor_light_col
	dark_shard_lightlev  = 20;         // dark_shard_lightlev
	dark_shard_light_col = '.7 .7 1';  // dark_shard_light_col
	helm_lightlev        = 24;         // helm_lightlev
	helm_light_col       = '.9 .9 1';  // helm_light_col
	armor_lightlev       = 32;         // armor_lightlev
	armor_light_col      = '.9 .9 1';  // armor_light_col
	shard_lightlev       = 20;         // shard_lightlev
	shard_light_col      = '.9 .9 1';  // shard_light_col
	cofferkey_lightlev   = 16;         // cofferkey_lightlev
	cofferkey_light_col  = '1 1 1';    // cofferkey_light_col
	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("items/light.txt", FILE_READ);
	readtext = fgets(readfrik);
	artifact_lightlev = stof(readtext);
	readtext = fgets(readfrik);
	artifact_light_col = stov(readtext);
	readtext = fgets(readfrik);
	dark_helm_lightlev = stof(readtext);
	readtext = fgets(readfrik);
	dark_helm_light_col = stov(readtext);
	readtext = fgets(readfrik);
	dark_armor_lightlev = stof(readtext);
	readtext = fgets(readfrik);
	dark_armor_light_col = stov(readtext);
	readtext = fgets(readfrik);
	dark_shard_lightlev = stof(readtext);
	readtext = fgets(readfrik);
	dark_shard_light_col = stov(readtext);
	readtext = fgets(readfrik);
	helm_lightlev = stof(readtext);
	readtext = fgets(readfrik);
	helm_light_col = stov(readtext);
	readtext = fgets(readfrik);
	armor_lightlev = stof(readtext);
	readtext = fgets(readfrik);
	armor_light_col = stov(readtext);
	readtext = fgets(readfrik);
	shard_lightlev = stof(readtext);
	readtext = fgets(readfrik);
	shard_light_col = stov(readtext);
	readtext = fgets(readfrik);
	cofferkey_lightlev = stof(readtext);
	readtext = fgets(readfrik);
	cofferkey_light_col = stov(readtext);
	fclose(readfrik);
	*/
}


float coffer_item_bounce;
float coffer_item_gravity;
float coffer_item_vel;
float coffer_item_delay;

void check_coffer() {
	coffer_item_gravity = 1;    // item gravity
	coffer_item_bounce  = 0.1;  // item bouncefactor
	coffer_item_vel     = 100;  // item vel
	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("items/coffer.txt", FILE_READ);
	readtext = fgets(readfrik);
	coffer_item_gravity = stof(readtext);
	readtext = fgets(readfrik);
	coffer_item_bounce = stof(readtext);
	readtext = fgets(readfrik);
	coffer_item_vel= stof(readtext);
	readtext = fgets(readfrik);
	coffer_item_delay= stof(readtext);
	fclose(readfrik);
	*/
}
void check_itemsize() {
	artifact_nsize      = '-12 -12 -44';  // artifact_nsize;
	artifact_size       = '12 12 0';      // artifact_size;
	dark_helm_nsize     = '-16 -16 -8';   // dark_helm_nsize;
	dark_helm_size      = '16 16 8';      // dark_helm_size;
	dark_armor_nsize    = '-16 -16 -8';   // dark_armor_nsize;
	dark_armor_size     = '16 16 20';     // dark_armor_size;
	dark_shard_nsize    = '-16 -16 -8';   // dark_shard_nsize;
	dark_shard_size     = '16 16 2';      // dark_shard_size;
	helm_nsize          = '-16 -16 -8';   // helm_nsize;
	helm_size           = '16 16 8';      // helm_size;
	armor_nsize         = '-16 -16 -8';   // armor_nsize;
	armor_size          = '16 16 20';     // armor_size;
	shard_nsize         = '-16 -16 -8';   // shard_nsize;
	shard_size          = '16 16 2';      // shard_size;
	heart_size          = '12 12 2';      // heart_size;
	chalice_size        = '16 16 24';     // chalice_size;
	vial_size           = '16 16 16';     // vial_size;
	beaker_size         = '16 16 20';     // beaker_size;
	resin_size          = '16 16 9';      // fangs_size;
	resinl_size         = '12 12 12';     // wtf_size;
	ore_size            = '16 16 11';     // ore_size;
	orel_size           = '16 16 9';      // orel_size;
	explosives_size     = '16 16 8';      // cysts_size;
	explosivesl_size    = '16 16 8';      // cysts_size;
	shells_size         = '16 16 6';      // shells_size;
	shellsl_size        = '16 16 6';      // slugs_size;
	slag_nsize          = '-12 -12 -24';  // slag_nsize;
	slag_size           = '12 12 8';      // slag_size;
	spitter_nsize       = '-12 -12 -24';  // spitter_nsize;
	spitter_size        = '12 12 8';      // spitter_size;
	retcher_nsize       = '-12 -12 -24';  // retcher_nsize;
	retcher_size        = '12 12 8';      // retcher_size;
	coach_nsize         = '-12 -12 -24';  // coach_nsize;
	coach_size          = '12 12 8';      // coach_size;
	coffer_key_nsize    = '-12 -12 -48';  // coffer_key_nsize;
	coffer_key_size     = '12 12 0';      // coffer_key_size;
	retcher_proj_size   = '4 4 4';        // retcher_projectile_size;
	shells_size_invader = '12 12 8';      // invader_pickup_size;

	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("items/size.txt", FILE_READ);
	readtext = fgets(readfrik);
	artifact_nsize = stov(readtext);
	readtext = fgets(readfrik);
	artifact_size = stov(readtext);
	readtext = fgets(readfrik);
	dark_helm_nsize = stov(readtext);
	readtext = fgets(readfrik);
	dark_helm_size = stov(readtext);
	readtext = fgets(readfrik);
	dark_armor_nsize = stov(readtext);
	readtext = fgets(readfrik);
	dark_armor_size = stov(readtext);
	readtext = fgets(readfrik);
	dark_shard_nsize = stov(readtext);
	readtext = fgets(readfrik);
	dark_shard_size = stov(readtext);
	readtext = fgets(readfrik);
	helm_nsize = stov(readtext);
	readtext = fgets(readfrik);
	helm_size = stov(readtext);
	readtext = fgets(readfrik);
	armor_nsize = stov(readtext);
	readtext = fgets(readfrik);
	armor_size = stov(readtext);
	readtext = fgets(readfrik);
	shard_nsize = stov(readtext);
	readtext = fgets(readfrik);
	shard_size = stov(readtext);
	readtext = fgets(readfrik);
	heart_size = stov(readtext);
	readtext = fgets(readfrik);
	chalice_size = stov(readtext);
	readtext = fgets(readfrik);
	vial_size = stov(readtext);
	readtext = fgets(readfrik);
	beaker_size = stov(readtext);
	readtext = fgets(readfrik);
	resin_size = stov(readtext);
	readtext = fgets(readfrik);
	resinl_size = stov(readtext);
	readtext = fgets(readfrik);
	ore_size = stov(readtext);
	readtext = fgets(readfrik);
	orel_size = stov(readtext);
	readtext = fgets(readfrik);
	explosives_size = stov(readtext);
	readtext = fgets(readfrik);
	explosivesl_size = stov(readtext);
	readtext = fgets(readfrik);
	shells_size = stov(readtext);
	readtext = fgets(readfrik);
	shellsl_size = stov(readtext);
	readtext = fgets(readfrik);
	slag_nsize = stov(readtext);
	readtext = fgets(readfrik);
	slag_size = stov(readtext);
	readtext = fgets(readfrik);
	spitter_nsize = stov(readtext);
	readtext = fgets(readfrik);
	spitter_size = stov(readtext);
	readtext = fgets(readfrik);
	retcher_nsize = stov(readtext);
	readtext = fgets(readfrik);
	retcher_size = stov(readtext);
	readtext = fgets(readfrik);
	coach_nsize = stov(readtext);
	readtext = fgets(readfrik);
	coach_size = stov(readtext);
	readtext = fgets(readfrik);
	coffer_key_nsize = stov(readtext);
	readtext = fgets(readfrik);
	coffer_key_size = stov(readtext);
	readtext = fgets(readfrik);
	retcher_proj_size = stov(readtext);
	readtext = fgets(readfrik);
	shells_size_invader = stov(readtext);
	fclose(readfrik);
	*/
}


vector flash_color;
float flash_alpha;
float flash_fade;

void check_itemflash() {
	flash_color = '1 1 1';  // RGB
	flash_alpha = .1;       // alpha
	flash_fade  = .5;       // alphafade
	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("items/flash.txt", FILE_READ);
	readtext = fgets(readfrik);
	flash_color = stov (readtext);
	readtext = fgets(readfrik);
	flash_alpha = stof (readtext);
	readtext = fgets(readfrik);
	flash_fade = stof (readtext);
	fclose(readfrik);
	*/
}


vector sigil_flash_color;
float sigil_flash_alpha;
float sigil_flash_fade;

void check_itemsigil_flash() {
	sigil_flash_color = '1 1 1';  // RGB
	sigil_flash_alpha = .1;       // alpha
	sigil_flash_fade  = .5;       // alphafade
	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("sigil/fly_flash.txt", FILE_READ);
	readtext = fgets(readfrik);
	sigil_flash_color = stov (readtext);
	readtext = fgets(readfrik);
	sigil_flash_alpha = stof (readtext);
	readtext = fgets(readfrik);
	sigil_flash_fade = stof (readtext);
	fclose(readfrik);
	*/
}

/////////////////////////////////////////////
////////////ENEMIES FRIK_FILE/////////
/////////////////////////////////////////////

float affpl;
float affpm;
float affph;

float opp_health;
vector opp_bbox;
vector opp_bboxn;
float opp_wvel;
float opp_dmg;
float opp_projvelfactor;
float opp_projvel;
float opp_projvel2;
float opp_dr_run;
float opp_dr_attack;
float opp_dtp;
float opp_dtg;
float opp_rtp;
float opp_near;
float opp_mid;
float opp_far;
float opp_zzc;
float opp_zzd;
float opp_zzmd;
//float opp_dr_idle;
vector opp_proj_size;

void check_op_vel() {
	opp_health        = 1800;           //  health
	opp_bbox          = '20 20 56';     //  bbox
	opp_bboxn         = '-20 -20 -32';  //  nbbox
	opp_wvel          = 8;              //  velocity
	opp_dmg           = 50;             //  damage
	opp_projvelfactor = 0.3;            //  prediction factor
	opp_projvel       = 1200;           //  proj velocity
	opp_projvel2      = 900;            //  proj velocity (double attack)
	opp_dr_run        = 50;             //  dice roll to run or attack (when runing)
	opp_dr_attack     = 75;             //  dice roll to attack or run (when attack is finished)
	opp_dtp           = 900;            //  damage to pain
	opp_dtg           = -150;           //  damage to gib
	opp_rtp           = 100;            //  dice roll to pain
	opp_near          = 128;            //  near
	opp_mid           = 512;            //  mid
	opp_far           = 2048;           //  far
	opp_zzc           = 50;             //  zigzag chance
	opp_zzd           = 45;             //  zigzag max deviance
	opp_zzmd          = 10;             //  zigzag min deviance
	opp_proj_size     = '6 6 5';          //  projectile bbox

	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("enemies/oppressor.txt", FILE_READ);
	readtext = fgets(readfrik);
	opp_health = stof(readtext);
	readtext = fgets(readfrik);
	opp_bbox = stov(readtext);
	readtext = fgets(readfrik);
	opp_bboxn = stov(readtext);
	readtext = fgets(readfrik);
	opp_wvel = stof(readtext);
	readtext = fgets(readfrik);
	opp_dmg = stof(readtext);
	readtext = fgets(readfrik);
	opp_projvelfactor = stof(readtext);
	readtext = fgets(readfrik);
	opp_projvel = stof(readtext);
	readtext = fgets(readfrik);
	opp_projvel2 = stof(readtext);
	readtext = fgets(readfrik);
	opp_dr_run = stof(readtext);
	readtext = fgets(readfrik);
	opp_dr_attack = stof(readtext);
	readtext = fgets(readfrik);
	opp_dtp = stof(readtext); // damage needed to pain
	readtext = fgets(readfrik);
	opp_dtg = stof(readtext); // damage needed to gib
	readtext = fgets(readfrik);
	opp_rtp = stof(readtext); // dice roll to pain
	readtext = fgets(readfrik);
	opp_near = stof(readtext);
	readtext = fgets(readfrik);
	opp_mid = stof(readtext);
	readtext = fgets(readfrik);
	opp_far = stof(readtext);
	readtext = fgets(readfrik);
	opp_zzc = stof(readtext);
	readtext = fgets(readfrik);
	opp_zzd = stof(readtext);
	readtext = fgets(readfrik);
	opp_zzmd = stof(readtext);
	readtext = fgets(readfrik);
	opp_proj_size = stov(readtext);
	fclose(readfrik);
	*/
}


float affwvel1;
float affwvel2;
float affwvel3;
float affwvel4;
float affwvel5;
float affwvel6;
float affwvel7;
float affwvel8;
float affwvel9;
float affwvel10;
float affwvel11;
float affwvel12;
float affwvel13;
float affwvel14;
vector afflictedbbox;
vector afflictednbbox;
float afflictedhealth;
float afflicteddamage;
float afflicteddamage2;
vector afflictedpbbox;
float afflictedpvel;
float aff_dr_idle;
float aff_dr_walk;
float aff_dr_attack;
float aff_dr_run;
float damageexplosionafflicted;
float radiusexplosionafflicted;
float damagedexplosionafflicted;
float radiusdexplosionafflicted;
float afflicted_damagetomonsters;
float afflicted_pushfactor;
float afflicted_suicide_distance;

void check_af_vel() {
	affwvel1                   = 6;              // wve1
	affwvel2                   = 5.5;            // wve2
	affwvel3                   = 5;              // wve3
	affwvel4                   = 4;              // wve4
	affwvel5                   = 5;              // wve5
	affwvel6                   = 6.5;            // wve6
	affwvel7                   = 6;              // wve7
	affwvel8                   = 6;              // wve8
	affwvel9                   = 5.5;            // wve9
	affwvel10                  = 5.5;            // wve10
	affwvel11                  = 4;              // wve11
	affwvel12                  = 3.5;            // wve12
	affwvel13                  = 5;              // wve13
	affwvel14                  = 5.5;            // wve14
	afflictedhealth            = 150;            // health
	afflicteddamage            = 15;             // damage projectile
	afflicteddamage2           = 100;            // damage explosion
	afflictednbbox             = '-10 -10 -32';  // bbox negative
	afflictedbbox              = '10 10 32';     // bbox
	afflictedpbbox             = '4 4 4';        // projectile bbox
	afflictedpvel              = 768;            // proj_vel
	aff_dr_idle                = 0;              // dice roll idle, 70% attack instead walk
	aff_dr_walk                = 0.8;            // dice roll walk, 80% attack instead walk
	aff_dr_attack              = 0.8;            // dice roll attack, 80% run instead attack (fire)
	aff_dr_run                 = 0.5;            // dice roll aa, 80% attack instead run
	damageexplosionafflicted   = 0;              //
	radiusexplosionafflicted   = 0;              //
	affpl                      = 25;             // pain damage low
	affpm                      = 50;             // pain damage medium
	affph                      = 75;             // pain damage high
	damagedexplosionafflicted  = 200;            // death explosion monster damage
	radiusdexplosionafflicted  = 64;             // death explosion radius
	afflicted_damagetomonsters = 50;             // attack damage to monsters (PROJECTILE)
	afflicted_pushfactor       = 3;              //  explo push factor
	afflicted_suicide_distance = 512;            //  distance to suicide

	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("enemies/afflicted_vel.txt", FILE_READ);
	readtext = fgets(readfrik);
	affwvel1 = stof(readtext);
	readtext = fgets(readfrik);
	affwvel2 = stof(readtext);
	readtext = fgets(readfrik);
	affwvel3 = stof(readtext);
	readtext = fgets(readfrik);
	affwvel4 = stof(readtext);
	readtext = fgets(readfrik);
	affwvel5 = stof(readtext);
	readtext = fgets(readfrik);
	affwvel6 = stof(readtext);
	readtext = fgets(readfrik);
	affwvel7 = stof(readtext);
	readtext = fgets(readfrik);
	affwvel8 = stof(readtext);
	readtext = fgets(readfrik);
	affwvel9 = stof(readtext);
	readtext = fgets(readfrik);
	affwvel10 = stof(readtext);
	readtext = fgets(readfrik);
	affwvel11 = stof(readtext);
	readtext = fgets(readfrik);
	affwvel12 = stof(readtext);
	readtext = fgets(readfrik);
	affwvel13 = stof(readtext);
	readtext = fgets(readfrik);
	affwvel14 = stof(readtext);
	readtext = fgets(readfrik);
	afflictedhealth = stof(readtext);
	readtext = fgets(readfrik);
	afflicteddamage = stof(readtext);
	readtext = fgets(readfrik);
	afflicteddamage2 = stof(readtext);
	readtext = fgets(readfrik);
	afflictednbbox = stov(readtext);
	readtext = fgets(readfrik);
	afflictedbbox = stov(readtext);
	readtext = fgets(readfrik);
	afflictedpbbox = stov(readtext);
	readtext = fgets(readfrik);
	afflictedpvel = stof(readtext);
	readtext = fgets(readfrik);
	aff_dr_idle = stof(readtext);
	readtext = fgets(readfrik);
	aff_dr_walk = stof(readtext);
	readtext = fgets(readfrik);
	aff_dr_attack = stof(readtext);
	readtext = fgets(readfrik);
	aff_dr_run = stof(readtext);
	readtext = fgets(readfrik);
	damageexplosionafflicted = stof(readtext);
	readtext = fgets(readfrik);
	radiusexplosionafflicted = stof(readtext);
	readtext = fgets(readfrik);
	affpl = stof(readtext);
	readtext = fgets(readfrik);
	affpm = stof(readtext);
	readtext = fgets(readfrik);
	affph = stof(readtext);
	readtext = fgets(readfrik);
	damagedexplosionafflicted = stof(readtext);
	readtext = fgets(readfrik);
	radiusdexplosionafflicted = stof(readtext);
	readtext = fgets(readfrik);
	afflicted_damagetomonsters = stof(readtext);	//
	readtext = fgets(readfrik);
	afflicted_pushfactor = stof(readtext);	//
	readtext = fgets(readfrik);
	afflicted_suicide_distance = stof(readtext);	//
	fclose(readfrik);
	*/
}


vector aff_gib1;
vector aff_gib2;
vector aff_gib3;
vector aff_gib4;
vector aff_gib5;
vector aff_gib6;
vector aff_gib7;
vector aff_gib8;
vector aff_gib9;
vector aff_gib10;
vector aff_gib11;
vector aff_gib12;
vector aff_gib13;

void check_afflicted_gibs() {
	aff_gib1  = '100 0 300';      // gib_head.md3      (forward, right, up)
	aff_gib2  = '100 200 200';    // gib_arm_r_a.md3
	aff_gib3  = '-100 100 200';   // gib_arm_r_b.md3
	aff_gib4  = '-100 -200 200';  // gib_arm_l_a.md3
	aff_gib5  = '100 -100 200';   // gib_arm_l_b.md3
	aff_gib6  = '-50 100 100';    // gib_leg_r_a.md3
	aff_gib7  = '50 100 100';     // gib_leg_r_b.md3
	aff_gib8  = '50 -100 100';    // gib_leg_l_a.md3
	aff_gib9  = '-50 -100 100';   // gib_leg_l_b.md3
	aff_gib10 = '100 100 300';    // velocity "models/gibs/gib_small.md3"
	aff_gib11 = '-100 -100 200';  // velocity "models/gibs/gib_small.md3"
	aff_gib12 = '-50 50 300';     // velocity "models/gibs/gib_med.md3"
	aff_gib13 = '50 -50 200';     // velocity "models/gibs/gib_med.md3"
	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("enemies/afflicted_gibs.txt", FILE_READ);
	readtext = fgets(readfrik);
	aff_gib1 = stov(readtext);
	readtext = fgets(readfrik);
	aff_gib2 = stov(readtext);
	readtext = fgets(readfrik);
	aff_gib3 = stov(readtext);
	readtext = fgets(readfrik);
	aff_gib4 = stov(readtext);
	readtext = fgets(readfrik);
	aff_gib5 = stov(readtext);
	readtext = fgets(readfrik);
	aff_gib6 = stov(readtext);
	readtext = fgets(readfrik);
	aff_gib7 = stov(readtext);
	readtext = fgets(readfrik);
	aff_gib8 = stov(readtext);
	readtext = fgets(readfrik);
	aff_gib9 = stov(readtext);
	readtext = fgets(readfrik);
	aff_gib10 = stov(readtext);
	readtext = fgets(readfrik);
	aff_gib11 = stov(readtext);
	readtext = fgets(readfrik);
	aff_gib12 = stov(readtext);
	readtext = fgets(readfrik);
	aff_gib13 = stov(readtext);
	readtext = fgets(readfrik);
	aff_gib14 = stov(readtext);
	readtext = fgets(readfrik);
	aff_gib15 = stov(readtext);
	readtext = fgets(readfrik);
	aff_gib16 = stov(readtext);
	readtext = fgets(readfrik);
	aff_gib17 = stov(readtext);
	readtext = fgets(readfrik);
	aff_gib18 = stov(readtext);
	readtext = fgets(readfrik);
	aff_gib19 = stov(readtext);
	readtext = fgets(readfrik);
	aff_gib20 = stov(readtext);

	fclose(readfrik);
	*/
}



/*
float hereod;
float heredmg;
float herevel;
float herelif;

void()check_here_vel=
{
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath ("enemies/heretic_vel.txt", FILE_READ);
	readtext = fgets(readfrik);
	herepl = stof(readtext);
	readtext = fgets(readfrik);
	herepm = stof(readtext);
	readtext = fgets(readfrik);
	hereph = stof(readtext);
	readtext = fgets(readfrik);
	heredmg = stof(readtext);
	readtext = fgets(readfrik);
	hereod = stof(readtext);
	readtext = fgets(readfrik);
	herevel = stof(readtext);
	readtext = fgets(readfrik);
	herelif = stof(readtext);
	fclose (readfrik);
};
*/
float lpdmg;
float mpdmg;
float hpdmg;

void check_damg_pain() {
	lpdmg = 0.1;  // low damage pain (10%)
	mpdmg = 0.5;  // medium damage pain (50%)
	hpdmg = 0.9;  // high damage pain (90%)
	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("weapons/damagepercent.txt", FILE_READ);
	readtext = fgets(readfrik);
	lpdmg = stof(readtext);
	readtext = fgets(readfrik);
	mpdmg = stof(readtext);
	readtext = fgets(readfrik);
	hpdmg = stof(readtext);
	fclose(readfrik);
	*/
}


float exec_rangeattack;
float exec_vwalk1;

float exec_atta1;
float exec_atta2;
float exec_atta3;
float exec_atta4;
float exec_atta5;
float exec_atta6;
float exec_atta7;
float exec_atta8;
float exec_atta9;
float exec_atta10;
float exec_attb1;
float exec_attb2;
float exec_attb3;
float exec_attb4;
float exec_attb5;
float exec_attb6;
float exec_attb7;
float exec_attb8;
float exec_attb9;
float exec_attb10;
float exec_attc1;
float exec_attc2;
float exec_attc3;
float exec_attc4;
float exec_attc5;
float exec_attc6;
float exec_attc7;
float exec_attc8;
float exec_attc9;
float exec_attc10;
float exec_attd1;
float exec_attd2;
float exec_attd3;
float exec_attd4;
float exec_attd5;
float exec_attd6;
float exec_attd7;
float exec_attd8;
float exec_attd9;
float exec_attd10;
float exec_charge1;
float exec_charge2;
float exec_charge3;
float exec_charge4;
float exec_charge5;
float exec_charge6;
float exec_chsh1;
float exec_chsh2;
float exec_chsh3;
float exec_chsh4;
float exec_chsh5;
float exec_chsh6;

float exec_health;
float exec_damage;
float exec_chargedamage;
float exec_impactdamage;
float exec_radius;
float exec_chargetime;

void check_exec_vel() {
	exec_health       = 1800;  // health
	exec_damage       = 30;    // melee damage
	exec_rangeattack  = 110;   // rangeattack
	exec_chargedamage = 30;    // melee after charge damage
	exec_impactdamage = 80;    // charge damage
	exec_radius       = 100;   // walk destruction radius
	exec_chargetime   = 1.2;   // charge time
	exec_vwalk1       = 10;    // run speed
	exec_atta1        = 15;    // 1 attack a velocity
	exec_atta2        = 15;    // 2 attack a velocity
	exec_atta3        = 15;    // 3 attack a velocity
	exec_atta4        = 0;     // 4 attack a velocity
	exec_atta5        = 0;     // 5 attack a velocity
	exec_atta6        = 15;    // 6 attack a velocity
	exec_atta7        = 15;    // 7 attack a velocity
	exec_atta8        = 15;    // 8 attack a velocity
	exec_atta9        = 0;     // 9 attack a velocity
	exec_atta10       = 15;    // 10 attack a velocity
	exec_attb1        = 0;     // 1 attack b velocity
	exec_attb2        = 0;     // 2 attack b velocity
	exec_attb3        = 0;     // 3 attack b velocity
	exec_attb4        = 0;     // 4 attack b velocity
	exec_attb5        = 5;     // 5 attack b velocity
	exec_attb6        = 5;     // 6 attack b velocity
	exec_attb7        = 0;     // 7 attack b velocity
	exec_attb8        = 0;     // 8 attack b velocity
	exec_attb9        = 10;    // 9 attack b velocity
	exec_attb10       = 10;    // 10 attack b velocity
	exec_attc1        = 15;    // 1 attack c velocity
	exec_attc2        = 15;    // 2 attack c velocity
	exec_attc3        = 15;    // 3 attack c velocity
	exec_attc4        = 0;     // 4 attack c velocity
	exec_attc5        = 0;     // 5 attack c velocity
	exec_attc6        = 15;    // 6 attack c velocity
	exec_attc7        = 15;    // 7 attack c velocity
	exec_attc8        = 15;    // 8 attack c velocity
	exec_attc9        = 0;     // 9 attack c velocity
	exec_attc10       = 15;    // 10 attack c velocity
	exec_attd1        = 0;     // 1 attack d velocity
	exec_attd2        = 0;     // 2 attack d velocity
	exec_attd3        = 0;     // 3 attack d velocity
	exec_attd4        = 0;     // 4 attack d velocity
	exec_attd5        = 5;     // 5 attack d velocity
	exec_attd6        = 5;     // 6 attack d velocity
	exec_attd7        = 0;     // 7 attack d velocity
	exec_attd8        = 0;     // 8 attack d velocity
	exec_attd9        = 10;    // 9 attack d velocity
	exec_attd10       = 10;    // 10 attack d velocity
	exec_charge1      = 20;    // chargeA velocity
	exec_charge2      = 20;    // chargeA velocity
	exec_charge3      = 20;    // chargeA velocity
	exec_charge4      = 20;    // chargeA velocity
	exec_charge5      = 20;    // chargeA velocity
	exec_charge6      = 20;    // chargeA velocity
	exec_chsh1        = 0;     // 5 shoveA velocity
	exec_chsh2        = 15;    // 6 shoveA velocity
	exec_chsh3        = 15;    // 7 shoveA velocity
	exec_chsh4        = 15;    // 8 shoveA velocity
	exec_chsh5        = 0;     // 9 shoveA velocity
	exec_chsh6        = 15;    // 10 shoveA velocity

	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("enemies/exec_vel.txt", FILE_READ);
	readtext = fgets(readfrik);
	exec_health = stof(readtext);
	readtext = fgets(readfrik);
	exec_damage = stof(readtext);
	readtext = fgets(readfrik);
	exec_rangeattack = stof(readtext);
	readtext = fgets(readfrik);
	exec_chargedamage = stof(readtext);
	readtext = fgets(readfrik);
	exec_impactdamage = stof(readtext);
	readtext = fgets(readfrik);
	exec_radius = stof(readtext);
	readtext = fgets(readfrik);
	exec_chargetime = stof(readtext);
	readtext = fgets(readfrik);
	exec_vwalk1 = stof(readtext);
	readtext = fgets(readfrik);
	exec_atta1 = stof(readtext);
	readtext = fgets(readfrik);
	exec_atta2 = stof(readtext);
	readtext = fgets(readfrik);
	exec_atta3 = stof(readtext);
	readtext = fgets(readfrik);
	exec_atta4 = stof(readtext);
	readtext = fgets(readfrik);
	exec_atta5 = stof(readtext);
	readtext = fgets(readfrik);
	exec_atta6 = stof(readtext);
	readtext = fgets(readfrik);
	exec_atta7 = stof(readtext);
	readtext = fgets(readfrik);
	exec_atta8 = stof(readtext);
	readtext = fgets(readfrik);
	exec_atta9 = stof(readtext);
	readtext = fgets(readfrik);
	exec_atta10 = stof(readtext);
	readtext = fgets(readfrik);
	exec_attb1 = stof(readtext);
	readtext = fgets(readfrik);
	exec_attb2 = stof(readtext);
	readtext = fgets(readfrik);
	exec_attb3 = stof(readtext);
	readtext = fgets(readfrik);
	exec_attb4 = stof(readtext);
	readtext = fgets(readfrik);
	exec_attb5 = stof(readtext);
	readtext = fgets(readfrik);
	exec_attb6 = stof(readtext);
	readtext = fgets(readfrik);
	exec_attb7 = stof(readtext);
	readtext = fgets(readfrik);
	exec_attb8 = stof(readtext);
	readtext = fgets(readfrik);
	exec_attb9 = stof(readtext);
	readtext = fgets(readfrik);
	exec_attb10 = stof(readtext);
	readtext = fgets(readfrik);
	exec_attc1 = stof(readtext);
	readtext = fgets(readfrik);
	exec_attc2 = stof(readtext);
	readtext = fgets(readfrik);
	exec_attc3 = stof(readtext);
	readtext = fgets(readfrik);
	exec_attc4 = stof(readtext);
	readtext = fgets(readfrik);
	exec_attc5 = stof(readtext);
	readtext = fgets(readfrik);
	exec_attc6 = stof(readtext);
	readtext = fgets(readfrik);
	exec_attc7 = stof(readtext);
	readtext = fgets(readfrik);
	exec_attc8 = stof(readtext);
	readtext = fgets(readfrik);
	exec_attc9 = stof(readtext);
	readtext = fgets(readfrik);
	exec_attc10 = stof(readtext);
	readtext = fgets(readfrik);
	exec_attd1 = stof(readtext);
	readtext = fgets(readfrik);
	exec_attd2 = stof(readtext);
	readtext = fgets(readfrik);
	exec_attd3 = stof(readtext);
	readtext = fgets(readfrik);
	exec_attd4 = stof(readtext);
	readtext = fgets(readfrik);
	exec_attd5 = stof(readtext);
	readtext = fgets(readfrik);
	exec_attd6 = stof(readtext);
	readtext = fgets(readfrik);
	exec_attd7 = stof(readtext);
	readtext = fgets(readfrik);
	exec_attd8 = stof(readtext);
	readtext = fgets(readfrik);
	exec_attd9 = stof(readtext);
	readtext = fgets(readfrik);
	exec_attd10 = stof(readtext);
	readtext = fgets(readfrik);
	exec_charge1 = stof(readtext);
	readtext = fgets(readfrik);
	exec_charge2 = stof(readtext);
	readtext = fgets(readfrik);
	exec_charge3 = stof(readtext);
	readtext = fgets(readfrik);
	exec_charge4 = stof(readtext);
	readtext = fgets(readfrik);
	exec_charge5 = stof(readtext);
	readtext = fgets(readfrik);
	exec_charge6 = stof(readtext);
	readtext = fgets(readfrik);
	exec_chsh1 = stof(readtext);
	readtext = fgets(readfrik);
	exec_chsh2 = stof(readtext);
	readtext = fgets(readfrik);
	exec_chsh3 = stof(readtext);
	readtext = fgets(readfrik);
	exec_chsh4 = stof(readtext);
	readtext = fgets(readfrik);
	exec_chsh5 = stof(readtext);
	readtext = fgets(readfrik);
	exec_chsh6 = stof(readtext);
	fclose(readfrik);
	*/
}


float fn_vwalk1;
float fn_vwalk2;
float fn_vwalk3;
float fn_vwalk4;
float fn_vwalk5;
float fn_vwalk6;
float fn_vwalk7;
float fn_vwalk8;
float fn_vwalk9;
float fn_vwalk10;
float fn_vwalk11;
float fn_vwalk12;
float fn_vwalk13;
float fn_vwalk14;
float fn_vwalk15;
float fn_vwalk16;
float fn_vwalk17;
float fn_vwalk18;
float fn_vwalk19;
float fn_vwalk20;

void check_fallen2() {
	fn_vwalk1  = 6;   // velocity frame 1
	fn_vwalk2  = 8;   // velocity frame 2
	fn_vwalk3  = 10;  // velocity frame 3
	fn_vwalk4  = 10;  // velocity frame 4
	fn_vwalk5  = 8;   // velocity frame 5
	fn_vwalk6  = 6;   // velocity frame 6
	fn_vwalk7  = 4;   // velocity frame 7
	fn_vwalk8  = 2;   // velocity frame 8
	fn_vwalk9  = 2;   // velocity frame 9
	fn_vwalk10 = 2;   // velocity frame 10
	fn_vwalk11 = 6;   // velocity frame 11
	fn_vwalk12 = 8;   // velocity frame 12
	fn_vwalk13 = 10;  // velocity frame 13
	fn_vwalk14 = 10;  // velocity frame 14
	fn_vwalk15 = 8;   // velocity frame 15
	fn_vwalk16 = 6;   // velocity frame 16
	fn_vwalk17 = 4;   // velocity frame 17
	fn_vwalk18 = 2;   // velocity frame 18
	fn_vwalk19 = 2;   // velocity frame 19
	fn_vwalk20 = 2;   // velocity frame 20

	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("enemies/fallen_vel.txt", FILE_READ);
	readtext = fgets(readfrik);
	fn_vwalk1 = stof(readtext);
	readtext = fgets(readfrik);
	fn_vwalk2 = stof(readtext);
	readtext = fgets(readfrik);
	fn_vwalk3 = stof(readtext);
	readtext = fgets(readfrik);
	fn_vwalk4 = stof(readtext);
	readtext = fgets(readfrik);
	fn_vwalk5 = stof(readtext);
	readtext = fgets(readfrik);
	fn_vwalk6 = stof(readtext);
	readtext = fgets(readfrik);
	fn_vwalk7 = stof(readtext);
	readtext = fgets(readfrik);
	fn_vwalk8 = stof(readtext);
	readtext = fgets(readfrik);
	fn_vwalk9 = stof(readtext);
	readtext = fgets(readfrik);
	fn_vwalk10 = stof(readtext);
	readtext = fgets(readfrik);
	fn_vwalk11 = stof(readtext);
	readtext = fgets(readfrik);
	fn_vwalk12 = stof(readtext);
	readtext = fgets(readfrik);
	fn_vwalk13 = stof(readtext);
	readtext = fgets(readfrik);
	fn_vwalk14 = stof(readtext);
	readtext = fgets(readfrik);
	fn_vwalk15 = stof(readtext);
	readtext = fgets(readfrik);
	fn_vwalk16 = stof(readtext);
	readtext = fgets(readfrik);
	fn_vwalk17 = stof(readtext);
	readtext = fgets(readfrik);
	fn_vwalk18 = stof(readtext);
	readtext = fgets(readfrik);
	fn_vwalk19 = stof(readtext);
	readtext = fgets(readfrik);
	fn_vwalk20 = stof(readtext);
	readtext = fgets(readfrik);
	fclose(readfrik);
	*/
}

///////////////////////////

float invader_health;
float invader_ws;
float invader_wth;
float invader_rs;
float invader_rt;
float invader_rth;	//runing think
float invader_attp;
float invader_ad;
float invader_at;
float invader_ath;
float invader_pat;
float invader_sad;
float invader_sat;
float invader_spat;
float invader_dtp;
float invader_pt;
float invader_pth;
vector invader_bbox;
float invader_nproj;
float invader_shotgun_spread1;
float invader_projvel;
float invader_lungevel;
float invader_far;
float invader_mid;
float invader_near;
float invader_rtp;	//roll to pain
float invader_zzc;
float invader_zzd;
float invader_zzmd;
float invader_itadr;
float invader_gdv;

void check_invader() {
	invader_health          = 200;         //  health
	invader_ws              = 8;           //  walk speed
	invader_wth             = 100;         //  walk think % chance to attack, else keep walking
	invader_rs              = 8;           //  run speed
	invader_rt              = 1;           //  run time cycle duration
	invader_rth             = 100;         //  run think roll
	invader_attp            = 1;           //  attack type (melee[1] or projectile[2])
	invader_ad              = 3;           //  RANGED attack damage
	invader_at              = 1;           //  attack time
	invader_ath             = 50;          //  attack think % chance to attack, else keep runing
	invader_pat             = 1;           //  pre-attack time
	invader_sad             = 50;          //  MELEE attack damage
	invader_sat             = 1;           //  secondary attack time
	invader_spat            = 0;           //  secondary pre-attack time
	invader_dtp             = 25;          //  damage needed to pain
	invader_pt              = .5;          //  pain time
	invader_pth             = 100;         //  pain think % chance to attack or walk
	invader_bbox            = '32 32 64';  //  bbox
	invader_nproj           = 10;          //  NUM projectiles
	invader_shotgun_spread1 = .1;          //  projectile spread fire 1
	invader_projvel         = 4096;        //  projectile velocity ammount
	invader_lungevel        = 800;         //  lunge velocity
	invader_far             = 4096;        //  far
	invader_mid             = 1024;        //  mid
	invader_near            = 92;          //  near
	invader_rtp             = 75;          //  roll dice (pain)
	invader_zzc             = 100;         //  zigzag chance
	invader_zzd             = 45;          //  zigzag max deviance
	invader_zzmd            = 10;          //  zigzag min deviance
	invader_itadr           = 75;          //  chance to attack on wakeup
	invader_gdv             = -250;        //  overkill needed to gib

	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("enemies/invader.txt", FILE_READ);
	readtext = fgets(readfrik);
	invader_health = stof(readtext);
	readtext = fgets(readfrik);
	invader_ws = stof(readtext);
	readtext = fgets(readfrik);
	invader_wth = stof(readtext);
	readtext = fgets(readfrik);
	invader_rs = stof(readtext);
	readtext = fgets(readfrik);
	invader_rt = stof(readtext);
	readtext = fgets(readfrik);
	invader_rth = stof(readtext);	// runing think
	readtext = fgets(readfrik);
	invader_attp = stof(readtext);
	readtext = fgets(readfrik);
	invader_ad = stof(readtext);
	readtext = fgets(readfrik);
	invader_at = stof(readtext);
	readtext = fgets(readfrik);
	invader_ath = stof(readtext);	// chance to attack
	readtext = fgets(readfrik);
	invader_pat = stof(readtext);
	readtext = fgets(readfrik);
	invader_sad = stof(readtext);
	readtext = fgets(readfrik);
	invader_sat = stof(readtext);
	readtext = fgets(readfrik);
	invader_spat = stof(readtext);
	readtext = fgets(readfrik);
	invader_dtp = stof(readtext);
	readtext = fgets(readfrik);
	invader_pt = stof(readtext);
	readtext = fgets(readfrik);
	invader_pth = stof(readtext);
	readtext = fgets(readfrik);
	invader_bbox = stov(readtext);
	readtext = fgets(readfrik);
	invader_nproj = stof(readtext);
	readtext = fgets(readfrik);
	invader_shotgun_spread1 = stof(readtext);
	readtext = fgets(readfrik);
	invader_projvel = stof(readtext);
	readtext = fgets(readfrik);
	invader_lungevel = stof(readtext);
	readtext = fgets(readfrik);
	invader_far = stof(readtext);
	readtext = fgets(readfrik);
	invader_mid = stof(readtext);
	readtext = fgets(readfrik);
	invader_near = stof(readtext);
	readtext = fgets(readfrik);
	invader_rtp = stof(readtext);
	readtext = fgets(readfrik);
	invader_zzc = stof(readtext);
	readtext = fgets(readfrik);
	invader_zzd = stof(readtext);
	readtext = fgets(readfrik);
	invader_zzmd = stof(readtext);
	readtext = fgets(readfrik);
	invader_itadr = stof(readtext);
	readtext = fgets(readfrik);
	invader_gdv = stof(readtext);
	fclose(readfrik);
	*/
}

vector inv_gib1;
vector inv_gib2;
vector inv_gib3;
vector inv_gib4;
vector inv_gib5;
vector inv_gib6;
vector inv_gib7;
vector inv_gib8;
vector inv_gib9;
vector inv_gib10;
vector inv_gib11;
vector inv_gib12;
vector inv_gib13;
vector inv_gib14;
vector inv_gib15;
vector inv_gib16;
vector inv_gib17;
vector inv_gib18;
vector inv_gib19;
vector inv_gib20;

void check_invader_gibs() {
	inv_gib1  = '100 0 200';      // velocity "models/enemies/invader/gibs/gib_head.md3" (forward, right, up)
	inv_gib2  = '-50 -100 100';   // velocity "models/enemies/invader/gibs/gib_arm_l.md3"
	inv_gib3  = '50 100 100';     // velocity "models/enemies/invader/gibs/gib_arm_r.md3"
	inv_gib4  = '50 50 100';      // velocity "models/enemies/invader/gibs/gib_body_r.md3"
	inv_gib5  = '-50 -50 100';    // velocity "models/enemies/invader/gibs/gib_body_l.md3"
	inv_gib6  = '100 100 100';    // velocity "models/enemies/invader/gibs/gib_hair_a.md3"
	inv_gib7  = '-100 0 200';     // velocity "models/enemies/invader/gibs/gib_hair_b.md3"
	inv_gib8  = '100 -100 100';   // velocity "models/enemies/invader/gibs/gib_hair_c.md3"
	inv_gib9  = '50 -100 0';      // velocity "models/enemies/invader/gibs/gib_leg_l.md3"
	inv_gib10 = '-50 100 0';      // velocity "models/enemies/invader/gibs/gib_leg_r.md3"
	inv_gib11 = '100 100 300';    // velocity "models/gibs/gib_small.md3"
	inv_gib12 = '-100 -100 200';  // velocity "models/gibs/gib_small.md3"
	inv_gib13 = '-50 50 300';     // velocity "models/gibs/gib_med.md3"
	inv_gib14 = '50 -50 200';     // velocity "models/gibs/gib_med.md3"
	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("enemies/invader_gibs.txt", FILE_READ);
	readtext = fgets(readfrik);
	inv_gib1 = stov(readtext);
	readtext = fgets(readfrik);
	inv_gib2 = stov(readtext);
	readtext = fgets(readfrik);
	inv_gib3 = stov(readtext);
	readtext = fgets(readfrik);
	inv_gib4 = stov(readtext);
	readtext = fgets(readfrik);
	inv_gib5 = stov(readtext);
	readtext = fgets(readfrik);
	inv_gib6 = stov(readtext);
	readtext = fgets(readfrik);
	inv_gib7 = stov(readtext);
	readtext = fgets(readfrik);
	inv_gib8 = stov(readtext);
	readtext = fgets(readfrik);
	inv_gib9 = stov(readtext);
	readtext = fgets(readfrik);
	inv_gib10 = stov(readtext);
	readtext = fgets(readfrik);
	inv_gib11 = stov(readtext);
	readtext = fgets(readfrik);
	inv_gib12 = stov(readtext);
	readtext = fgets(readfrik);
	inv_gib13 = stov(readtext);
	readtext = fgets(readfrik);
	inv_gib14 = stov(readtext);
	readtext = fgets(readfrik);
	inv_gib15 = stov(readtext);
	readtext = fgets(readfrik);
	inv_gib16 = stov(readtext);
	readtext = fgets(readfrik);
	inv_gib17 = stov(readtext);
	readtext = fgets(readfrik);
	inv_gib18 = stov(readtext);
	readtext = fgets(readfrik);
	inv_gib19 = stov(readtext);
	readtext = fgets(readfrik);
	inv_gib20 = stov(readtext);

	fclose(readfrik);
	*/
}

///////////////////////////

float wretch_health;
float wretch_ws;
float wretch_wth;
float wretch_rs;
float wretch_rt;
float wretch_rth;	//runing think
float wretch_attp;
float wretch_ad;
float wretch_at;
float wretch_ath;
float wretch_pat;
float wretch_sad;
float wretch_sat;
float wretch_spat;
float wretch_dtp;
float wretch_pt;
float wretch_pth;
vector wretch_bbox;
float wretch_far;
float wretch_mid;
float wretch_near;
float wretch_projvel;
float wretch_rtp;	//roll to pain
float wretch_dtg;	//roll to pain
float wretch_rtsh;
float wretch_zzc;
float wretch_zzd;
float wretch_zzmd;
float wretch_itadr;
float wretch_sht;
float wretch_shv;
float wretch_shvb;
float wretch_shsps;
//float wretch_shg;	// spining head gravity
//vector wretch_shkv;	// kick velocity
vector wretch_shbbox;
vector wretch_shbboxn;
float wretch_explo_damage;
float wretch_explo_damage_player;
float wretch_explo_radius;
float wretch_pushfactor;
float wretch_shg;	// spining head gravity
vector wretch_shkv;	// kick velocity

void check_wretch() {
	wretch_health              = 250;           //  health USING
	wretch_ws                  = 16;            //  walk speed USING
	wretch_wth                 = 50;            //  walk think % chance to attack, else keep walking
	wretch_rs                  = 16;            //  run speed USING
	wretch_rt                  = .4;            //  run time cycle duration
	wretch_rth                 = 50;            //  run think roll USING
	wretch_attp                = 1;             //  attack type (melee[1] or projectile[2])
	wretch_ad                  = 20;            //  attack damage USING
	wretch_at                  = .5;            //  attack time
	wretch_ath                 = 50;            //  attack think % chance to attack, else keep runing USING
	wretch_pat                 = 0.3;           //  pre-attack time
	wretch_sad                 = 30;            //  secondary attack damage USING
	wretch_sat                 = 1;             //  secondary attack time
	wretch_spat                = 0.5;           //  secondary pre-attack time
	wretch_dtp                 = 25;            //  damage needed to pain USING
	wretch_pt                  = .5;            //  pain time USING
	wretch_pth                 = 10;            //  pain think % chance to attack or walk USING
	wretch_bbox                = '32 32 64';    //  bbox USING
	wretch_far                 = 4096;          //  far USING
	wretch_mid                 = 2048;          //  mid USING
	wretch_near                = 64;            //  near USING
	wretch_projvel             = 1024;          //  projectile velocity USING
	wretch_rtp                 = 50;            //  roll dice (pain) USING
	wretch_dtg                 = -200;          //  damage needed to gib USING
	wretch_rtsh                = 50;            //  roll dice to spining head USING
	wretch_zzc                 = 75;            //  zigzag chance USING
	wretch_zzd                 = 45;            //  zigzag max deviance USING
	wretch_zzmd                = 10;            //  zigzag min deviance USING
	wretch_itadr               = 50;            //  chance to attack on wakeup
	wretch_sht                 = 1.5;           //  spining head life time USING
	wretch_shv                 = -1200;         //  spining head velocity (angles per second) USING
	wretch_shvb                = -1200;         //  spining head velocity at start USING
	wretch_shsps               = 10;            //  spining head shoots per second
	wretch_shg                 = 1;             //  spining head gravity
	wretch_shkv                = '128 128 32';  //  spining head kick vector
	wretch_shbbox              = '16 16 20';    //  spining head bbox
	wretch_shbboxn             = '-16 -16 0';   //  spining head negative bbox
	wretch_explo_damage        = 250;           //  damage explo damage to enemy
	wretch_explo_damage_player = 50;            //  damage explo damage to player
	wretch_explo_radius        = 192;           //  damage explo radius
	wretch_pushfactor          = 3;             //  explo pushfactor
	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("enemies/wretch.txt", FILE_READ);
	readtext = fgets(readfrik);
	wretch_health = stof(readtext);
	readtext = fgets(readfrik);
	wretch_ws = stof(readtext);
	readtext = fgets(readfrik);
	wretch_wth = stof(readtext);
	readtext = fgets(readfrik);
	wretch_rs = stof(readtext);
	readtext = fgets(readfrik);
	wretch_rt = stof(readtext);
	readtext = fgets(readfrik);
	wretch_rth = stof(readtext);	// runing think
	readtext = fgets(readfrik);
	wretch_attp = stof(readtext);
	readtext = fgets(readfrik);
	wretch_ad = stof(readtext);
	readtext = fgets(readfrik);
	wretch_at = stof(readtext);
	readtext = fgets(readfrik);
	wretch_ath = stof(readtext);	// chance to attack
	readtext = fgets(readfrik);
	wretch_pat = stof(readtext);
	readtext = fgets(readfrik);
	wretch_sad = stof(readtext);
	readtext = fgets(readfrik);
	wretch_sat = stof(readtext);
	readtext = fgets(readfrik);
	wretch_spat = stof(readtext);
	readtext = fgets(readfrik);
	wretch_dtp = stof(readtext);
	readtext = fgets(readfrik);
	wretch_pt = stof(readtext);
	readtext = fgets(readfrik);
	wretch_pth = stof(readtext);
	readtext = fgets(readfrik);
	wretch_bbox = stov(readtext);
	readtext = fgets(readfrik);
	wretch_far = stof(readtext);
	readtext = fgets(readfrik);
	wretch_mid = stof(readtext);
	readtext = fgets(readfrik);
	wretch_near = stof(readtext);
	readtext = fgets(readfrik);
	wretch_projvel = stof(readtext);
	readtext = fgets(readfrik);
	wretch_rtp = stof(readtext);
	readtext = fgets(readfrik);
	wretch_dtg = stof(readtext);
	readtext = fgets(readfrik);
	wretch_rtsh = stof(readtext);
	readtext = fgets(readfrik);
	wretch_zzc = stof(readtext);
	readtext = fgets(readfrik);
	wretch_zzd = stof(readtext);
	readtext = fgets(readfrik);
	wretch_zzmd = stof(readtext);
	readtext = fgets(readfrik);
	wretch_itadr = stof(readtext);
	readtext = fgets(readfrik);
	wretch_sht = stof(readtext);
	readtext = fgets(readfrik);
	wretch_shv = stof(readtext);
	readtext = fgets(readfrik);
	wretch_shvb = stof(readtext);
	readtext = fgets(readfrik);
	wretch_shsps = stof(readtext);// spning head shoots per second
	readtext = fgets(readfrik);
	wretch_shg = stof(readtext);
	readtext = fgets(readfrik);
	wretch_shkv = stov(readtext);
	readtext = fgets(readfrik);
	wretch_shbbox = stov(readtext);
	readtext = fgets(readfrik);
	wretch_shbboxn = stov(readtext);
	readtext = fgets(readfrik);
	wretch_explo_damage = stof(readtext);
	readtext = fgets(readfrik);
	wretch_explo_damage_player = stof(readtext);
	readtext = fgets(readfrik);
	wretch_explo_radius = stof(readtext);
	readtext = fgets(readfrik);
	wretch_pushfactor = stof(readtext);
	fclose(readfrik);
	*/
}


vector wre_gib1;
vector wre_gib2;
vector wre_gib3;
vector wre_gib4;
vector wre_gib5;
vector wre_gib6;
vector wre_gib7;
vector wre_gib8;
vector wre_gib9;
vector wre_gib10;
vector wre_gib11;
vector wre_gib12;
vector wre_gib13;
vector wre_gib14;
vector wre_gib15;
vector wre_gib16;
vector wre_gib17;
vector wre_gib18;
vector wre_gib19;
vector wre_gib20;
vector wre_gib21;
vector wre_gib22;

void check_wretch_gibs() {
	wre_gib1  = '100 100 100';    //  forward, right, up gib_arm1_l.md3
	wre_gib2  = '-100 -100 100';  //  forward, right, up gib_arm1_r.md3
	wre_gib3  = '-100 50 200';    //  forward, right, up gib_arm2_l.md3
	wre_gib4  = '100 -50 200';    //  forward, right, up gib_arm2_r.md3
	wre_gib5  = '75 0 250';       //  forward, right, up gib_head.md3
	wre_gib6  = '0 150 200';      //  forward, right, up gib_leg1_l.md3
	wre_gib7  = '0 -150 200';     //  forward, right, up gib_leg1_r.md3
	wre_gib8  = '100 200 100';    //  forward, right, up gib_leg2_l.md3
	wre_gib9  = '-100 -200 100';  //  forward, right, up gib_leg2_r.md3
	wre_gib10 = '75 100 400';     //  head explo small
	wre_gib11 = '-100 -100 300';  //  head explo small
	wre_gib12 = '-50 50 300';     //  head explo med
	wre_gib13 = '50 -50 200';     //  head explo med
	wre_gib14 = '-25 50 200';     //  head explo large
	wre_gib15 = '25 -50 100';     //  head explo large
	wre_gib16 = '75 100 300';     //  gib generic small
	wre_gib17 = '-100 -75 200';   //  gib generic small
	wre_gib18 = '-75 0 300';      //  gib generic med
	wre_gib19 = '75 -50 200';     //  gib generic med
	wre_gib20 = '-25 50 200';     //  gib generic large
	wre_gib21 = '25 -50 100';     //  gib generic large
	wre_gib22 = '-50 0 200';      //  spinning head
	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("enemies/wretch_gibs.txt", FILE_READ);
	readtext = fgets(readfrik);
	wre_gib1 = stov(readtext);
	readtext = fgets(readfrik);
	wre_gib2 = stov(readtext);
	readtext = fgets(readfrik);
	wre_gib3 = stov(readtext);
	readtext = fgets(readfrik);
	wre_gib4 = stov(readtext);
	readtext = fgets(readfrik);
	wre_gib5 = stov(readtext);
	readtext = fgets(readfrik);
	wre_gib6 = stov(readtext);
	readtext = fgets(readfrik);
	wre_gib7 = stov(readtext);
	readtext = fgets(readfrik);
	wre_gib8 = stov(readtext);
	readtext = fgets(readfrik);
	wre_gib9 = stov(readtext);
	readtext = fgets(readfrik);
	wre_gib10 = stov(readtext);
	readtext = fgets(readfrik);
	wre_gib11 = stov(readtext);
	readtext = fgets(readfrik);
	wre_gib12 = stov(readtext);
	readtext = fgets(readfrik);
	wre_gib13 = stov(readtext);
	readtext = fgets(readfrik);
	wre_gib14 = stov(readtext);
	readtext = fgets(readfrik);
	wre_gib15 = stov(readtext);
	readtext = fgets(readfrik);
	wre_gib16 = stov(readtext);
	readtext = fgets(readfrik);
	wre_gib17 = stov(readtext);
	readtext = fgets(readfrik);
	wre_gib18 = stov(readtext);
	readtext = fgets(readfrik);
	wre_gib19 = stov(readtext);
	readtext = fgets(readfrik);
	wre_gib20 = stov(readtext);
	readtext = fgets(readfrik);
	wre_gib21 = stov(readtext);
	readtext = fgets(readfrik);
	wre_gib22 = stov(readtext);
	readtext = fgets(readfrik);
	wre_gib23 = stov(readtext);
	readtext = fgets(readfrik);
	wre_gib24 = stov(readtext);
	readtext = fgets(readfrik);
	wre_gib25 = stov(readtext);
	fclose(readfrik);
	*/
}

/////////////////////////////////////////

float incisor_health;
float incisor_ws;
float incisor_wth;
float incisor_rs;
float incisor_rt;
float incisor_rth;	//runing think
float incisor_attp;
float incisor_ad;
float incisor_at;
float incisor_ath;
float incisor_pat;
float incisor_sad;
float incisor_sat;
float incisor_spat;
float incisor_dtp;
float incisor_pt;
float incisor_pth;
vector incisor_bbox;
float incisor_far;
float incisor_mid;
float incisor_near;
float incisor_projvel;
float incisor_firerate;
float incisor_projcount;
float incisor_rtp;	//roll to pain
float incisor_zzc;
float incisor_zzd;
float incisor_zzmd;
float incisor_itadr;

void check_incisor() {
	incisor_health    = 200;         //  health
	incisor_ws        = 5;           //  walk speed
	incisor_wth       = 50;          //  walk think % chance to attack, else keep walking
	incisor_rs        = 10;          //  run speed
	incisor_rt        = 1;           //  run time cycle duration
	incisor_rth       = 75;          //  run think roll
	incisor_attp      = 1;           //  attack type (melee[1] or projectile[2])
	incisor_ad        = 5;           //  attack damage
	incisor_at        = 1;           //  attack time
	incisor_ath       = 50;          //  attack think % chance to attack, else keep runing
	incisor_pat       = 0.5;         //  pre-attack time
	incisor_sad       = 30;          //  secondary attack damage
	incisor_sat       = 1;           //  secondary attack time
	incisor_spat      = 0.5;         //  secondary pre-attack time
	incisor_dtp       = 25;          //  damage needed to pain
	incisor_pt        = .5;          //  pain time
	incisor_pth       = 10;          //  pain think % chance to attack or walk
	incisor_bbox      = '32 32 64';  //  bbox
	incisor_far       = 4096;        //  far
	incisor_mid       = 2048;        //  mid
	incisor_near      = 128;         //  near
	incisor_projvel   = 2200;        //  projectile velocity
	incisor_firerate  = 0.1;         //  fire rate
	incisor_projcount = 10;          //  projectile round count
	incisor_rtp       = 75;          //  roll dice (pain)
	incisor_zzc       = 100;         //  zigzag chance
	incisor_zzd       = 45;          //  zigzag max deviance
	incisor_zzmd      = 10;          //  zigzag min deviance
	incisor_itadr     = 50;          //  chance to attack on wakeup
	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("enemies/incisor.txt", FILE_READ);
	readtext = fgets(readfrik);
	incisor_health = stof(readtext);
	readtext = fgets(readfrik);
	incisor_ws = stof(readtext);
	readtext = fgets(readfrik);
	incisor_wth = stof(readtext);
	readtext = fgets(readfrik);
	incisor_rs = stof(readtext);
	readtext = fgets(readfrik);
	incisor_rt = stof(readtext);
	readtext = fgets(readfrik);
	incisor_rth = stof(readtext);	// runing think
	readtext = fgets(readfrik);
	incisor_attp = stof(readtext);
	readtext = fgets(readfrik);
	incisor_ad = stof(readtext);
	readtext = fgets(readfrik);
	incisor_at = stof(readtext);
	readtext = fgets(readfrik);
	incisor_ath = stof(readtext);	// chance to attack
	readtext = fgets(readfrik);
	incisor_pat = stof(readtext);
	readtext = fgets(readfrik);
	incisor_sad = stof(readtext);
	readtext = fgets(readfrik);
	incisor_sat = stof(readtext);
	readtext = fgets(readfrik);
	incisor_spat = stof(readtext);
	readtext = fgets(readfrik);
	incisor_dtp = stof(readtext);
	readtext = fgets(readfrik);
	incisor_pt = stof(readtext);
	readtext = fgets(readfrik);
	incisor_pth = stof(readtext);
	readtext = fgets(readfrik);
	incisor_bbox = stov(readtext);
	readtext = fgets(readfrik);
	incisor_far = stof(readtext);
	readtext = fgets(readfrik);
	incisor_mid = stof(readtext);
	readtext = fgets(readfrik);
	incisor_near = stof(readtext);
	readtext = fgets(readfrik);
	incisor_projvel = stof(readtext);
	readtext = fgets(readfrik);
	incisor_firerate = stof(readtext);
	readtext = fgets(readfrik);
	incisor_projcount = stof(readtext);
	readtext = fgets(readfrik);
	incisor_rtp = stof(readtext);
	readtext = fgets(readfrik);
	incisor_zzc = stof(readtext);
	readtext = fgets(readfrik);
	incisor_zzd = stof(readtext);
	readtext = fgets(readfrik);
	incisor_zzmd = stof(readtext);
	readtext = fgets(readfrik);
	incisor_itadr = stof(readtext);

	fclose(readfrik);
	*/
}

///////////////////////////

float stricken_health;
float stricken_wth;
float stricken_rth;	//runing think
float stricken_ad;
float stricken_ath;
float stricken_sad;
float stricken_dtp;
float stricken_pth;
vector stricken_bbox;
vector stricken_nbbox;
float stricken_far;
float stricken_mid;
float stricken_near;
float stricken_projvel;
float stricken_splashdmg;
float stricken_splashradius;
float stricken_rtp;	//roll to pain
float stricken_zzc;
float stricken_zzd;
float stricken_zzmd;
float stricken_heightstep;
float stricken_lowhealth;
float stricken_spreadintensity;
float stricken_dexplosionradius;
float stricken_dexplosiondamage;
float stricken_dexplosiondamagemonsters;
float stricken_walkradius;
float stricken_damagetomonsters;
float stricken_pushfactor;

void check_stricken() {
	stricken_health                   = 1600;           //  health
	stricken_wth                      = 50;             //  walk think % chance to attack, else keep walking
	stricken_rth                      = 50;             //  run think % chance to attack, else keep running
	stricken_ad                       = 30;             //  attack damage (PROJECTILE)
	stricken_ath                      = 50;             //  attack think % chance to attack, else keep running
	stricken_sad                      = 40;             //  secondary attack damage (MELEE)
	stricken_dtp                      = 400;            //  damage needed to pain
	stricken_rtp                      = 100;            //  roll dice (pain chance)
	stricken_pth                      = 100;            //  pain think % chance to attack, else run
	stricken_bbox                     = '48 48 44';     //  bbox
	stricken_nbbox                    = '-48 -48 -32';  //  negative bbox
	stricken_far                      = 4096;           //  far
	stricken_mid                      = 2048;           //  mid
	stricken_near                     = 128;            //  near
	stricken_projvel                  = 1200;           //  PROJECTILE velocity
	stricken_splashdmg                = 0;              //  splash damage
	stricken_splashradius             = 64;             //  splash radius
	stricken_zzc                      = 100;            //  zigzag chance
	stricken_zzd                      = 45;             //  zigzag max deviance
	stricken_zzmd                     = 10;             //  zigzag min deviance
	stricken_heightstep               = 14;             //  stepheight (added to sv_stepheight 16)
	stricken_lowhealth                = 1000;           //  "low health" attack health threshold
	stricken_spreadintensity          = 135;            //  "low health" attack spread deviance
	stricken_dexplosionradius         = 256;            //  death explosion radius
	stricken_dexplosiondamage         = 100;            //  death explosion damage
	stricken_dexplosiondamagemonsters = 300;            //  death explosion monster damage
	stricken_walkradius               = 96;             //  walk radius destruction
	stricken_damagetomonsters         = 100;            //  attack damage to monsters (PROJECTILE)
	stricken_pushfactor               = 4;              //  explo pushfactor
	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("enemies/stricken.txt", FILE_READ);
	readtext = fgets(readfrik);
	stricken_health = stof(readtext);	// health
	readtext = fgets(readfrik);
	stricken_wth = stof(readtext);	// walking think
	readtext = fgets(readfrik);
	stricken_rth = stof(readtext);	// runing think
	readtext = fgets(readfrik);
	stricken_ad = stof(readtext);	// attack damage
	readtext = fgets(readfrik);
	stricken_ath = stof(readtext);	// attack think
	readtext = fgets(readfrik);
	stricken_sad = stof(readtext);	// secondary attack damage
	readtext = fgets(readfrik);
	stricken_dtp = stof(readtext);	//damage to pain
	readtext = fgets(readfrik);
	stricken_rtp = stof(readtext);	// pain chance
	readtext = fgets(readfrik);
	stricken_pth = stof(readtext);	// chance pain to run or attack
	readtext = fgets(readfrik);
	stricken_bbox = stov(readtext);	/// boox
	readtext = fgets(readfrik);
	stricken_nbbox = stov(readtext);	/// boox
	readtext = fgets(readfrik);
	stricken_far = stof(readtext);	// far
	readtext = fgets(readfrik);
	stricken_mid = stof(readtext);	// mid
	readtext = fgets(readfrik);
	stricken_near = stof(readtext);	// close
	readtext = fgets(readfrik);
	stricken_projvel = stof(readtext);	// projectile velocity
	readtext = fgets(readfrik);
	stricken_splashdmg = stof(readtext);	//    splash damage
	readtext = fgets(readfrik);
	stricken_splashradius = stof(readtext);	//    splash radius
	readtext = fgets(readfrik);
	stricken_zzc = stof(readtext);	//    zigzag chance
	readtext = fgets(readfrik);
	stricken_zzd = stof(readtext);	//    zigzag max deviance
	readtext = fgets(readfrik);
	stricken_zzmd = stof(readtext);	//    zigzag min deviance
	readtext = fgets(readfrik);
	stricken_heightstep = stof(readtext);	//    stepheight
	readtext = fgets(readfrik);
	stricken_lowhealth = stof(readtext);	//   low health
	readtext = fgets(readfrik);
	stricken_spreadintensity = stof(readtext);	//   spread low health projectile
	readtext = fgets(readfrik);
	stricken_dexplosionradius = stof(readtext);	//
	readtext = fgets(readfrik);
	stricken_dexplosiondamage = stof(readtext);	//
	readtext = fgets(readfrik);
	stricken_dexplosiondamagemonsters = stof(readtext);	//
	readtext = fgets(readfrik);
	stricken_walkradius = stof(readtext);	//
	readtext = fgets(readfrik);
	stricken_damagetomonsters = stof(readtext);	//
	readtext = fgets(readfrik);
	stricken_pushfactor = stof(readtext);	//

	fclose(readfrik);
	*/
}


vector str_gib1;
vector str_gib2;
vector str_gib3;
vector str_gib4;
vector str_gib5;
vector str_gib6;
vector str_gib7;
vector str_gib8;
vector str_gib9;
vector str_gib10;
vector str_gib11;
vector str_gib12;
vector str_gib13;
vector str_gib14;
vector str_gib15;
vector str_gib16;
vector str_gib17;
vector str_gib18;
vector str_gib19;
vector str_gib20;

void check_stricken_gibs() {
	str_gib1  = '-150 -250 200';  // forward, right, up gib_arm_l_a.md3
	str_gib2  = '200 -200 25';    // forward, right, up gib_arm_l_b.md3
	str_gib3  = '150 250 200';    // forward, right, up gib_arm_r_a.md3
	str_gib4  = '-200 200 25';    // forward, right, up gib_arm_r_b.md3
	str_gib5  = '200 -50 200';    // forward, right, up gib_head.md3
	str_gib6  = '300 100 50';     // forward, right, up gib_jaw.md3
	str_gib7  = '50 -400 100';    // forward, right, up gib_side_l.md3
	str_gib8  = '50 400 -100';    // forward, right, up gib_side_r.md3
	str_gib9  = '-200 0 200';     // forward, right, up gib_tail.md3
	str_gib10 = '350 -100 350';   // forward, right, up tag_cyst_a
	str_gib11 = '200 100 300';    // forward, right, up tag_cyst_b
	str_gib12 = '0 250 400';      // forward, right, up tag_cyst_c
	str_gib13 = '-100 -250 300';  // forward, right, up tag_cyst_d
	str_gib14 = '-200 0 350';     // forward, right, up tag_cyst_e
	str_gib15 = '250 200 300';    // forward, right, up gib_small.md3
	str_gib16 = '-250 -200 300';  // forward, right, up gib_small.md3
	str_gib17 = '200 -100 250';   // forward, right, up gib_med.md3
	str_gib18 = '-200 100 250';   // forward, right, up gib_med.md3
	str_gib19 = '150 150 200';    // forward, right, up gib_large.md3
	str_gib20 = '-150 -150 200';  // forward, right, up gib_large.md3
	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("enemies/stricken_gibs.txt", FILE_READ);
	readtext = fgets(readfrik);
	str_gib1 = stov(readtext);
	readtext = fgets(readfrik);
	str_gib2 = stov(readtext);
	readtext = fgets(readfrik);
	str_gib3 = stov(readtext);
	readtext = fgets(readfrik);
	str_gib4 = stov(readtext);
	readtext = fgets(readfrik);
	str_gib5 = stov(readtext);
	readtext = fgets(readfrik);
	str_gib6 = stov(readtext);
	readtext = fgets(readfrik);
	str_gib7 = stov(readtext);
	readtext = fgets(readfrik);
	str_gib8 = stov(readtext);
	readtext = fgets(readfrik);
	str_gib9 = stov(readtext);
	readtext = fgets(readfrik);
	str_gib10 = stov(readtext);
	readtext = fgets(readfrik);
	str_gib11 = stov(readtext);
	readtext = fgets(readfrik);
	str_gib12 = stov(readtext);
	readtext = fgets(readfrik);
	str_gib13 = stov(readtext);
	readtext = fgets(readfrik);
	str_gib14 = stov(readtext);
	readtext = fgets(readfrik);
	str_gib15 = stov(readtext);
	readtext = fgets(readfrik);
	str_gib16 = stov(readtext);
	readtext = fgets(readfrik);
	str_gib17 = stov(readtext);
	readtext = fgets(readfrik);
	str_gib18 = stov(readtext);
	readtext = fgets(readfrik);
	str_gib19 = stov(readtext);
	readtext = fgets(readfrik);
	str_gib20 = stov(readtext);

	fclose(readfrik);
	*/
}

///////////////////////////

float heretic_health;
float heretic_ith;
float heretic_ws;
float heretic_wth;
float heretic_rs;
float heretic_rt;
float heretic_rth;	//runing think
float heretic_ad;
float heretic_ath;
float heretic_sad;
float heretic_dtp;
float heretic_pth;
vector heretic_bbox;
float heretic_far;
float heretic_mid;
float heretic_near;
float heretic_projvel;
float heretic_rsr;
float heretic_rtp;	//roll to pain
float heretic_zzc;
float heretic_zzd;
float heretic_zzmd;
float her_radius;
float her_chargetime;

void check_heretic() {
	heretic_health  = 1200;        //    health
	heretic_ws      = 8;           //    walk speed
	heretic_wth     = 50;          //    walk think % chance to attack, else keep walking
	heretic_ith     = 50;          //    chance to attack on wakeup
	heretic_rs      = 16;          //    run speed
	heretic_rt      = 1;           //    run cycle duration
	heretic_rth     = 50;          //    run think % chance to attack, else keep runing
	heretic_rsr     = 512;         //    CHASE speed
	heretic_projvel = 1200;        //    PROJECTILE velocity
	heretic_ad      = 30;          //    PROJECTILE attack damage
	heretic_ath     = 50;          //    PROJECTILE attack think % chance to attack again, else keep runing
	heretic_sad     = 30;          //    MELEE attack damage
	heretic_dtp     = 500;         //    damage needed to pain
	heretic_rtp     = 75;          //    pain chance %
	heretic_pth     = 100;         //    pain think % chance to attack or run
	heretic_bbox    = '64 64 64';  //    bbox
	heretic_far     = 4096;        //    mid (distance for projectile attack)
	heretic_mid     = 384;         //    near (distance to chase)
	heretic_near    = 111;         //    melee (distance to bite)
	heretic_zzc     = 100;         //    zigzag chance
	heretic_zzd     = 45;          //    zigzag max deviance
	heretic_zzmd    = 20;          //    zigzag min deviance
	her_radius      = 120;         //    radius damage destruction
	her_chargetime  = 2;           //    charge duration

	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("enemies/heretic.txt", FILE_READ);
	readtext = fgets(readfrik);
	heretic_health = stof(readtext);	// health
	readtext = fgets(readfrik);
	heretic_ws = stof(readtext);	// walk speed
	readtext = fgets(readfrik);
	heretic_wth = stof(readtext);	//  walk think
	readtext = fgets(readfrik);
	heretic_ith = stof(readtext);	// health
	readtext = fgets(readfrik);
	heretic_rs = stof(readtext);	// run speed
	readtext = fgets(readfrik);
	heretic_rt = stof(readtext);	/// runc cycle duration
	readtext = fgets(readfrik);
	heretic_rth = stof(readtext);	// runing think
	readtext = fgets(readfrik);
	heretic_rsr = stof(readtext);	// chase speed
	readtext = fgets(readfrik);
	heretic_projvel = stof(readtext);	// projectile vel
	readtext = fgets(readfrik);
	heretic_ad = stof(readtext);	// projectile damage
	readtext = fgets(readfrik);
	heretic_ath = stof(readtext);	// chance to attack after attack
	readtext = fgets(readfrik);
	heretic_sad = stof(readtext);	// melee attack camage
	readtext = fgets(readfrik);
	heretic_dtp = stof(readtext);	// damage to pain
	readtext = fgets(readfrik);
	heretic_rtp = stof(readtext);	// painchance
	readtext = fgets(readfrik);
	heretic_pth = stof(readtext);	// pain think
	readtext = fgets(readfrik);
	heretic_bbox = stov(readtext);	// boox
	readtext = fgets(readfrik);
	heretic_far = stof(readtext);	// far
	readtext = fgets(readfrik);
	heretic_mid = stof(readtext);	// mid
	readtext = fgets(readfrik);
	heretic_near = stof(readtext);	// near
	readtext = fgets(readfrik);
	heretic_zzc = stof(readtext);
	readtext = fgets(readfrik);
	heretic_zzd = stof(readtext);
	readtext = fgets(readfrik);
	heretic_zzmd = stof(readtext);
	readtext = fgets(readfrik);
	her_radius = stof(readtext);
	readtext = fgets(readfrik);
	her_chargetime = stof(readtext);

	fclose(readfrik);
	*/
}

vector her_gib1;
vector her_gib2;
vector her_gib3;
vector her_gib4;
vector her_gib5;
vector her_gib6;
vector her_gib7;
vector her_gib8;
vector her_gib9;
vector her_gib10;
vector her_gib11;
vector her_gib12;
vector her_gib13;
vector her_gib14;
vector her_gib15;
vector her_gib16;
vector her_gib17;
vector her_gib18;
vector her_gib19;
vector her_gib20;

void check_heretic_gibs() {
	her_gib1  = '-100 100 50';    // gib_backa.md3  (forward, right, up)
	her_gib2  = '-100 -100 50';   // gib_backb.md3
	her_gib3  = '200 0 100';      // gib_heada.md3
	her_gib4  = '-100 200 50';    // gib_headb.md3
	her_gib5  = '100 -200 50';    // gib_headc.md3
	her_gib6  = '100 0 0';        // gib_jawa.md3
	her_gib7  = '50 100 0';       // gib_jawb.md3
	her_gib8  = '-50 -100 0';     // gib_jawc.md3
	her_gib9  = '50 -300 0';      // gib_tongue_left.md3
	her_gib10 = '-50 300 0';      // gib_tongue_right.md3
	her_gib11 = '200 100 100';    // gib_small.md3
	her_gib12 = '-200 -200 100';  // gib_small.md3
	her_gib13 = '-100 100 50';    // gib_med.md3
	her_gib14 = '100 -100 50';    // gib_med.md3
	her_gib15 = '-50 50 25';      // gib_large.md3
	her_gib16 = '50 -50 25';      // gib_large.md3

	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("enemies/heretic_gibs.txt", FILE_READ);
	readtext = fgets(readfrik);
	her_gib1 = stov(readtext);
	readtext = fgets(readfrik);
	her_gib2 = stov(readtext);
	readtext = fgets(readfrik);
	her_gib3 = stov(readtext);
	readtext = fgets(readfrik);
	her_gib4 = stov(readtext);
	readtext = fgets(readfrik);
	her_gib5 = stov(readtext);
	readtext = fgets(readfrik);
	her_gib6 = stov(readtext);
	readtext = fgets(readfrik);
	her_gib7 = stov(readtext);
	readtext = fgets(readfrik);
	her_gib8 = stov(readtext);
	readtext = fgets(readfrik);
	her_gib9 = stov(readtext);
	readtext = fgets(readfrik);
	her_gib10 = stov(readtext);
	readtext = fgets(readfrik);
	her_gib11 = stov(readtext);
	readtext = fgets(readfrik);
	her_gib12 = stov(readtext);
	readtext = fgets(readfrik);
	her_gib13 = stov(readtext);
	readtext = fgets(readfrik);
	her_gib14 = stov(readtext);
	readtext = fgets(readfrik);
	her_gib15 = stov(readtext);
	readtext = fgets(readfrik);
	her_gib16 = stov(readtext);
	readtext = fgets(readfrik);
	her_gib17 = stov(readtext);
	readtext = fgets(readfrik);
	her_gib18 = stov(readtext);
	readtext = fgets(readfrik);
	her_gib19 = stov(readtext);
	readtext = fgets(readfrik);
	her_gib20 = stov(readtext);

	fclose(readfrik);
	*/
}

//////////////////////

.float zigzag_time;
.float zigzaging;
.float zigzagdeviance;

float widow_health;
float widow_ws;
float widow_wth;
float widow_rs;
float widow_rt;
float widow_rth;	//runing think
float widow_attp;
float widow_ad;
float widow_at;
float widow_ath;
float widow_pat;
float widow_sad;
float widow_sat;
float widow_spat;
float widow_dtp;
float widow_pt;
float widow_pth;
vector widow_bbox;
float widow_far;
float widow_mid;
float widow_near;
float widow_projvel;
float widow_rtp;	//roll to pain
float widow_zzc;
float widow_zzd;
float widow_zzmd;
float widow_itadr;

.float wknd;

float widod;
vector widowbbox;
vector widownbbox;
float widowhealth;
float widowdamage;
float widpl;
float widpm;
float widph;



void check_wd_vel() {
	widowhealth = 400;            // health
	widowdamage = 20;             // damage
	widownbbox  = '-12 -12 -32';  // bbox negative
	widowbbox   = '12 12 24';     // bbox
	widpl       = 25;             // pain damage low
	widpm       = 50;             // pain damage medium
	widph       = 75;             // pain damage high
	widod       = -50;            // over damage
	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("enemies/widow_vel.txt", FILE_READ);
	readtext = fgets(readfrik);
	widowhealth = stof(readtext);
	readtext = fgets(readfrik);
	widowdamage = stof(readtext);
	readtext = fgets(readfrik);
	widownbbox = stov(readtext);
	readtext = fgets(readfrik);
	widowbbox = stov(readtext);
	readtext = fgets(readfrik);
	widpl = stof(readtext);
	readtext = fgets(readfrik);
	widpm = stof(readtext);
	readtext = fgets(readfrik);
	widph = stof(readtext);
	readtext = fgets(readfrik);
	widod = stof(readtext);
	fclose(readfrik);
	*/
}


void check_widow() {
	widow_health  = 500;         //  health
	widow_ws      = 10;          //  walk speed
	widow_wth     = 0;           //  walk think % chance to attack, else keep walking
	widow_rs      = 25;          //  run speed
	widow_rt      = 1;           //  run time cycle duration
	widow_rth     = 0;           //  unused run think roll
	widow_attp    = 1;           //  attack type (melee[1] or projectile[2])
	widow_ad      = 0;           //  unused attack damage
	widow_at      = 0;           //  unused attack time
	widow_ath     = 0;           //  unused attack think % chance to attack, else keep runing
	widow_pat     = 0;           //  unused pre-attack time
	widow_sad     = 20;          //  secondary attack damage
	widow_sat     = 0.5;         //  secondary attack time
	widow_spat    = 0.2;         //  secondary pre-attack time
	widow_dtp     = 50;          //  damage needed to pain
	widow_pt      = .5;          //  pain time
	widow_pth     = 10;          //  pain think % chance to attack or walk
	widow_bbox    = '32 32 64';  //  bbox
	widow_far     = 4096;        //  far
	widow_mid     = 2048;        //  mid
	widow_near    = 72;          //  near
	widow_projvel = 20;          //  melee step velocity
	widow_rtp     = 50;          //  roll dice (pain)
	widow_zzc     = 100;         //  zigzag chance
	widow_zzd     = 50;          //  zigzag max deviance
	widow_zzmd    = 20;          //  zigzag min deviance
	widow_itadr   = 50;          //  chance to attack on wakeup
	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("enemies/widow.txt", FILE_READ);
	readtext = fgets(readfrik);
	widow_health = stof(readtext);
	readtext = fgets(readfrik);
	widow_ws = stof(readtext);
	readtext = fgets(readfrik);
	widow_wth = stof(readtext);
	readtext = fgets(readfrik);
	widow_rs = stof(readtext);
	readtext = fgets(readfrik);
	widow_rt = stof(readtext);
	readtext = fgets(readfrik);
	widow_rth = stof(readtext);	// runing think
	readtext = fgets(readfrik);
	widow_attp = stof(readtext);
	readtext = fgets(readfrik);
	widow_ad = stof(readtext);
	readtext = fgets(readfrik);
	widow_at = stof(readtext);
	readtext = fgets(readfrik);
	widow_ath = stof(readtext);	// chance to attack
	readtext = fgets(readfrik);
	widow_pat = stof(readtext);
	readtext = fgets(readfrik);
	widow_sad = stof(readtext);
	readtext = fgets(readfrik);
	widow_sat = stof(readtext);
	readtext = fgets(readfrik);
	widow_spat = stof(readtext);
	readtext = fgets(readfrik);
	widow_dtp = stof(readtext);
	readtext = fgets(readfrik);
	widow_pt = stof(readtext);
	readtext = fgets(readfrik);
	widow_pth = stof(readtext);
	readtext = fgets(readfrik);
	widow_bbox = stov(readtext);
	readtext = fgets(readfrik);
	widow_far = stof(readtext);
	readtext = fgets(readfrik);
	widow_mid = stof(readtext);
	readtext = fgets(readfrik);
	widow_near = stof(readtext);
	readtext = fgets(readfrik);
	widow_projvel = stof(readtext);
	readtext = fgets(readfrik);
	widow_rtp = stof(readtext);
	readtext = fgets(readfrik);
	widow_zzc = stof(readtext);
	readtext = fgets(readfrik);
	widow_zzd = stof(readtext);
	readtext = fgets(readfrik);
	widow_zzmd = stof(readtext);
	readtext = fgets(readfrik);
	widow_itadr = stof(readtext);

	fclose(readfrik);
	*/
}




float incisorod;
vector incisorbbox;
vector incisornbbox;
float incisorhealth;
float incisordamage;
float incisorpl;
float incisorpm;
float incisorph;

void check_incisor_vel() {
	incisorhealth = 400;            // health
	incisordamage = 5;              // damage
	incisornbbox  = '-12 -12 -32';  // bbox negative
	incisorbbox   = '12 12 24';     // bbox
	incisorpl     = 25;             //  pain damage low
	incisorpm     = 50;             //  pain damage medium
	incisorph     = 75;             //  pain damage high
	incisorod     = -50;            //  over damage

	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("enemies/incisor_vel.txt", FILE_READ);
	readtext = fgets(readfrik);
	incisorhealth = stof(readtext);
	readtext = fgets(readfrik);
	incisordamage = stof(readtext);
	readtext = fgets(readfrik);
	incisornbbox = stov(readtext);
	readtext = fgets(readfrik);
	incisorbbox = stov(readtext);
	readtext = fgets(readfrik);
	incisorpl = stof(readtext);
	readtext = fgets(readfrik);
	incisorpm = stof(readtext);
	readtext = fgets(readfrik);
	incisorph = stof(readtext);
	readtext = fgets(readfrik);
	incisorod = stof(readtext);
	fclose(readfrik);
	*/
}


float wraith_health;
float wraith_damage;
void check_wraith() {
	wraith_health = 200;  // health
	wraith_damage = 20;   // attack damage
	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("enemies/wraith.txt", FILE_READ);
	readtext = fgets(readfrik);
	wraith_health = stof(readtext);
	readtext = fgets(readfrik);
	wraith_damage = stof(readtext);

	fclose(readfrik);
	*/
}


float symbol_health;
float symbol_walkspeed;
float symbol_runspeed;
float symbol_runsidespeed;
float symbol_upspeed;
float symbol_damage;
float symbol_proj_speed;
float symbol_proj_aceleration;
float symbol_proj_angle;
float symbol_dtp;
float symbol_far;
float symbol_mid;
float symbol_near;
vector symbol_bbox;
vector symbol_bboxn;

void check_symbol() {
	symbol_health           = 2000;           // health
	symbol_walkspeed        = 8;              // walk speed
	symbol_runspeed         = 16;             // run speed
	symbol_runsidespeed     = 480;            // run side speed
	symbol_upspeed          = 256;            // fly up speed
	symbol_damage           = 50;             // damage
	symbol_proj_speed       = 200;            // projectile speed
	symbol_proj_aceleration = 4;              // projectile max aceleration factor
	symbol_proj_angle       = 6;              // projectile angle factor
	symbol_dtp              = 500;            //  damage needed to pain
	symbol_far              = 4096;           // far
	symbol_mid              = 512;            // mid
	symbol_near             = 128;            // near
	symbol_bbox             = '48 48 48';     // bbox
	symbol_bboxn            = '-48 -48 -48';  // bboxn

	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("enemies/symbol.txt", FILE_READ);
	readtext = fgets(readfrik);
	symbol_health = stof(readtext);	//helath
	readtext = fgets(readfrik);
	symbol_walkspeed = stof(readtext);	//walk speed
	readtext = fgets(readfrik);
	symbol_runspeed = stof(readtext);	//run speed
	readtext = fgets(readfrik);
	symbol_runsidespeed = stof(readtext);	//run speed
	readtext = fgets(readfrik);
	symbol_upspeed = stof(readtext);	//run speed
	readtext = fgets(readfrik);
	symbol_damage = stof(readtext);	//damage
	readtext = fgets(readfrik);
	symbol_proj_speed = stof(readtext);	//symbol projectile speed
	readtext = fgets(readfrik);
	symbol_proj_aceleration = stof(readtext);	//symbol projectile aceleration
	readtext = fgets(readfrik);
	symbol_proj_angle = stof(readtext);	//symbol projectile angle factor
	readtext = fgets(readfrik);
	symbol_dtp = stof(readtext);	//symbol damage to pain
	readtext = fgets(readfrik);
	symbol_far = stof(readtext);
	readtext = fgets(readfrik);
	symbol_mid = stof(readtext);
	readtext = fgets(readfrik);
	symbol_near = stof(readtext);
	readtext = fgets(readfrik);
	symbol_bbox = stov(readtext);	//size (origin is in center)
	readtext = fgets(readfrik);
	symbol_bboxn = stov(readtext);	//size negative (origin is in center)
	fclose(readfrik);
	*/
}


float martyr_health;
float martyr_radius;
float martyr_orb_offset;
float martyr_flight_dist;

void check_martyr() {
	martyr_health      = 2000;  //  health
	martyr_radius      = 320;   //  orb radius
	martyr_orb_offset  = 64;    //  orb vertical position offset
	martyr_flight_dist = 64;    //  height flight factor
	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("enemies/martyr.txt", FILE_READ);
	readtext = fgets(readfrik);
	martyr_health = stof(readtext);	// health
	readtext = fgets(readfrik);
	martyr_radius = stof(readtext);	//
	readtext = fgets(readfrik);
	martyr_orb_offset = stof(readtext);	//
	readtext = fgets(readfrik);
	martyr_flight_dist = stof(readtext);	//

	fclose(readfrik);
	*/
}


float boss1_proj1_vel;
float boss1_proj1_dd;
float boss1_proj1_sd;
float boss1_proj1_rv;

float boss1_proj1_ammount;
float boss1_proj1_angle;

float boss1_proj2_vel;
float boss1_proj2_homingcount;
float boss1_proj2_dd;
float boss1_proj2_sd;
float boss1_proj2_rv;

void check_boss1() {
	boss1_proj1_vel         = 920;  // scatter velocity
	boss1_proj1_dd          = 80;   // scatter direct damage;
	boss1_proj1_sd          = 40;   // scatter splash damage;
	boss1_proj1_rv          = 96;   // scatter splash radius;
	boss1_proj1_ammount     = 8;    // scatter projectile ammount
	boss1_proj1_angle       = 25;   //  scatter projectile spread variation
	boss1_proj2_vel         = 440;  // shot velocity (shot)
	boss1_proj2_homingcount = 15;   // shot (shot homing count)
	boss1_proj2_dd          = 80;   // shot direct damage;
	boss1_proj2_sd          = 50;   // shot splash damage;
	boss1_proj2_rv          = 128;  // shot splash radius;

	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("enemies/boss1.txt", FILE_READ);
	readtext = fgets(readfrik);
	boss1_proj1_vel = stof(readtext);	// speed
	readtext = fgets(readfrik);

	boss1_proj1_dd = stof(readtext);	// direct damage
	readtext = fgets(readfrik);
	boss1_proj1_sd = stof(readtext);	// damage splash
	readtext = fgets(readfrik);
	boss1_proj1_rv = stof(readtext);	// radius splash
	readtext = fgets(readfrik);

	boss1_proj1_ammount = stof(readtext);	// radius splash
	readtext = fgets(readfrik);

	boss1_proj1_angle = stof(readtext);	// radius splash
	readtext = fgets(readfrik);

	boss1_proj2_vel = stof(readtext);	// speed2
	readtext = fgets(readfrik);
	boss1_proj2_homingcount = stof(readtext);	// homing count
	readtext = fgets(readfrik);
	boss1_proj2_dd = stof(readtext);	// direct damage
	readtext = fgets(readfrik);
	boss1_proj2_sd = stof(readtext);	// damage splash
	readtext = fgets(readfrik);
	boss1_proj2_rv = stof(readtext);	// radius splash
	readtext = fgets(readfrik);

	fclose(readfrik);
	*/
}


float boss2_healtha;
float boss2_healthb;
float boss2_speed;
float boss2_rottime;
float boss2_beamdamage;
float boss2_projdamage;
float boss2_projradius;
float boss2_projspeed;
float boss2_stage2transitiontime;

void check_boss2() {
	boss2_healtha              = 8000;  // boss 2 state1 health
	boss2_healthb              = 5000;  // boss 2 state2 health
	boss2_speed                = 300;   // boss 2 orbit speed
	boss2_rottime              = 10;    // boss 2 orbit time
	boss2_beamdamage           = 8;     // lightning damage
	boss2_projdamage           = 30;    // projectile damage
	boss2_projradius           = 256;   // projectile radius
	boss2_projspeed            = 1024;  // projectile speed
	boss2_stage2transitiontime = 8;     // wait time before tping player to arena

	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("enemies/boss2.txt", FILE_READ);
	readtext = fgets(readfrik);
	boss2_healtha = stof(readtext);
	readtext = fgets(readfrik);
	boss2_healthb = stof(readtext);
	readtext = fgets(readfrik);
	boss2_speed = stof(readtext);
	readtext = fgets(readfrik);
	boss2_rottime = stof(readtext);
	readtext = fgets(readfrik);
	boss2_beamdamage = stof(readtext);
	readtext = fgets(readfrik);
	boss2_projdamage = stof(readtext);
	readtext = fgets(readfrik);
	boss2_projradius = stof(readtext);
	readtext = fgets(readfrik);
	boss2_projspeed = stof(readtext);
	readtext = fgets(readfrik);
	boss2_stage2transitiontime = stof(readtext);

	fclose(readfrik);
	*/
}


float boss3_health;
float boss3_mutilationahealth;
float boss3_mutilationbhealth;
float boss3_mutilationchealth;
float boss3_pushdamage;
float boss3_regularprojdamage;
float boss3_regularprojsplashradius;
float boss3_regularprojsplashdamage;
float boss3_homingprojdamage;
float boss3_homingprojsplashradius;
float boss3_homingprojsplashdamage;
float boss3_fallennumbera;
float boss3_fallennumberb;
float boss3_fallennumberc;


void check_boss3() {
	boss3_health                  = 6000;   // unmutilated health
	boss3_mutilationahealth       = 8000;   // mutilation 1
	boss3_mutilationbhealth       = 10000;  // mutilation 2
	boss3_mutilationchealth       = 1000;   // stage 3 health
	boss3_pushdamage              = 100;    // push damage (stage 1)
	boss3_regularprojdamage       = 70;     // projectile impact damage
	boss3_regularprojsplashradius = 128;    // projectile splash radius
	boss3_regularprojsplashdamage = 65;     // projectile splash damage
	boss3_homingprojdamage        = 60;     // homing projectile impact damage
	boss3_homingprojsplashradius  = 256;    // homing projectile splash radius
	boss3_homingprojsplashdamage  = 50;     // homing projectile splash damage
	boss3_fallennumbera           = 6;      // max fallen amount for 2 stage (not mutilated)
	boss3_fallennumberb           = 10;     // max fallen amount for 2 stage (mutilated)
	boss3_fallennumberc           = 14;     // max fallen amount for 2 stage (very mutilated)
	/*
	local float readfrik;
	local string readtext;
	readfrik = fopen_wrath("enemies/boss3.txt", FILE_READ);
	readtext = fgets(readfrik);
	boss3_health = stof(readtext);
	readtext = fgets(readfrik);
	boss3_mutilationahealth = stof(readtext);
	readtext = fgets(readfrik);
	boss3_mutilationbhealth = stof(readtext);
	readtext = fgets(readfrik);
	boss3_mutilationchealth = stof(readtext);
	readtext = fgets(readfrik);
	boss3_pushdamage = stof(readtext);
	readtext = fgets(readfrik);
	boss3_regularprojdamage = stof(readtext);
	readtext = fgets(readfrik);
	boss3_regularprojsplashradius = stof(readtext);
	readtext = fgets(readfrik);
	boss3_regularprojsplashdamage = stof(readtext);
	readtext = fgets(readfrik);
	boss3_homingprojdamage = stof(readtext);
	readtext = fgets(readfrik);
	boss3_homingprojsplashradius = stof(readtext);
	readtext = fgets(readfrik);
	boss3_homingprojsplashdamage = stof(readtext);
	readtext = fgets(readfrik);
	boss3_fallennumbera = stof(readtext);
	readtext = fgets(readfrik);
	boss3_fallennumberb = stof(readtext);
	readtext = fgets(readfrik);
	boss3_fallennumberc = stof(readtext);
	fclose(readfrik);
	*/
}


void check_enemies_frik() {
	check_op_vel();
	check_af_vel();
	check_wd_vel();
	check_incisor_vel();
	check_exec_vel();
	check_damg_pain();
	check_invader();
	check_wretch();
	check_incisor();
	check_stricken();
	check_heretic_gibs();
	check_invader_gibs();
	check_stricken_gibs();
	check_wretch_gibs();
	check_afflicted_gibs();
	check_heretic();
	check_fallen2();
	check_widow();
	check_wraith();
	check_symbol();
	check_martyr();
	check_boss1();
	check_boss2();
	check_boss3();
}


/*
void() Precache = {
	local float f;	// file handle, basically assigns a number to whatever file is open
	local string ln;	// ln = line of the file being read
	f = fopen_wrath("system/precache.txt", FILE_READ);	// opens "system/precache.txt" to be read
	if (f != -1)	// if f = -1 then the file could not be found
	{
		ln = fgets(f);	// this line sets ln to the string read from the file with the file handle of f
		while (ln != string_null)	// while there is still text to be read do the following
		{
			if (strstrofs(ln, ".wav", 0) != -1)	// this checks if the file extension is .wav for a sound file
				precache_sound(ln);	// if it is a sound, then it precaches said sound
			if (strstrofs(ln, ".ogg", 0) != -1)	// this checks if the file extension is .wav for a sound file
				precache_sound(ln);	// if it is a sound, then it precaches said sound
			if (strstrofs(ln, ".md3", 0) != -1)	// this checks if the file extension is .wav for a sound file
				precache_model(ln);	// so precache the model
			if (strstrofs(ln, ".mdl", 0) != -1)	// this checks if the file extension is .wav for a sound file
				precache_model(ln);	// so precache the model
			if (strstrofs(ln, ".spr", 0) != -1)	// this checks if the file extension is .wav for a sound file
				precache_model(ln);	// so precache the model
			ln = fgets(f);	// get a new line from the file
		}
	}

	fclose(f);	// when the while loop is over (no lines left in file) close file with the handle f
};
*/
