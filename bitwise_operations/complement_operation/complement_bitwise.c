// #include <stdio.h>
// void decToBinary(int n);
// int main() {
//     int a = 12;
//     decToBinary(a);
//     printf("\n");
//     printf("\n Output = %d \n", ~a);
//     return 0;
// }

// // function to convert decimal to binary
// void decToBinary(int n)
// {
//     // array to store binary number
//     int binaryNum[32];

//     int i = 0;
//     while (n > 0) {

//         // storing remainder in binary array
//         binaryNum[i] = n % 2;
//         n = n / 2;
//         i++;
//     }
   
//     // printing binary array in reverse order
//     for (int j = i - 1; j >= 0; j--)
//          printf("%d", binaryNum[j]);
// }

#include <stdio.h>

// Function to print binary representation of a number
void printBinary(int num) {
    for (int i = 31; i >= 0; i--) {
        printf("%d", (num >> i) & 1); // Shift and mask to get each bit
        if (i % 4 == 0) printf(" "); // Add space for readability
    }
    printf("\n");
}

int main() {
    int num = 12;
    int complement = ~num;

    printf("Number (Decimal): %d\n", num);
    printf("Number (Binary): ");
    printBinary(num);

    printf("\nBitwise Complement (Decimal): %d\n", complement);
    printf("Bitwise Complement (Binary): ");
    printBinary(complement);

    return 0;
}
