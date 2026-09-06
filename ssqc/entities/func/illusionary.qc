/*FGD
@SolidClass
	color(0 .5 .8)
= func_illusionary : "A simple entity that looks solid but lets you walk through it. Does not block light." [
	spawnflags(flags) = [
		1 : "Start invisible" : 0 : "When set, the brush will spawn invisible."
		2 : "Dynamic model light" : 0 : "Force dynamic model light on the entity, even if it's a BSP model (or anything else with lightmaps or light colors)."
	]
	targetname(target_source) : "Target Name" : "" : "If set, a func_button or trigger is required to toggle the visibility of the func_illusionary."
	type(boolean) : "Double-sided" : 0 : "Set to 1 to make the model double-sided."
	wait(float) : "Wait" : 0 : "Only when starting invisible. Will fade out after this amount of time."
]
*/
// FIXME: Behaviour is broken. Once turned off it stays off.
void func_illusionary() {
	setmodel(self, self.model);

	if (self.type == 2)
		makestatic(self);

	if (self.type == 1)
		self.effects += EF_DOUBLESIDED;

	if (self.spawnflags & 1)
		self.effects += EF_NODRAW;

	if (self.spawnflags & 2)
		self.effects += EF_DYNAMICMODELLIGHT;

	self.use = func_illusionary_use;
}


void func_illusionary_use() {
	if (self.effects & EF_NODRAW) {
		if (self.velocity)
			self.movetype = MOVETYPE_NOCLIP;

		self.effects -= EF_NODRAW;

		if (self.wait > 0) {
			self.think  =  alphafade;
			self.nextthink = time + self.wait;
		}
	}
	else {
		self.effects += EF_NODRAW;
		self.alpha = -1;
	}
}
