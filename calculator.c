#include <stdio.h>
#include "operations.h"



int main() {
    int opNum;
    int num1;
    int num2;
    int operation;
    char yn;
    int result;


    opNum = 0;
    printf("Welcome to the Calculator program.\n");
    printf("Operations - 1:add 2:subtract 3:multiply 4:divide 5:and 6:or 7:xor 8:lshift 9:rshift\n");


    do {
        printf("Number of operations performed: %d\n", &opNum);
        printf("Enter number: ");
        scanf("%d", &num1);
        printf("\n");
        printf("Enter second number: ");
        scanf("%d", &num2);
        opNum ++;
        printf("Select operation: ");
        scanf("%d", &operation);
        switch (operation)
        {
        case 1:
            result = add(num1, num2);
            printf("Result: %d\n", &result);
            break;
        case 2:
            result = subtract(num1, num2);
            printf("Result: %d", &result);
            break;
        case 3:
            result = multiply(num1,num2);
            printf("Result: %d", &result);
            break;

        
        default:
            printf("Result: Invalid Operation");
        }
        printf("Continue (y/n)?: ");
        scanf(" %c", &yn);
    } while(yn != 'n');

    printf("Exiting");
    return 0;
}