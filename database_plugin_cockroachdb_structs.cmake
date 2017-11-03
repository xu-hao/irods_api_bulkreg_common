set(
    REQ_AVRO_FILE
  irods_database_plugin_cockroachdb_structs
)

file(MAKE_DIRECTORY "${CMAKE_BINARY_DIR}/include")

add_custom_command(
    OUTPUT ${CMAKE_BINARY_DIR}/include/${REQ_AVRO_FILE}.hpp
    COMMAND ${IRODS_EXTERNALS_FULLPATH_AVRO}/bin/avrogencpp -n irods -o ${CMAKE_BINARY_DIR}/include/${REQ_AVRO_FILE}.hpp -i ${CMAKE_SOURCE_DIR}/avro_schemas/${REQ_AVRO_FILE}.json
    MAIN_DEPENDENCY ${CMAKE_SOURCE_DIR}/avro_schemas/${REQ_AVRO_FILE}.json
)

add_custom_target(
    structs 
    ALL
    DEPENDS ${CMAKE_BINARY_DIR}/include/${REQ_AVRO_FILE}.hpp
)
install(
  FILES
  ${CMAKE_BINARY_DIR}/include/${REQ_AVRO_FILE}.hpp
  DESTINATION usr/include/irods
)

install(
  FILES
  ${CMAKE_SOURCE_DIR}/avro_schemas/${REQ_AVRO_FILE}.json
  DESTINATION ${IRODS_HOME_DIRECTORY}/avro_schemas
)

