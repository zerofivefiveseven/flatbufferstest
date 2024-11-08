function(compile_flatbuffers_schema_to_cpp SRC_FBS)
    find_program(FLATBUFFERS_FLATC_EXECUTABLE NAMES flatc)
    get_filename_component(SRC_FBS_DIR ${SRC_FBS} PATH)
    string(REGEX REPLACE "\\.fbs$" "${VERSION}.h" GEN_HEADER ${SRC_FBS})
    message(STATUS "filepath ${CMAKE_CURRENT_SOURCE_DIR}/${SRC_FBS}")
    message(STATUS "output dir is ${SRC_FBS_DIR}")
#    add_custom_command(
#            OUTPUT ${GEN_HEADER}
#            COMMAND flatc --cpp ${SRC_FBS} --filename-suffix "_generated${VERSION}"
#            DEPENDS flatc
#            WORKING_DIRECTORY ${SRC_FBS_DIR})
##    string(REGEX MATCHALL "\\.json" GEN_SCHEMAS ${SRC_FBS})

    file(GLOB GEN_SCHEMAS
            "${SRC_FBS_DIR}/*.json"
    )
    string(REGEX REPLACE "\\.fbs$" ".${VERSION}bin" GEN_BIN ${SRC_FBS})
    add_custom_command(
            OUTPUT ${GEN_BIN}
            COMMAND flatc -o ${SRC_FBS_DIR} --cpp -b ${SRC_FBS} ${GEN_SCHEMAS} --filename-suffix ${VERSION}
            DEPENDS ${GEN_HEADER}
            WORKING_DIRECTORY ${SRC_FBS_DIR})

    add_custom_target(
            FlatHeaders
            DEPENDS ${GEN_HEADER} ${GEN_BIN} ${SRC_FBS} ${GEN_SCHEMAS}
    )
    add_custom_command(
            TARGET FlatHeaders POST_BUILD  # This command runs after 'my_executable' is built
            COMMAND ${CMAKE_COMMAND} -E copy
            ${SRC_FBS_DIR}/monster.bin ${SRC_FBS_DIR}/monster${VERSION}.bin  # Rename from OLD_FILE to NEW_FILE
            COMMENT "Renaming old_filename.txt to new_filename.txt"
    )
#    configure_file(${GEN_BIN} ${CMAKE_BINARY_DIR} COPYONLY)

endfunction()