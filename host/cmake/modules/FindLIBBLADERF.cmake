# - Find BLADERF
# Find the native BLADERF includes and library
# This module defines
#  LIBBLADERF_INCLUDE_DIR, where to find rtlsdr.h, etc.
#  LIBBLADERF_LIBRARIES, the libraries needed to use BLADERF.
#  LIBBLADERF_FOUND, If false, do not try to use BLADERF.
# also defined, but not for general use are
#  LIBBLADERF_LIBRARY, where to find the BLADERF library.

#MESSAGE("LIBBLADERF_DIR set to ${LIBBLADERF_DIR}" )

FIND_PATH(LIBBLADERF_INCLUDE_DIR libbladeRF.h
  ${LIBBLADERF_DIR}/include
  /usr/local/include/libbladeRF
)

FIND_LIBRARY(LIBBLADERF_LIBRARY
  NAMES bladeRF
  PATHS ${LIBBLADERF_DIR}/libs
  "${LIBBLADERF_DIR}\\win32\\lib"
  /usr/pkgs64/lib
  /usr/lib64
  /usr/lib
  /usr/local/lib
  NO_DEFAULT_PATH
)

IF (LIBBLADERF_LIBRARY AND LIBBLADERF_INCLUDE_DIR)
  SET(LIBBLADERF_LIBRARIES ${LIBBLADERF_LIBRARY})
  SET(LIBBLADERF_FOUND "YES")
ELSE (LIBBLADERF_LIBRARY AND LIBBLADERF_INCLUDE_DIR)
  SET(LIBBLADERF_FOUND "NO")
ENDIF (LIBBLADERF_LIBRARY AND LIBBLADERF_INCLUDE_DIR)

IF (LIBBLADERF_FOUND)
  IF (NOT LIBBLADERF_FIND_QUIETLY)
    MESSAGE(STATUS "Found BLADERF: ${LIBBLADERF_LIBRARIES}")
  ENDIF (NOT LIBBLADERF_FIND_QUIETLY)
ELSE (LIBBLADERF_FOUND)
  IF (LIBBLADERF_FIND_REQUIRED)
    MESSAGE(FATAL_ERROR "Could not find BLADERF library")
  ENDIF (LIBBLADERF_FIND_REQUIRED)
ENDIF (LIBBLADERF_FOUND)

# Deprecated declarations.
GET_FILENAME_COMPONENT (NATIVE_BLADERF_LIB_PATH ${LIBBLADERF_LIBRARY} PATH)

MARK_AS_ADVANCED(
  LIBBLADERF_LIBRARY
  LIBBLADERF_INCLUDE_DIR
)

