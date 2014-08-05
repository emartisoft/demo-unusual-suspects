.prl.gst:
	sc NOLINK CODE=F DATA=F OPTI MGST $*.gst $*.prl

.c.o:
	sc NOLINK CODE=F DATA=F OPTI TO $@ $*.c

OBJ = main.o init.o 3d_routines.o bitmap_routines.o copper_routines.o font_routines.o \
		Assets/cosine_table.o Assets/object_cube.o Assets/object_amiga.o Assets/object_face_00.o Assets/object_spiroid.o \
		Assets/object_fish.o \
		demo_strings.o Assets/fonts.o Assets/audio_sync.o\
		Assets/misc_palettes.o Assets/faces_palettes.o Assets/faces_all_palettes.o

thanks-andy: $(OBJ) includes.gst
	sc LINK CODE=F DATA=F OBJ $(OBJ) TO unusual-suspects.exe

includes.gst: includes.prl
main.o: main.c common.h protos.h 3d_routines.h copper_routines.h bitmap_routines.h \
	Assets/cosine_table.h Assets/object_amiga.h Assets/object_fish.h \
	Assets/misc_palettes.h Assets/faces_palettes.h \
	Assets/faces_all_palettes.h Assets/fonts.h Assets/audio_sync.h demo_strings.h includes.gst
init.o: init.c common.h protos.h includes.gst
3d_routines.o: 3d_routines.c common.h protos.h includes.gst
bitmap_routines.o: bitmap_routines.c common.h protos.h includes.gst
copper_routines.o: copper_routines.c common.h protos.h includes.gst
font_routines.o: font_routines.c common.h protos.h includes.gst
cosine_table.o: Assets/cosine_table.c
object_cube.o: Assets/object_cube.c
object_amiga.o: Assets/object_amiga.c
object_face_00.o: Assets/object_face_00.c
object_spiroid.o: Assets/object_spiroid.c
object_fish.o: Assets/object_fish.c
misc_palettes.o: Assets/misc_palettes.c
faces_palettes.o: Assets/faces_palettes.c
faces_all_palettes.o: Assets/faces_all_palettes.c
fonts.o: Assets/fonts.c
audio_sync.o: Assets/audio_sync.c	
demo_strings.o: demo_strings.c

