# Name: Evan Taylor
# Name: Isaac Ericsson

.globl main

.text
main:
    # Initialize operation count
    li s0, 0             # s0 = operation count

    # Print welcome message
    la a0, welcome_msg
    jal printstring
    
    # Print operations message
    la a0, operations_msg
    jal printstring

main_loop:
    # Print operation count
    la a0, op_count_msg
    jal printstring
    mv a0, s0
    jal printint
    
    # Prompt for first number
    la a0, enter_num1_msg
    jal printstring
    jal readint
    mv s1, a0           # Store first number in s1
    
    # Prompt for second number
    la a0, enter_num2_msg
    jal printstring
    jal readint
    mv s2, a0           # Store second number in s2
    
    # Prompt for operation
    la a0, select_op_msg
    jal printstring
    jal readint
    mv s3, a0           # Store operation in s3
    
    # Increment operation count
    addi s0, s0, 1
    
    # Check operation type and branch accordingly
    li t0, 1
    beq s3, t0, operation_add
    li t0, 2
    beq s3, t0, operation_sub
    li t0, 3
    beq s3, t0, operation_mul
    li t0, 4
    beq s3, t0, operation_div
    li t0, 5
    beq s3, t0, operation_and
    li t0, 6
    beq s3, t0, operation_or
    li t0, 7
    beq s3, t0, operation_xor
    li t0, 8
    beq s3, t0, operation_lshift
    li t0, 9
    beq s3, t0, operation_rshift
    
    # If we get here, invalid operation
    la a0, result_msg
    jal printstring
    la a0, invalid_op_msg
    jal printstring
    b check_continue

operation_add:
    mv a0, s1
    mv a1, s2
    jal addnums
    mv s4, a0           # Store result in s4
    jal print_result

operation_sub:
    mv a0, s1
    mv a1, s2
    jal subnums
    mv s4, a0
    jal print_result

operation_mul:
    mv a0, s1
    mv a1, s2
    jal multnums
    mv s4, a0
    jal print_result

operation_div:
    beqz s2, division_by_zero
    mv a0, s1
    mv a1, s2
    jal divnums
    mv s4, a0
    jal print_result

operation_and:
    mv a0, s1
    mv a1, s2
    jal andnums
    mv s4, a0
    jal print_result

operation_or:
    mv a0, s1
    mv a1, s2
    jal ornums
    mv s4, a0
    jal print_result

operation_xor:
    mv a0, s1
    mv a1, s2
    jal xornums
    mv s4, a0
    jal print_result

operation_lshift:
    mv a0, s1
    mv a1, s2
    jal lshiftnums
    mv s4, a0
    jal print_result

operation_rshift:
    mv a0, s1
    mv a1, s2
    jal rshiftnums
    mv s4, a0
    jal print_result

division_by_zero:
    la a0, div_zero_msg
    jal printstring
    b check_continue

print_result:
    la a0, result_msg
    jal printstring
    mv a0, s4
    jal printint

check_continue:
    la a0, continue_msg
    jal printstring
    jal readchar
    
    li t0, 'n'
    beq a0, t0, program_exit
    b main_loop         # Branch back to start of loop

program_exit:
    la a0, exit_msg
    jal printstring
    mv a0, s0         # Print total operations
    jal printint
    la a0, exiting_msg
    jal printstring
    
    jal exit0          # Exit program

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
