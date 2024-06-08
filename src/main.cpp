#include <iostream>

#include "Freeze.h"

int main()
{
    ns::Matrix<int, 3, 3> A = { 
        { 1, 2, 3 },
        { 4, 5, 6 },
        { 7, 8, 9 }
    };
    std::cout << A << std::endl << std::endl;

    ns::Matrix<int, 3, 3> B = A + 5;
    std::cout << B << std::endl;

    // Window window ("Adventure Game", { 640, 480 });
    // window.initialize();

    // window.setAspectRatio({ 16, 9 });

    // while (window.update())
    // {

    // }

    // window.shutdown();

    return 0;
}
