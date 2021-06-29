li $s0,3   #a
li $s1,7   #b
la $t0,($s0)
la $s0,($s1)
la $s1,($t0)
li $v0,1
la $a0,($s0)
syscall 
li $v0,1
la $a0,($s1)
syscall 
