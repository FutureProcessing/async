cmake_minimum_required(VERSION 2.8)

add_subdirectory(libuv)

add_library(luv SHARED src/common.c src/luv_functions.c)
target_link_libraries(luv libuv)
