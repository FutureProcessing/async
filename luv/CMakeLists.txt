cmake_minimum_required(VERSION 2.8)

add_subdirectory(libuv)

include_directories("${LUA_INCDIR}" "libuv/include")
link_directories("${LUA_LIBDIR}")

add_library(luv SHARED src/luv.c src/common.c)

# not sure if right way, but add DLL_EXPORT correctly
add_definitions(/DLUA_LIB)

# "ws2_32.lib", as shown here:
# http://blog.yastrebkov.com/2010/08/unresolved-externals-while-linking.html
# rest of libs:
# https://github.com/joyent/libuv/issues/1089

target_link_libraries(luv libuv ${LUALIB}
    "advapi32.lib"
    "iphlpapi.lib"
    "psapi.lib"
    "shell32.lib"
    "ws2_32.lib"
)

install(TARGETS luv
    LIBRARY DESTINATION ${LUA_LIBDIR}
    RUNTIME DESTINATION ${LUA_LIBDIR}
)
