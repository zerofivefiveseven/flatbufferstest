add_library(HeaderOnly INTERFACE)

target_include_directories(HeaderOnly INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})
target_sources(HeaderOnly INTERFACE "monster_generated.h")
