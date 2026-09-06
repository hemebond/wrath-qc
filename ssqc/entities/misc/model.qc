// This file is only here to give us the entity definition
/*FGD
@PointClass
	color(.8 .6 .3)
	size(-16 -16 -16, 16 16 16)
	model({"path": model})
= misc_model : "Generic placeholder for inserting MD3 models in game. Requires compilation of map geometry to be added to level. If the map is compiled with Q3Map2, then ASE, 3DS, OBJ and other model formats are supported." [
	// -------- Q3MAP2 KEYS --------
	model(string) : "Model File" : : "Path/name of model to use (e.g. models/mapobjects/teleporter/teleporter.md3)."
	angle(float) : "Yaw Angle" : : "Direction in which model will be oriented."
	angles(vector) : "Pitch Yaw Roll" : "0 0 0" : "Individual control of PITCH, YAW, and ROLL (default 0 0 0)."
	modelscale(float) : "Uniform Scale" : "1" : "Floating-point value used to scale a model up or down (default 1.0)."
	modelscale_vec(float) : "Scale XYZ" : "1 1 1" : "Floating-point vector used to scale a model's axes individually (default 1.0 1.0 1.0)."
	_remap(array) : "Shader Remaps" : : "Used to remap textures/shaders in the model. To remap all shaders to a given shader, use `*;models/mymodel/mytexture`. To remap a specific shader, use `models/mymodel/old;models/mymodel/new`."
	target(target_destination) : "Target" : : "Used to attach the misc_model to a brush entity, where its `targetname` key is the same value."
	_lightmapscale(float) : "Lightmap Scale" : "1" : "Floating point value scales the resolution of lightmaps on this model (if model is using lightmapped shaders) (default 1.0)."
	_castshadows(integer) : "Shadow Caster Level" : 1 : "Allows per-entity control over shadow casting. Defaults to 0 on entities, 1 on world. 0 = no shadow casting. 1 = cast shadows on world. &gt; 1 = cast shadows on entities with _rs (or _receiveshadows) with the corresponding value, AND world. Negative values imply same, but DO NOT cast shadows on world."
	_receiveshadows(integer) : "Shadow Reciever Level" : 1 : "Allows per-entity control over shadow reception. Defaults to 1 on everything (world shadows). 0 = receives NO shadows. &gt; 1 = receive shadows only from corresponding keyed entities (see above) and world. &lt; 1 = receive shadows ONLY from corresponding keyed entities."
	_celshader(texture) : "Cel Shader" : : "Sets the cel shader used for this geometry. Note: Omit the `textures/` prefix."
	_clipdepth(float) : "Autoclip thickness" : "2" : "Autoclip brushes thickness (default 2.0)."

	spawnflags(flags) = [
	1 : "_RMG_BSP" : 0 : "in SoF2, append a _RMG_BSP suffix to shader names instead of _BSP"
	2 : "Clip Model" : 0 : "Clips the model for player/weapon collisions; extruding every face along most perpendicular axial direction. For use on large architectural or terrain models, not for small decorative models."
	4 : "Force Meta" : 0 : "Toggles on q3map_forceMeta for lightmapped models. Converts model triangles to bsp metasurfaces."
	8 : "EXTRUDE_FACE_NORMALS" : 0 : "extrude along the model face normals for clipping"
	16 : "EXTRUDE_TERRAIN" : 0 : "extrude each surface of the model along its average axial direction ( up/down/west/east/north/south ); faces with not matching direction (or too steep) are clipped in default mode"
	32 : "COLOR_TO_ALPHA" : 0 : "use the color value as alpha (for terrain blending)"
	64 : "NOSMOOTH" : 0 : "Don't smooth normals when importing (forces all faces planar)."
	128 : "EXTRUDE_VERTEX_NORMALS" : 0 : "extrude along the model vertex normals for clipping; accurate collisions, if normals are fine; bad ones are replaced with 45 degrees to face"
	256 : "PYRAMIDAL_CLIP" : 0 : "pyramidal clipping brushes (4-sided); accurate collisions"
	512 : "EXTRUDE_DOWNWARDS" : 0 : "for horizontal terrain; when not possible, extrude in default mode"
	1024 : "EXTRUDE_UPWARDS" : 0 : "-//-"
	2048 : "MAX_EXTRUDE" : 0 : "Extrude to the max/min point of every model surface to reduce bsp size (uses axial back plane)"
	4096 : "AXIAL_BACKPLANE" : 0 : "use axial back plane for clipping brushes to effectively reduce bsp size; might cause unwanted collisions, make sure to -debugclip; negative _clipdepth / -clipdepth limits max thickness of resulting brushes (making non-axial backplane, if hit the limit)"
	]

	//other possible modes of clipping:
	//CLIPMODEL+AXIAL_BACKPLANE
	//EXTRUDE_FACE_NORMALS+PYRAMIDAL_CLIP - truncated pyramid with 45 degrees sides
	//EXTRUDE_TERRAIN+MAX_EXTRUDE
	//EXTRUDE_TERRAIN+AXIAL_BACKPLANE
	//EXTRUDE_VERTEX_NORMALS + PYRAMIDAL_CLIP - vertex normals mode: don't check for sides, sticking outwards
	//PYRAMIDAL_CLIP+AXIAL_BACKPLANE - pyramid with 3 of 4 sides axial (->small bsp)
	//EXTRUDE_DOWNWARDS+EXTRUDE_UPWARDS
	//EXTRUDE_DOWNWARDS+MAX_EXTRUDE
	//EXTRUDE_DOWNWARDS+AXIAL_BACKPLANE
	//EXTRUDE_DOWNWARDS+EXTRUDE_UPWARDS+MAX_EXTRUDE
	//EXTRUDE_DOWNWARDS+EXTRUDE_UPWARDS+AXIAL_BACKPLANE
	//EXTRUDE_UPWARDS+MAX_EXTRUDE
	//EXTRUDE_UPWARDS+AXIAL_BACKPLANE
]
*/
