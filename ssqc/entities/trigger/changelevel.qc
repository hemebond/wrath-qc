/*FGD
@SolidClass
	color(0.5 0.0 0.5)
= trigger_changelevel : "trigger that will move from one map to the next." [
	map(string) : "Next Map" : "" : "name of the next map, dont use `.bsp` extension"
	location(integer) : "Location place" : 0 : "Location place number identifier related to the next map info_player_start."
]
*/
void trigger_changelevel() {
	if (!self.map)
		objerror("changelevel trigger doesn't have map");
	InitTrigger();
	self.wait = 0;
	self.touch = changelevel_touch;
}
