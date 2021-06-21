li $t0,1  #a
li $t1,4  #b
beq $t0,1,if
j fin
if:
  la $t2,($t0)   #c
  beq $t1,3,fin 
  add $t2,$t2,$t1
fin: