.data
 msg: .asciiz "hello world"
.text
 li $v0,4
 la $a0,msg
 syscall 
 
 
