#include <stdio.h>
#include "operations.h"


int main() {
    int opNum;
    int num1;
    int num2;
    unsigned unsignedNum1;
    unsigned unsignedNum2;
    int operation;
    char yn;
    int result;


    opNum = 0;
    printf("Welcome to the Calculator program.\n");
    printf("Operations - 1:add 2:subtract 3:multiply 4:divide 5:and 6:or 7:xor 8:lshift 9:rshift\n");


    do {
        printf("\nNumber of operations performed: %d\n", opNum);
        printf("Enter number: ");
        scanf("%d", &num1);
        printf("Enter second number: ");
        scanf("%d", &num2);
        opNum ++;
        printf("Select operation: ");
        scanf("%d", &operation);
        switch (operation)
        {
        case 1:
            result = addnums(num1, num2);
            printf("Result: %d\n", result);
            break;
        case 2:
            result = subnums(num1, num2);
            printf("Result: %d\n", result);
            break;
        case 3:
            result = multnums(num1,num2);
            printf("Result: %d\n", result);
            break;
        case 4:
            if (num2 == 0) {
                printf("Error: Division by zero!\n");
                result = 0;
            } else {
                result = divnums(num1, num2);
            } 
            printf("Result: %d\n", result);
            break;
        case 5:
            result = andnums(num1, num2);
            printf("Result: %d\n", result);
            break;
        case 6:
            result = ornums(num1, num2);
            printf("Result: %d\n", result);
            break;
        case 7:
            result = xornums(num1, num2);
            printf("Result: %d\n", result);
            break;
        case 8:
            result = lshiftnums(num1, num2);
            printf("Result: %d\n", result);
            break;
        case 9:
            unsignedNum1 = num1;
            unsignedNum2 = num2;
            result = rshiftnums(unsignedNum1, unsignedNum2);
            printf("Result: %u\n", result);
            break;
        default:
            printf("Result: Invalid Operation\n");
        }
        printf("Continue (y/n)?: ");
        scanf(" %c", &yn);
    } while(yn != 'n');

    printf("\nNumber of operations performed: %d\n", opNum);
    printf("Exiting");
    return 0;
}