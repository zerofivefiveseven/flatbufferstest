cmake_minimum_required(VERSION 3.28.3)
set(CMAKE_CXX_STANDARD 17)
project(FB_CMP_PR VERSION 0.0.0 LANGUAGES CXX)

message(CmakePathToPrefix: " ${CMAKE_PREFIX_PATH}")
message(Build directory: " ${CMAKE_BINARY_DIR}")
message(Current cmake directory: " ${CMAKE_CURRENT_SOURCE_DIR}")
message(current build directory: " ${CMAKE_CURRENT_BINARY_DIR}")

add_subdirectory(src)
