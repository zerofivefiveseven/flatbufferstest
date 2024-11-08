cmake_minimum_required(VERSION 3.28.3)
project(FlatbuffersCompatibility VERSION 0.0.0 DESCRIPTION "app" LANGUAGES CXX)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)
set(CMAKE_CXX_STANDARD 20)
option(OLD OFF)
include(Findflatbuffers)


add_executable(Executable main.cpp)
if(OLD)
    set(VERSION 1.12.0)
    set(SCHEMAS "${CMAKE_CURRENT_SOURCE_DIR}/schemas1.12.0")
    set(SCHEMASALTERNATIVE "${CMAKE_CURRENT_SOURCE_DIR}/schemas24.3.25")
    find_package(flatbuffers 1.12.0 EXACT REQUIRED)
else()
    set(VERSION 24.3.25)
    set(SCHEMAS "${CMAKE_CURRENT_SOURCE_DIR}/schemas24.3.25")
    set(SCHEMASALTERNATIVE "${CMAKE_CURRENT_SOURCE_DIR}/schemas1.12.0")
    find_package(flatbuffers 24.3.25 EXACT REQUIRED)
endif ()
include(flatcfunctions)
compile_flatbuffers_schema_to_cpp(${SCHEMAS}/monster.fbs ${SCHEMAS}/monster.json)




find_package(cxxopts REQUIRED)


target_include_directories(Executable PRIVATE flatbuffers)
target_link_libraries(Executable PRIVATE flatbuffers)
target_include_directories(Executable PRIVATE ${SCHEMAS} ${SCHEMASALTERNATIVE})
add_dependencies(Executable FlatHeaders)

