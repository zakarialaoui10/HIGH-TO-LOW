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
