read_x:li $v0,5
       syscall 
       la $s0,($v0)
read_n:li $v0,5
       syscall 
       la $s1,($v0)
li $s2,1 #p
li $t0,0
loop:
beq $t0,3,print
mult $s2,$s0
mflo  $s2
addi $t0,$t0,1
j loop
print:
li $v0,1
move $a0,$s2
syscall 
