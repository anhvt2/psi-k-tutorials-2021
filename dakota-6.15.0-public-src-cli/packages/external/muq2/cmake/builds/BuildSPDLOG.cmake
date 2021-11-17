include(ExternalProject)
if(NOT SPDLOG_EXTERNAL_SOURCE)
	set(SPDLOG_EXTERNAL_SOURCE ${CMAKE_CURRENT_SOURCE_DIR}/external/spdlog-v1.x.zip)
endif()

set(SPDLOG_INSTALL_DIR ${CMAKE_INSTALL_PREFIX}/muq_external)

ExternalProject_Add(
	SPDLOG
                PREFIX ${CMAKE_CURRENT_BINARY_DIR}/external/spdlog
                URL ${SPDLOG_EXTERNAL_SOURCE}
                CMAKE_ARGS -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER} -DCMAKE_INSTALL_PREFIX=${SPDLOG_INSTALL_DIR} -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_POSITION_INDEPENDENT_CODE=ON
)

set(SPDLOG_LIBRARIES ${SPDLOG_INSTALL_DIR}/lib/${CMAKE_STATIC_LIBRARY_PREFIX}spdlog${CMAKE_STATIC_LIBRARY_SUFFIX})
set(SPDLOG_LIBRARY ${SPDLOG_LIBRARIES})

set(SPDLOG_INCLUDE_DIRS ${SPDLOG_INSTALL_DIR}/include)
message(STATUS "Adding ${SPDLOG_INCLUDE_DIRS} for an SPDLOG include directory.")

set(MUQ_HAS_SPDLOG 1)
