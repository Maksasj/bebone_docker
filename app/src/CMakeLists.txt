file(GLOB_RECURSE APP_SOURCE_CODE *.cpp)

include_directories("./")
include_directories("../3dparty/bebone/src")

include_directories("../3dparty/bebone/3dparty/glad/include")
include_directories("../3dparty/bebone/3dparty/glfw/include")
include_directories("../3dparty/bebone/3dparty/Vulkan-Headers/include")
include_directories("../3dparty/bebone/3dparty/omni_types/src")
include_directories("../3dparty/bebone/3dparty/stb")
include_directories("../3dparty/bebone/3dparty/imgui")

add_executable(App ${APP_SOURCE_CODE})
target_link_libraries(App bebone)