add_executable(Executable main.cpp)

find_package(cxxopts CONFIG REQUIRED)
find_package(flatbuffers CONFIG REQUIRED)
target_include_directories(Executable PRIVATE ${CMAKE_SOURCE_DIR}/schemas1.12.0)
target_include_directories(Executable PRIVATE ${cxxopts_INCLUDE_DIRS} ${flatbuffers_INCLUDE_DIR})

target_link_libraries(Executable flatbuffers::flatbuffers)

message(current build directory2: " ${CMAKE_CURRENT_BINARY_DIR}")

