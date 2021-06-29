li $s0,3
li $s1,7
add $s0,$s0,$s1
sub $s1,$s0,$s1
sub $s0,$s0,$s1
li $v0,1
la $a0,($s0)
syscall 
li $v0,1
la $a0,($s1)
syscall 
