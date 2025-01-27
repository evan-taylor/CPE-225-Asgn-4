#include <stdio.h>
#include "operations.h"


int main() {
    int opNum;
    int num1;
    int num2;
    int operation;
    char yn;


    opNum = 0;
    printf("Welcome to the Calculator program.\n");
    printf("Operations - 1:add 2:subtract 3:multiply 4:divide 5:and 6:or 7:xor 8:lshift 9:rshift\n");


    do {
        printf("Number of operations performed: %d\n", opNum);
        printf("Enter number: ");
        scanf(num1);
        printf("\n");
        printf("Enter second number");
        opNum ++;
        printf("Continue (y/n)?: ");
        scanf(" %c", &yn);
    } while(yn != 'n');
    
    printf("Exiting");
    return 0;

}