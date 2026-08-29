```shell
q3map2 -bsp -fs_basepath ${GAME_DIR_PATH} -fs_basegame kp1 -fs_game ${MODS[-1]} -v -samplesize 16 -meta -custinfoparms ${MAP_BASE_NAME}-compile.map

q3map2 -vis -fs_basepath ${GAME_DIR_PATH} -fs_basegame kp1 -fs_game ${MODS[-1]} -v -saveprt ${MAP_BASE_NAME}-compile.map

q3map2 -light -fs_basepath ${GAME_DIR_PATH} -fs_basegame kp1 -fs_game ${MODS[-1]} -fast -trianglecheck -lightmapsize 1024 -bounce 3 -bouncescale 8 -bouncegrid -gamma 1.7 -saturation 1 -pointscale 2.5 -dirty -dirtscale 2.5 -samples 4 -shade ${MAP_BASE_NAME}-compile.map
```
