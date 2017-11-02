include(database_plugin_cockroachdb_structs.cmake)

install(
  FILES
  ${CMAKE_SOURCE_DIR}/include/irods_database_plugin_cockroachdb_constants.hpp
  DESTINATION usr/include/irods
)






