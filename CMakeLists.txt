cmake_minimum_required(VERSION 3.28.3)
project(FlatbuffersCompatibility VERSION 0.0.0 DESCRIPTION "app" LANGUAGES CXX)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)
set(CMAKE_CXX_STANDARD 20)
option(OLD OFF)

add_executable(Executable main.cpp
        main.cpp)
