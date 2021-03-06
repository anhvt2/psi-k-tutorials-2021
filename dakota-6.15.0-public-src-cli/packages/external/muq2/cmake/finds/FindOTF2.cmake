# Module for OTF2
#
# Provides:
# OTF2_LIBRARY    - Files to link against to use OTF2
# OTF2_INCLUDE_DIRS  - Directories to include to use OTF2
# OTF2_FOUND
#
# Pass MUQ_OTF2_DIR as a hint to OTF2 library location
#

FIND_LIBRARY(OTF2_LIBRARY otf2
  PATHS
  /usr/lib
  /usr/local/lib
  ${MUQ_OTF2_DIR}/lib
)

IF(OTF2_LIBRARY)
  GET_FILENAME_COMPONENT(OTF2_INCLUDE_ATTEMPT_DIR_tmp "${OTF2_LIBRARY}" PATH)
  STRING(REGEX REPLACE "lib$" "include" OTF2_INCLUDE_ATTEMPT_DIR "${OTF2_INCLUDE_ATTEMPT_DIR_tmp}")
ENDIF(OTF2_LIBRARY)

# Look for include path
FIND_PATH( OTF2_INCLUDE_DIRS otf2/otf2.h
  PATHS
  ${OTF2_INCLUDE_ATTEMPT_DIR}
  ${MUQ_OTF2_DIR}/include
  /usr/include
  /usr/local/include
)

IF( OTF2_INCLUDE_DIRS )
  IF( OTF2_LIBRARY )
    set(OTF2_LIBRARIES ${OTF2_LIBRARY} )

    SET( OTF2_FOUND 1 )
    SET( OTF2_INCLUDE_DIR ${OTF2_INCLUDE_DIRS} )
    MARK_AS_ADVANCED( OTF2_LIBRARIES )
    MARK_AS_ADVANCED( OTF2_INCLUDE_DIR )
    MARK_AS_ADVANCED( OTF2_INCLUDE_DIRS )
  ENDIF( OTF2_LIBRARY )
ENDIF( OTF2_INCLUDE_DIRS )

