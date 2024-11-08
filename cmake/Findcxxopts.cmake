# - Try to find cxxopts
# Once done this will define
#  CXXOPTS_FOUND - System has cxxopts
#  CXXOPTS_INCLUDE_DIRS - The cxxopts include directories
include(FetchContent)
FETCHCONTENT_DECLARE(
		cxxopts
		GIT_REPOSITORY https://github.com/jarro2783/cxxopts.git
		GIT_PROGRESS TRUE
)
FetchContent_MakeAvailable(cxxopts)
find_path(CXXOPTS_INCLUDE_DIR cxxopts.hpp
	${CMAKE_CURRENT_BINARY_DIR}/_deps/cxxopts-src/include )
message(${CMAKE_CURRENT_BINARY_DIR})
message(${CXXOPTS_INCLUDE_DIR})

set(CXXOPTS_INCLUDE_DIRS ${CXXOPTS_INCLUDE_DIR} )

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(cxxopts DEFAULT_MSG
                                  CXXOPTS_INCLUDE_DIR)

mark_as_advanced(CXXOPTS_INCLUDE_DIR)