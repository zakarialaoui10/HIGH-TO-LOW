<h1>in this repository you will find codes in C and their equivalence in MIPS Assembly</h1>
<h3>hello world</h3>
<h6>C</h6>

```c
#include<stdio.h>
int main(){
  printf("hello world");
  return 0;
}

```
```assembly
.data
 msg: .asciiz "hello world"
.text
 li $v0,4
 la $a0,msg
 syscall
```
<h3> read and print an integer </h3>
<h6>C</h6>

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
<h6>MIPS Assembly</h6>

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


<h3>if else statement</h3>
<h6>C </h6>

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
<h6>MIPS Assembly</h6>

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
<h3>nested if</h3>
<h6>C</h6>

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
<h6>MIPS Assembly</h6>

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
<h3>switch statement</h3>
<h6>C</h6>

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
<h6>MIPS Assembly</h6>

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
<h3>Power</h3>
<h6>C</h6>

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
<h6>MIPS Assembly</h6>

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
<h3>Factoriel</h3>
<h6>C</h6>

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
<h6>MIPS Assembly</h6>

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

<h3>Array's elements somme</h3>
<h6>C</h6>

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
<h6>MIPS Assembly</h6>

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
