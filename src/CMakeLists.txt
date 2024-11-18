add_executable(Executable main.cpp)
list(APPEND CMAKE_PREFIX_PATH ${CMAKE_BINARY_DIR}/${CMAKE_BUILD_TYPE}/generators)

find_package(cxxopts CONFIG REQUIRED)
find_package(flatbuffers REQUIRED)

target_link_libraries(Executable PRIVATE HeaderOnly)
target_include_directories(Executable PRIVATE ${cxxopts_INCLUDE_DIRS} ${flatbuffers_INCLUDE_DIR})
target_link_libraries(Executable PRIVATE flatbuffers::flatbuffers)
message("Flatbuffers version: " ${flatbuffers_VERSION})