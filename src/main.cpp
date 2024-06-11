#include <iostream>

#include "Freeze/Freeze.h"
#include "Freeze/Triangle.h"

int main()
{
    ns::Window window ("Adventure Game", { 640, 480 });
    window.initialize();

    window.setAspectRatio({ 16, 9 });

    ns::Triangle tri;

    while (window.isOpen())
    {
        window.processInput();
        window.update();

        tri.draw();
    }

    window.shutdown();

    return 0;
}
