#include <stdint.h>

uint32_t factorial(uint32_t n);

int main(void)
{
    uint32_t num    = 5;
    uint32_t result = factorial(num);

    while(1);

    return 0;
}

uint32_t factorial(uint32_t n)
{
    if(n == 0 || n == 1)
    {
        return 1;
    }
    else
    {
        return n * factorial(n - 1);
    }
}
