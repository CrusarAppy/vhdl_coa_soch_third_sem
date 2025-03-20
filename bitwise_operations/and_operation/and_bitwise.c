#include <stdio.h>
void decToBinary(int n);
int main() {

    int a = -12, b = -25;
  
    decToBinary(a);
    printf("\n");
    decToBinary(b);
    printf("\n Output = %d \n", a & b);

    return 0;
}

void decToBinary(int n)
{
   
    int value_binary[32];

    int i = 0;
    while (n > 0) {
        value_binary[i] = n % 2;
        n = n / 2;
        i++;
    }
    for (int j = i - 1; j >= 0; j--)
         printf("%d", value_binary[j]);
}
