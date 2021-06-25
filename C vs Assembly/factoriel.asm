li $v0,5
syscall 
la $s0,($v0)
li $s2,1
la $t0,($s0)
loop:
beq $t0,1,print
mult $s2,$t0
mflo  $s2
subi $t0,$t0,1
j loop
print :
li $v0,1
la $a0,($s2)
syscall
