.globl main

.text
main:
    

.data   
    welcome_msg:    .string "Welcome to the Calculator program.\n"
    operations_msg: .string "Operations - 1:add 2:subtract 3:multiply 4:divide 5:and 6:or 7:xor 8:lshift 9:rshift"
    op_count_msg:   .string "\n\nNumber of operations performed: "
    enter_num1_msg: .string "\nEnter number: "
    enter_num2_msg: .string "Enter second number: "
    select_op_msg:  .string "Select operation: "
    result_msg:     .string "Result: "
    continue_msg:   .string "\nContinue (y/n)?: "
    exit_msg:       .string "\nNumber of operations performed: "
    exiting_msg:    .string "Exiting\n"
    div_zero_msg:   .string "Error: Division by zero!\n"
    invalid_op_msg: .string "Invalid Operation\n"