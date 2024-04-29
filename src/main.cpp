#include "bebone/bebone.h"

using namespace bebone::gfx;
using namespace bebone::gfx::opengl;

int main() {
    GLFWContext::init();
    
    auto window = WindowFactory::create_window("Example", 800, 600, GfxAPI::OPENGL);

    GLContext::load_opengl();
    GLContext::set_viewport(0, 0, 800, 600);

    while (!window->closing()) {
        GLContext::clear_color(0.2f, 0.2f, 0.2f, 1.0f);
        GLContext::clear(GL_COLOR_BUFFER_BIT);

        // Your game code

        GLFWContext::swap_buffers(*window);
        GLFWContext::poll_events();
        window->execute_input_actions();
    }

    GLFWContext::terminate();
    return 0;
}
