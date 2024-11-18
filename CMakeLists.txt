cmake_minimum_required(VERSION 3.28.3)
project(FB_CMP_PR VERSION 0.0.0 LANGUAGES CXX)

message(STATUS "Cmake path to prefix: ${CMAKE_PREFIX_PATH}")
message(STATUS "Build directory: ${CMAKE_BINARY_DIR}")
message(STATUS "Value of OLD variable: ${OLD}")

if (OLD)
    add_subdirectory(include1.12.0)
else ()
    add_subdirectory(include24.3.25)
endif ()

add_subdirectory(src)
