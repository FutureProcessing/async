package = "async"
version = "scm-1"

source = {
   url = "git://github.com/FutureProcessing/async",
   dir = "async"
}

description = {
   summary = "An async framework for Torch (based on LibUV)",
   detailed = [[
Async framework for Torch, based on LibUV.
   ]],
   homepage = "https://github.com/clementfarabet/async",
   license = "BSD"
}

dependencies = {
   "torch >= 7.1.alpha",
   "lua-cjson >= 0.1"
}

build = {
   type = "command",
   build_command = "cmake -E make_directory build && cd build && cmake .. -DCMAKE_BUILD_TYPE=Release -DLUA=$(LUA) -DLUALIB=$(LUALIB) -DLUA_BINDIR="$(LUA_BINDIR)" -DLUA_INCDIR="$(LUA_INCDIR)" -DLUA_LIBDIR="$(LUA_LIBDIR)" -DLUADIR="$(LUADIR)" -DLIBDIR="$(LIBDIR)" -DCMAKE_INSTALL_PREFIX="$(PREFIX)" && $(MAKE)",
   install_command = "cd build && $(MAKE) install"
}
