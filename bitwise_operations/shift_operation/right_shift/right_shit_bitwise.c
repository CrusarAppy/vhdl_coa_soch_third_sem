#include <stdio.h>

// Function to print binary representation of a number
// void printBinary(int num) {
//     for (int i = 31; i >= 0; i--) {
//         printf("%d", (num >> i) & 1); // Extract each bit using a bitwise AND
//         if (i % 8 == 0) printf(" "); // Add space for readability
//     }
//     printf("\n");
// }

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

int main() {
    int num = 12;       // Number to shift (binary: 00000000 00000000 00000000 00001100)
    int shiftAmount = 1; // Number of positions to shift left

    printf("Original Number (Decimal): %d\n", num);
    printf("Original Number (Binary): ");
    decToBinary(num);

    // Perform left shift
    int shiftedNum = num >> shiftAmount;

    printf("\nAfter right Shift by %d positions:\n", shiftAmount);
    printf("Shifted Number (Decimal): %d\n", shiftedNum);
    printf("Shifted Number (Binary): ");
    decToBinary(shiftedNum);

    return 0;
}
