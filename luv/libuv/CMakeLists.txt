cmake_minimum_required(VERSION 2.8.8 FATAL_ERROR)
cmake_policy(VERSION 2.8.8)
project(run-benchmarks)
set(configuration "Release")
enable_language(ASM)
set(builddir "${CMAKE_CURRENT_BINARY_DIR}")
set(obj "${builddir}/obj")

set(CMAKE_C_OUTPUT_EXTENSION_REPLACE 1)
set(CMAKE_CXX_OUTPUT_EXTENSION_REPLACE 1)

set(CMAKE_NINJA_FORCE_RESPONSE_FILE 1)


#D:\async\luv\libuv\uv.gyp:uv_dtrace_provider#target
set(TARGET "uv_dtrace_provider")
set(TOOLSET "target")
add_custom_target(uv_dtrace_provider SOURCES)
set_target_properties(uv_dtrace_provider PROPERTIES EXCLUDE_FROM_ALL "FALSE")
unset(TOOLSET)
unset(TARGET)

#D:\async\luv\libuv\uv.gyp:uv_dtrace_header#target
set(TARGET "uv_dtrace_header")
set(TOOLSET "target")
add_custom_target(uv_dtrace_header SOURCES)
set_target_properties(uv_dtrace_header PROPERTIES EXCLUDE_FROM_ALL "FALSE")
unset(TOOLSET)
unset(TARGET)

#D:\async\luv\libuv\uv.gyp:libuv#target
set(TARGET "libuv")
set(TOOLSET "target")
list(APPEND libuv__c_srcs
  "src/fs-poll.c"
  "src/inet.c"
  "src/uv-common.c"
  "src/version.c"
  "src/win/async.c"
  "src/win/core.c"
  "src/win/dl.c"
  "src/win/error.c"
  "src/win/fs.c"
  "src/win/fs-event.c"
  "src/win/getaddrinfo.c"
  "src/win/handle.c"
  "src/win/loop-watcher.c"
  "src/win/pipe.c"
  "src/win/thread.c"
  "src/win/poll.c"
  "src/win/process.c"
  "src/win/process-stdio.c"
  "src/win/req.c"
  "src/win/signal.c"
  "src/win/stream.c"
  "src/win/tcp.c"
  "src/win/tty.c"
  "src/win/threadpool.c"
  "src/win/timer.c"
  "src/win/udp.c"
  "src/win/util.c"
  "src/win/winapi.c"
  "src/win/winsock.c")
list(APPEND libuv__other_srcs
  "common.gypi"
  "include/uv.h"
  "include/uv-private/ngx-queue.h"
  "include/uv-private/tree.h"
  "src/uv-common.h"
  "include/uv-private/uv-win.h"
  "src/win/atomicops-inl.h"
  "src/win/handle-inl.h"
  "src/win/internal.h"
  "src/win/req-inl.h"
  "src/win/stream-inl.h"
  "src/win/winapi.h"
  "src/win/winsock.h")
add_library(libuv STATIC ${libuv__c_srcs} ${libuv__other_srcs})
set_target_properties(libuv PROPERTIES EXCLUDE_FROM_ALL "FALSE")
set_source_files_properties(${libuv__other_srcs} PROPERTIES HEADER_FILE_ONLY "TRUE")
set_target_properties(libuv PROPERTIES ARCHIVE_OUTPUT_DIRECTORY "${obj}.${TOOLSET}/")
set_target_properties(libuv PROPERTIES PREFIX "lib")
set_target_properties(libuv PROPERTIES ARCHIVE_OUTPUT_NAME "uv")
set_target_properties(libuv PROPERTIES SUFFIX ".lib")
set_source_files_properties(${obj}.${TOOLSET}/libuv.lib PROPERTIES GENERATED "TRUE")
list(APPEND libuv__include_dirs
  "${CMAKE_CURRENT_LIST_DIR}/include"
  "${CMAKE_CURRENT_LIST_DIR}/include/uv-private"
  "${CMAKE_CURRENT_LIST_DIR}/src")
set_property(TARGET libuv APPEND PROPERTY INCLUDE_DIRECTORIES ${libuv__include_dirs})
set_target_properties(libuv PROPERTIES COMPILE_DEFINITIONS "WIN32;_CRT_SECURE_NO_DEPRECATE;_CRT_NONSTDC_NO_DEPRECATE;HAVE_CONFIG_H;_WIN32_WINNT=0x0600;_GNU_SOURCE;NDEBUG;")
set_target_properties(libuv PROPERTIES COMPILE_FLAGS "/Gy /Oy")
unset(TOOLSET)
unset(TARGET)
