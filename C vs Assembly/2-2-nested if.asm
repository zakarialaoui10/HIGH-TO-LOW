li $t0,1  #a
li $t1,4  #b
beq $t0,1,if
j print
if:
  la $t2,($t0)   #c
  beq $t1,3,print 
  add $t2,$t2,$t1
print:
li $v0,1
move $a0,$t2
syscall 
