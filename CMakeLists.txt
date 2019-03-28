cmake_minimum_required (VERSION 2.6)
project (MINI)

set( CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} -std=c++14" )
set(CMAKE_BUILD_TYPE Debug)

add_custom_command (
  OUTPUT lexer.cpp
  COMMAND flex -o lexer.cpp ${PROJECT_SOURCE_DIR}/lexer.l
  MAIN_DEPENDENCY ${PROJECT_SOURCE_DIR}/lexer.l
  COMMENT "Generating lexer"
)

add_custom_command (
  OUTPUT parser.cpp parser.hpp
  COMMAND bison -d -o parser.cpp ${PROJECT_SOURCE_DIR}/parser.y
  MAIN_DEPENDENCY ${PROJECT_SOURCE_DIR}/parser.y
  COMMENT "Generating parser"
)

include_directories(${CMAKE_CURRENT_BINARY_DIR})
include_directories(${PROJECT_SOURCE_DIR})

add_executable(${PROJECT_NAME} main.cpp lexer.cpp parser.cpp)