.data 
 arr: .space 200
 order: .space 200
 br: .asciiz "\n"
.text 
 main:li $t0,0
 read:
  li $v0,12
  syscall
  ble $v0,64,i
  bge $v0,123,i
  ble $v0,90,maj
  min:subi $v1,$v0,96
  b save
  maj:subi $v1,$v0,64
  save:sb $v1,arr($t0)
  addi $t0,$t0,1  #compteur
  i:bne $v0,10,read
 la $s0,arr
 print:
 lb $s1,($s0)
 li $v0,1
 la $a0,($s1)
 syscall
 print_space: 
 li $v0,11
 li $a0,' '
 syscall 
 addi $s0,$s0,1
 subi $t0,$t0,1
 bnez $t0,print
 
li $v0, 4  
la $a0,br    
syscall

li $v0,0
li $v1,0
li $a0,0
li $s0,0
li $s1,0
b main
