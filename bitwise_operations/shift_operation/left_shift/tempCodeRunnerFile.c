#include <stdio.h>
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