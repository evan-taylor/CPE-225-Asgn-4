.globl main
.text

main:
    la a0, msg1
    li a0, 4
    ecall

.data   
    msg1: "Test"
