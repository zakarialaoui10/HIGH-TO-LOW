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
