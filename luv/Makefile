all: luv.dll luv.lib

libuv/libuv.lib:
	pushd libuv && vcbuild.bat && copy 

temp:
	mkdir temp

temp/common.o: src/common.c src/common.h temp
	$(CC) -c $< -o $@

temp/luv.o: src/luv.c src/luv.h src/luv_functions.c temp
	$(CC) -c $< -o $@ ${CFLAGS}

luv.dll: temp/luv.o libuv/libuv.lib temp/common.o
	$(CC) ${SHARED_LIB_FLAGS} ${LIBS}

luv.lib: temp/luv.o libuv/libuv.lib temp/common.o
	$(AR)
	$(RANLIB)

clean:
	make -C libuv clean
	rm -rf temp
	rm -f luv.dll
	rm -f luv.lib
