#include <stdio.h>
void decToBinary(int n);
int main() {

    int a = 12, b = 25;
  
    decToBinary(b);
    printf("\n");
    decToBinary(a);
    printf("\n Output = %d \n", a ^ b);
    return 0;
}

// function to convert decimal to binary
void decToBinary(int n)
{
    // array to store binary number
    int binaryNum[32];

    int i = 0;
    while (n > 0) {

        // storing remainder in binary array
        binaryNum[i] = n % 2;
        n = n / 2;
        i++;
    }
   
    // printing binary array in reverse order
    for (int j = i - 1; j >= 0; j--)
         printf("%d", binaryNum[j]);
}
