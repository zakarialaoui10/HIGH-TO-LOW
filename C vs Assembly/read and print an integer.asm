.data
 msg1: .asciiz "enter an integer : "
 msg2: .asciiz "your integer is  : "
.text
 print_msg1:li $v0,4
           la $a0,msg1
           syscall 
 read_integer:li $v0,5
              syscall 
 la $s0,($v0) #save_integer_in_s0:
 print_msg2:li $v0,4
            la $a0,msg2
            syscall              
 print_integer:li $v0,1
               la $a0,($s0)
               syscall 
 
  
