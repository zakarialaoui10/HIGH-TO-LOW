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
