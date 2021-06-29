#include<stdio.h>
int main(){
  int a=3,b=7;
  a=a+b;
  b=a-b;
  a=a-b;
  print("%d\n%d",a,b);
  return 0;
}
