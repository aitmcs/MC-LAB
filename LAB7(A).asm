#include <stdint.h>

void bubbleSort(uint32_t *array, uint32_t n);

int main(void)
{
    uint32_t numbers[] = {7, 15, 1, 4, 2, 8};
    uint32_t n = sizeof(numbers) / sizeof(numbers[0]);

    bubbleSort(numbers, n);

    while(1);

    return 0;
}

void bubbleSort(uint32_t *array, uint32_t n)
{
    uint32_t i, j;

    for(i = 0; i < n - 1; i++)
    {
        for(j = 0; j < n - i - 1; j++)
        {
            if(array[j] > array[j + 1])
            {
                uint32_t temp = array[j];
                array[j]      = array[j + 1];
                array[j + 1]  = temp;
            }
        }
    }
}
