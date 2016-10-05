LUANAME=  $(LUA)

all: lhttp_parser/lhttp_parser.dll luv/luv.dll

lhttp_parser/lhttp_parser.dll:
	$(MAKE) -C lhttp_parser  LUA=$(LUANAME) LUA_BINDIR=$(LUA_BINDIR)  LUA_LIBDIR=$(LUA_LIBDIR)  LUA_INCDIR=$(LUA_INCDIR)

luv/luv.dll: luv/Makefile
	$(MAKE) -C luv  LUA=$(LUANAME)  LUA_BINDIR=$(LUA_BINDIR)  LUA_LIBDIR=$(LUA_LIBDIR)  LUA_INCDIR=$(LUA_INCDIR)

clean:
	$(MAKE) -C lhttp_parser clean
	$(MAKE) -C luv clean
