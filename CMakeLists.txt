cmake_minimum_required(VERSION 2.8)

add_subdirectory(luv)
add_subdirectory(lhttp_parser)

include_directories("${LUA_INCDIR}")
link_directories("${LUA_LIBDIR}")

install(DIRECTORY "async" DESTINATION "${LUADIR}")
