.data
 msg: .word 2
.text
 li $v0,1
 lw $a0,msg
 syscall 
 
