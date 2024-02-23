#include <stdio.h>

void mem_copy(char *src,char *dst,size_t size)
{
    size_t temp;
    for (size_t i = 0; i < size; i++)
        {
            dst[i] = src[i];
        }
}