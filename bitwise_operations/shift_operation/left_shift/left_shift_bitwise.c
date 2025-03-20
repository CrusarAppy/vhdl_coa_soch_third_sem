// #include <stdio.h>
// #include <math.h>

// int decToBinary(int num);
// int binaryToDecimal(int binary);
// int main(){
//     int a = 5;
//     printf(" \n this is the left shift of %d =  %d \n", a, a << 1);
//     decToBinary(a);
//     decToBinary(a << 1);
//     return 0;
// }


// int decToBinary(int num) {
//     int binaryNum = 0;
//     int placeValue = 1;

//     while (num > 0) {
//         int remainder = num % 2;       
//         binaryNum += remainder * placeValue; 
//         num /= 2;                    
//         placeValue *= 10;             
//     }
//     printf("\nthe binary number is %d", binaryNum);

//     return binaryNum; // Return the constructed binary number
// }

// int binaryToDecimal(int binary) {
//     int decimal = 0, base = 0, lastDigit;

//     while (binary > 0) {
//         lastDigit = binary % 10;     
//         decimal += lastDigit * pow(2, base); 
//         binary /= 10;               
//         base++;                     
//     }
//     printf(" this is binarytodecimal %d", decimal);
//     return decimal;
// }

#include <stdio.h>

// Function to print binary representation of a number
void printBinary(int num) {
    for (int i = 31; i >= 0; i--) {
        printf("%d", (num >> i) & 1); // Extract each bit using a bitwise AND
        if (i % 4 == 0) printf(" "); // Add space for readability
    }
    printf("\n");
}

int main() {
    int num = 12;       // Number to shift (binary: 00000000 00000000 00000000 00001100)
    int shiftAmount = 1; // Number of positions to shift left

    printf("Original Number (Decimal): %d\n", num);
    printf("Original Number (Binary): ");
    printBinary(num);

    // Perform left shift
    int shiftedNum = num << shiftAmount;

    printf("\nAfter Left Shift by %d positions:\n", shiftAmount);
    printf("Shifted Number (Decimal): %d\n", shiftedNum);
    printf("Shifted Number (Binary): ");
    printBinary(shiftedNum);

    return 0;
}
