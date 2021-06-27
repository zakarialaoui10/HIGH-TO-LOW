.data 
 even : .asciiz "even\n"
 odd : .asciiz "odd\n"
 .text
read:li $v0,5
syscall
move $s0,$v0
li $t0,2
andi $t0,$s0,1
beq $t0,0,iseven
li $v0,4
la $a0,odd
syscall 
j read
iseven: li $v0,4
      la $a0,even
      syscall
j read
