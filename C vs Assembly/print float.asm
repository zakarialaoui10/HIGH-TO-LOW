.data
 number: .float 2.5
.text
 li $v0,2
 lwc1 $f12,number
 syscall 
 
