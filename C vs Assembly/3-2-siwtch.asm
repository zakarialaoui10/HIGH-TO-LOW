# a====>$s0
# b====>$s1
read_a:li $v0,5
       syscall 
       la $s0,($v0)
switch:
beq $s0,0,case0
beq $s0,1,case1
j default
case0:li $s1,-1
j print
case1:li $s1,0
j print
default:li $s1,1
print:
li $v0,1
move $a0,$s1
syscall 
