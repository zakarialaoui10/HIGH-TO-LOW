<h1>in this repository you will find codes in C and their equivalence in MIPS Assembly</h1>
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
j fin
if:
  la $t2,($t0)   #c
  beq $t1,3,fin 
  add $t2,$t2,$t1
fin:
```
<h3>switch statement</h3>
<h6>C</h6>

```c
#include<stdio.h>
int main(){
int a=1;
int b=0;
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
```
<h3>Power</h3>
<h6>C</h6>

```c
#include<stdio.h>
int main(){
	int x=4;
	int n=3;
	int i=0;
	int p=1;
	for(i=0;i<n;i++)
	p*=x;
	printf("%d",p);
}
```
<h6>MIPS Assembly</h6>

```assembly
li $t0,4
li $t1,3
li $t2,1
li $a0,0
loop:
beq $a0,$t1,fin
mult $t2,$t0
mflo  $t2
addi $a0,$a0,1
j loop
fin :
```
<h3>Factoriel</h3>
<h6>C</h6>

```c
#include<stdio.h>
int main(){
	int x=4;
	int i;
	int f=1;
	for(i=x;i>1;i--)
	f*=i;
	printf("%d",f);
}
```
<h6>MIPS Assembly</h6>

```assembly
li $t0,4
li $t2,1
la $a0,($t0)
loop:
beq $a0,1,fin
mult $t2,$a0
mflo  $t2
subi $a0,$a0,1
j loop
fin :
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
