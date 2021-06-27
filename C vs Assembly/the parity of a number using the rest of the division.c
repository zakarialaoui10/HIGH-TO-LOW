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
