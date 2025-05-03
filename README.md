<!--    
docs
solid-start ( structure ) 
ziko-wrapper ( )  
zikojs ( components ) 
mdzjs ( articles )
ziko-code ( code component )
ssr 
taylor series 
rename to mips 101 !?  
    
 --> 

## This repository contains C code examples along with their MIPS Assembly equivalents.           
      

- [1-Hello World](#hello-world) 
- [2-Print an integer](#print-an-integer)
- [3-Print an float](#print-a-float)
- [4-Read and print an integer](#read-and-print-an-integer)
- [5-Addition of 2 integers](#addition-of-2-integers) 
- [6-Substraction of 2 integers](#substraction-of-2-integers)
- [7-If else statement](#if-else-statement)
- [8-nested if](#nested-if)
        
         
     
### hello world      
###### C            
```c       
#include<stdio.h>   
int main(){  
  printf("hello world"); 
  return 0;
}   
```  
###### MIPS Assembly
```assembly
.data
 msg: .asciiz "hello world"
.text
 li $v0,4
 la $a0,msg
 syscall
```
### print an integer
###### C
```c
#include<stdio.h>
int main(){
int number=2;
  printf("%d",number);
  return 0;
}
```
###### MIPS Assembly
```assembly 
.data
 number: .word 2
.text 
 li $v0,1 
 lw $a0,number
 syscall 
```
### print a float
###### C
```c
#include<stdio.h>
int main(){
float number=2.5;
  printf("%f",number);
  return 0;
}
```
###### MIPS Assembly
```assembly
.data
 number: .float 2.5
.text
 li $v0,2
 lwc1 $f12,number
 syscall 
```
### read and print an integer 
###### C
```c
#include<stdio.h>
int main(){
int a;
printf("enter an integer : ");
scanf("%d",&a);
printf("your integer is : ");
printf("%d",a);
return 0;
}
```
###### MIPS Assembly
```assembly
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
```
### addition_of_2_integers
###### C
```c
#include<stdio.h>
int main()
{
  int a,b,c;
  scanf("%d%d",&a,&b);
  c=a+b;
  printf("%d",c);
  return 0;
}
```
###### MIPS Assembly
```assembly
li $v0,5
syscall
move $s0,$v0
li $v0,5
syscall
move $s1,$v0
add $s2,$s1,$s0
li $v0,1
move $a0,$s2
syscall
```
### substraction of 2 integers 
###### C
```c
#include<stdio.h>
int main()
{
  int a,b,c;
  scanf("%d%d",&a,&b);
  c=a-b;
  printf("%d",c);
  return 0;
}
```
###### MIPS Assembly
```assembly
li $v0,5
syscall
move $s0,$v0
li $v0,5
syscall
move $s1,$v0
sub $s2,$s0,$s1
li $v0,1
move $a0,$s2
syscall 
```
### if else statement
###### C
```c
#include<stdio.h>
int main(){
int a=5,b=3,c=0;
if(a==b) c=a+b;
else c=a-b;
	printf("%d",c);
	return 0;
}
```
###### MIPS Assembly
```assembly
li $t0,5       #a
li $t1,3       #b
li $t2,3       #c
beq $t0,$t1,if
j else
if:add $t2,$t0,$t1
else:sub $t2,$t0,$t1
print:
li $v0,1
move $a0,$t2
syscall 
```
### nested if
###### C
```c
#include<stdio.h>
int main(){
int a=1;
int b=4;
int c;
if(a==1)
{
	c=a;
	if(b!=3){
		c+=b;
	}	
}
printf("%d",c);
}
```
###### MIPS Assembly
```assembly
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
```
### switch statement
###### C
```c
#include<stdio.h>
int main(){
int a;
int b=0;
scanf("%d",&a);
switch(a){
	case 0:b=-1; break;
	case 1:b=0; break;
	default :b=1; break;
}
printf("%d",b);
}
```
###### MIPS Assembly
```assembly
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
```
### Power
###### C
```c
#include<stdio.h>
int main(){
	int x,n;
	scanf("%d%d",&x,&n);
	int i=0;
	int p=1;
	for(i=0;i<n;i++)
	p*=x;
	printf("%d",p);
}
```
###### MIPS Assembly
```assembly
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
```
### Factorial
###### C
```c
#include<stdio.h>
int main(){
	int x;
	scanf("%d",&x);
	int i;
	int f=1;
	for(i=x;i>1;i--)
	f*=i;
	printf("%d",f);
}
```
###### MIPS Assembly
```assembly
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
```
### the parity of a number using the rest of the division
###### C
```c
#include<stdio.h>
int main(){
  int number;
  read:scanf("%d",&number);
  if(number%2==0){
    printf("even\n");
    goto read;
    }
  else printf("odd\n");
  goto read;
}
```
###### MIPS Assembly
```assembly
.data 
 even : .asciiz "even\n"
 odd : .asciiz "odd\n"
 .text
read:li $v0,5
syscall
move $s0,$v0
li $t0,2
div $s0,$t0
mfhi $t1
beq $t1,0,iseven
li $v0,4
la $a0,odd
syscall 
j read
iseven: li $v0,4
      la $a0,even
      syscall
j read
```
### the parity of a number using bitwise and operator 
###### C
```c
#include<stdio.h>
int main(){
  int number,c;
  read:scanf("%d",&number);
  if((number & 1)==0){
    printf("even\n");
    goto read;
    }
  else printf("odd\n");
  goto read;
}
```
###### MIPS Assembly
```assembly
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
```
### swap 2 numbers using auxiliary variable
###### C
```c
#include<stdio.h>
int main(){
  int a=3,b=7,c;
  c=a;
  a=b;
  b=c;
  print("%d\n%d",a,b);
  return 0;
}
```
###### MIPS Assembly
```assembly
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
```
### swap 2 numbers using addition and subtraction 
###### C
```c
#include<stdio.h>
int main(){
  int a=3,b=7;
  a=a+b;
  b=a-b;
  a=a-b;
  print("%d\n%d",a,b);
  return 0;
}
```
###### MIPS Assembly
```assembly
li $s0,3
li $s1,7
add $s0,$s0,$s1
sub $s1,$s0,$s1
sub $s0,$s0,$s1
li $v0,1
la $a0,($s0)
syscall 
li $v0,1
la $a0,($s1)
syscall 
```
### swap 2 numbers using bitwise xor operator
###### C
```c
#include<stdio.h>
int main(){
  int a=3,b=7;
  a=a^b;
  b=a^b;
  a=a^b;
  printf("%d\n%d",a,b);
  return 0;
}
```
###### MIPS Assembly
```assembly
li $s0,3
li $s1,7
xor $s0,$s0,$s1
xor $s1,$s0,$s1
xor $s0,$s0,$s1
li $v0,1
la $a0,($s0)
syscall
li $v0,1
la $a0,($s1)
syscall   
```
### Read and Print elements of an array
###### C
```c
#include<stdio.h>
int main(){
	int arr[5];
	int i=0;
	//read
	for(i=0;i<5;i++){
	    scanf("%d",&arr[i]);
	}
	//print
	for(i=0;i<5;i++){
	    printf("%d",arr[i]);
	    printf(" ");
	}
}
```
###### MIPS Assembly
```assembly
.data
 arr: .space 20    #(20=5*4(Size of word))
 space: .asciiz " "
.text 
 li $t0,0
 read:
 li $v0,5
 syscall 
 sw $v0,arr($t0)
 addi $t0,$t0,4
 blt $t0,20,read
 
 la $s0,arr
 li $t0,0
 print:
 li $v0,1
 lw $a0,($s0)
 syscall 
 addi $t0,$t0,4
 addi $s0,$s0,4
 li $v0,4
 la $a0,space
 syscall 
 blt $t0,20,print
```

### Array's elements somme
###### C
```c
#include<stdio.h>
int main(){
	int tab[10]={0,1,2,3,4,5,6,7,8,9};
	int s=0;
	int i=0;
	while(i<10){
		s+=*(tab+i); // s=s+tab[i]
		i++;
	}
	printf("%d",s);
	return 0;
}
```
###### MIPS Assembly
```assembly
.data 
tab: .byte 0,1,2,3,4,5,6,7,8,9
.text 
main: 
la $t0, tab 
li $a0,0 #compteur
li $s0,0 #somme
loop:
lb $t1,($t0)
add $s0,$s0,$t1
addi $t0,$t0,1
addi $a0,$a0,1
bne $a0,10,loop
```

### Print a random integer belongs to the interval 0,10
###### C            
```c     
#include<stdio.h>
#include<time.h>
#include<stdlib.h>
int main(){  
  srand(time(NULL));
  int r = rand()%10;
  printf("%i", r);
  return 0;
}   
```  
###### MIPS Assembly

In order to get a random number we have to assign the register $v0 with the value 42.
The value stored in $a1 represent the upper value of the generated random number.

```assembly
.text
#get random int belongs to the interval 0,10
li $v0,42
li $a1,10
syscall 
print:
 li $v0,1
 syscall 
```
