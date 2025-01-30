# Name: Evan Taylor
# Name: Isaac Ericsson

.globl main

.text
main:
    # Print welcome message
    la a0, welcome_msg
    jal printstring

    # Print operations message
    la a0, operations_msg
    jal printstring

    # Initialize operation count
    li s3, 0  # Initialize operation count in s3

main_loop:
    # Print operation count
    la a0, op_count_msg
    jal printstring
    mv a0, s3
    jal printint

    # Prompt for first number
    la a0, enter_num1_msg
    jal printstring
    jal readint
    mv s0, a0  

    # Prompt for second number
    la a0, enter_num2_msg
    jal printstring
    jal readint
    mv s1, a0  # Store second number in s1

    # Prompt for operation
    la a0, select_op_msg
    jal printstring
    jal readint
    mv s2, a0  # 

    # Increment operation count
    addi s3, s3, 1  

    # Perform selected operation
    mv a0, s0
    mv a1, s1 
    li t1, 1
    beq s2, t1, do_add

    li t1, 2
    beq s2, t1, do_sub

    li t1, 3
    beq s2, t1, do_mul

    li t1, 4
    beq s2, t1, do_div

    li t1, 5
    beq s2, t1, do_and

    li t1, 6
    beq s2, t1, do_or

    li t1, 7
    beq s2, t1, do_xor

    li t1, 8
    beq s2, t1, do_lshift

    li t1, 9
    beq s2, t1, do_rshift
    
    j invalid_operation

do_add:
    mv a0, s0
    mv a1, s1
    jal addnums
    mv t0, a0  # Store result in t0
    j print_result

do_sub:
    mv a0, s0
    mv a1, s1
    jal subnums
    mv t0, a0  # Store result in t0
    j print_result

do_mul:
    mv a0, s0
    mv a1, s1
    jal multnums
    mv t0, a0  # Store result in t0
    j print_result

do_div:
    beqz s1, div_by_zero  # Check for division by zero
    mv a0, s0
    mv a1, s1
    jal divnums
    mv t0, a0  # Store result in t0
    j print_result

do_and:
    mv a0, s0
    mv a1, s1
    jal andnums
    mv t0, a0
    j print_result

do_or:
    mv a0, s0
    mv a1, s1
    jal ornums
    mv t0, a0
    j print_result

do_xor:
    mv a0, s0
    mv a1, s1
    jal xornums
    mv t0, a0
    j print_result

do_lshift:
    mv a0, s0
    mv a1, s1
    jal lshiftnums
    mv t0, a0
    j print_result

do_rshift:
    mv a0, s0
    mv a1, s1
    jal rshiftnums
    mv t0, a0
    j print_result

print_result:
    mv a0, t0  # Restore result from t0 before printing
    la a0, result_msg
    jal printstring
    mv a0, t0
    jal printint
    j ask_continue

div_by_zero:
    la a0, div_zero_msg
    jal printstring
    j ask_continue

invalid_operation:
    la a0, invalid_op_msg
    jal printstring

ask_continue:
    la a0, continue_msg
    jal printstring
    jal readchar
    li t1, 'n'
    beq a0, t1, exit  # Exit properly
    j main_loop       # Jump back to start correctly

exit:
    la a0, exit_msg
    jal printstring
    mv a0, s3  # Print total operations
    jal printint
    la a0, exiting_msg
    jal printstring
    jal exit0
    

.data   
    welcome_msg:    .string "Welcome to the Calculator program.\n"
    operations_msg: .string "Operations - 1:add 2:subtract 3:multiply 4:divide 5:and 6:or 7:xor 8:lshift 9:rshift"
    op_count_msg:   .string "\n\nNumber of operations performed: "
    enter_num1_msg: .string "\nEnter number: "
    enter_num2_msg: .string "Enter second number: "
    select_op_msg:  .string "Select operation: "
    result_msg:     .string "Result: "
    continue_msg:   .string "\nContinue (y/n)?: "
    exit_msg:       .string "\n\nNumber of operations performed: "
    exiting_msg:    .string "\nExiting\n"
    div_zero_msg:   .string "Error: Division by zero!\n"
    invalid_op_msg: .string "Invalid Operation\n"
