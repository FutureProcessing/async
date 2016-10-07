cmake_minimum_required(VERSION 2.8)

add_subdirectory(luv)
add_subdirectory(lhttp_parser)

install(DIRECTORY "async" DESTINATION "${LUADIR}")
