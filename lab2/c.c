#include <stdio.h>

int main()
{
    
    unsigned char mass[10] = {45, 3, 44, 123, 90, 1, 253, 1, 189, 65};
    
    int sum = 0;

    
    for (int i = 0; i < 10; i++)
    {
        
        if (i % 2 != 0)
                        mass[i] = mass[i] | 0b00010000;
        else
            mass[i] = mass[i] & 0b11011111;

        
        sum += mass[i];
    }

    
    printf("Sum = %d\n", sum);

    return 0;
}

