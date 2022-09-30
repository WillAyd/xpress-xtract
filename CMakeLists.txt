cmake_minimum_required(VERSION 3.20)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED True)

project(pbix-xtract)

if(WIN32)
  if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE
        Release
        CACHE STRING "Build type" FORCE)
  endif()
  find_package(Python3 REQUIRED COMPONENTS Interpreter Development)
  set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELEASE "")
  link_directories(${Python3_LIBRARY_DIRS})
else()
  # we only choose Development.Module to support virtual environments where
  # libpython may not be available see
  # https://github.com/pypa/manylinux/issues/484
  find_package(Python3 REQUIRED COMPONENTS Interpreter Development.Module)
endif()

include(ExternalProject)
ExternalProject_Add(wimlib
  GIT_REPOSITORY git://wimlib.net/wimlib
  BUILD_IN_SOURCE 1
  CONFIGURE_COMMAND ./bootstrap COMMAND ./configure
  )

add_executable(xdecompress ${CMAKE_SOURCE_DIR}/xdecompress.c)
