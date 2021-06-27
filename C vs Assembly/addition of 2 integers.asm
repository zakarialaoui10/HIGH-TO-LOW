li $v0,5
syscall
move $s0,$v0
li $v0,5
syscall
move $s1,$v0
add $s2,$s1,$s0
li $v0,1
move $a0,$s2
syscall 
