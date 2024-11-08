option(FLATBUFFERS_BUILD_TESTS "Enable the build of tests and samples." OFF)
option(FLATBUFFERS_BUILD_FLATC "Enable the build of the flatbuffers compiler"
        ON)
option(FLATBUFFERS_STATIC_FLATC "Build flatbuffers compiler with -static flag"
        OFF)
option(FLATBUFFERS_BUILD_FLATHASH "Enable the build of flathash" OFF)
include(FetchContent)
if(OLD)
FetchContent_Declare(
        flatbuffers
        GIT_REPOSITORY https://github.com/google/flatbuffers.git
        GIT_TAG v24.3.25
        GIT_PROGRESS TRUE
)
else ()
FetchContent_Declare(
        flatbuffers
        GIT_REPOSITORY https://github.com/google/flatbuffers.git
        GIT_TAG v1.12.0
        GIT_PROGRESS TRUE
)
endif()

FetchContent_MakeAvailable(flatbuffers)

