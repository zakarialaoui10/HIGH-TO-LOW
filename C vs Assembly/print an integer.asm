.data
 number: .word 2
.text
 li $v0,1
 lw $a0,number
 syscall 
