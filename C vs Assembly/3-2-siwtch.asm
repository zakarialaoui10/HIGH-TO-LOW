li $t0,1      #a
li $t1,0      #b
switch:
beq $t0,0,case0
beq $t0,1,case1
j default
case0:li $t1,-1
j fin
case1:li $t1,0
j fin
default:li $t1,1
fin:
