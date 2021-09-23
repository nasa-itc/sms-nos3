# This example toolchain file describes the cross compiler to use for
# the target architecture indicated in the configuration file.

# Basic cross system configuration
SET(CMAKE_SYSTEM_NAME           Linux)
SET(CMAKE_SYSTEM_VERSION        1)
SET(CMAKE_SYSTEM_PROCESSOR      i386)

# Specify the cross compiler executables
# Typically these would be installed in a home directory or somewhere
# in /opt.  However in this example the system compiler is used.
if(DEFINED ENV{TARGET_CROSS})
  SET(CMAKE_C_COMPILER            "$ENV{TARGET_CROSS}gcc")
  SET(CMAKE_CXX_COMPILER          "$ENV{TARGET_CROSS}g++")
else(NOT DEFINED ENV{TARGET_CROSS})
  SET(CMAKE_C_COMPILER            "/usr/bin/gcc")
  SET(CMAKE_CXX_COMPILER          "/usr/bin/g++")
endif()

# Configure the find commands
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM   NEVER)
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY   NEVER)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE   NEVER)

# These variable settings are specific to cFE/OSAL and determines which 
# abstraction layers are built when using this toolchain
SET(CFE_SYSTEM_PSPNAME      "nos-linux")
SET(OSAL_SYSTEM_BSPNAME     "pc-linux")
SET(OSAL_SYSTEM_OSTYPE      "posix")

# This adds the "-m32" flag to all compile commands
SET(CMAKE_C_FLAGS_INIT "-m32" CACHE STRING "C Flags required by platform")

# Build Specific
add_definitions(-DBYTE_ORDER_LE)
add_definitions(-D_LINUX_OS_)
set(CI_TRANSPORT udp_crypto)
set(TO_TRANSPORT udp_crypto)
