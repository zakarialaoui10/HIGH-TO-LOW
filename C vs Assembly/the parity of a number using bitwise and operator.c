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
