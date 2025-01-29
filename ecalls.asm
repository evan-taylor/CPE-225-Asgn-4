#printint
#printstring
#printchar
#readchar
#readint
#exit0

.global printint, printstring, printchar, readchar, readint, exit0
.text
#printint(int x) -> "x"
#source is a0
printint:
li a7, 1
ecall
ret

#printstring(string x) -> "x"
#source is a0
printstring:
li a7, 4
ecall
ret

#printchar(int x) -> "x"
#source is a0
#destination is a0
printchar:
li a7, 11
ecall
ret

#readchar()
#destination is a0
readchar:
li a7, 12
ecall
ret

#readint()
#destination is a0
readint:
li a7, 5
ecall
ret

#exit0()
exit0:
li a7, 10
ecall
ret