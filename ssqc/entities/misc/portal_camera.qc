/*FGD
@PointClass
	color(1 .5 .25)
	size(-8 -8 -8, 8 8 8)
= misc_portal_surface : "Portal surface indicator. This will `lock on` the brush face closest to it and identify as a portal. The view displayed on the portal surface is the view of the misc_portal_camera that this entity targets. Also used for mirrors (see notes)." [
	target(target_destination) : "Target" : : "Point this to a misc_portal_camera that `sees` the view you want to display on the portal."
	//-------- NOTES --------
	//The entity must be no farther than 64 units away from the portal surface to lock onto it. To make a mirror, apply the common/mirror shader to the surface, place this entity near it but don't target a misc_portal_camera.
]
*/
