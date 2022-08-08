#include <stdio.h>

int ft_swap(int *a, int *b)
{
    int tmp;
    tmp = *a;

    *a = *b;
    *b = tmp;
    return (0);
}

int main(void){
    int a = 1;
    int b = 2;
    ft_swap(&a, &b);
    printf("%d %d\n", a, b);
    return (0);
}