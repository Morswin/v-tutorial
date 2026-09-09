cmake_minimum_required(VERSION 3.20)
project(VulkanLearning CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Wyszukiwanie pakietów
find_package(Vulkan REQUIRED)
find_package(glfw3 REQUIRED)
find_package(glm REQUIRED)

# Automatyczna kompilacja shaderow GLSL do SPIR-V
find_program(GLSLC_EXECUTABLE glslc REQUIRED)

add_custom_command(
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/vert.spv
    COMMAND ${GLSLC_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/shader.vert -o ${CMAKE_CURRENT_BINARY_DIR}/vert.spv
    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/shader.vert
)

add_custom_command(
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/frag.spv
    COMMAND ${GLSLC_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/shader.frag -o ${CMAKE_CURRENT_BINARY_DIR}/frag.spv
    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/shader.frag
)

# Główny plik wykonywalny
add_executable(app main.cpp ${CMAKE_CURRENT_BINARY_DIR}/vert.spv ${CMAKE_CURRENT_BINARY_DIR}/frag.spv)

target_include_directories(app PRIVATE ${CMAKE_CURRENT_BINARY_DIR})
# Linkowanie bibliotek
target_link_libraries(app PRIVATE Vulkan::Vulkan glfw glm::glm)
