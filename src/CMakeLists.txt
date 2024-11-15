add_executable(Executable main.cpp)

find_package(cxxopts CONFIG REQUIRED)
find_package(flatbuffers REQUIRED)

target_include_directories(Executable PRIVATE ${cxxopts_INCLUDE_DIRS} ${flatbuffers_INCLUDE_DIR})
target_link_libraries(Executable flatbuffers::flatbuffers)
if (flatbuffers VERSION_LESS "24.3.25")
    target_include_directories(Executable PUBLIC ${CMAKE_SOURCE_DIR}/include1.12.0)
else ()
    target_include_directories(Executable PUBLIC ${CMAKE_SOURCE_DIR}/include24.3.25)
endif ()
message("Using flatbufers header compatible with version: " ${flatbuffers_VERSION})



