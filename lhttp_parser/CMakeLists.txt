cmake_minimum_required(VERSION 2.8)

include_directories("${LUA_INCDIR}" "http-parser")
link_directories("${LUA_LIBDIR}")
add_definitions(/DLUA_LIB)

add_library(lhttp_parser SHARED lhttp_parser.c http-parser/http_parser.c)

target_link_libraries(lhttp_parser ${LUALIB})

install(TARGETS lhttp_parser
    LIBRARY DESTINATION ${LUA_LIBDIR}
    RUNTIME DESTINATION ${LUA_LIBDIR}
)
