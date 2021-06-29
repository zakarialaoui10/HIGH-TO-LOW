#include<stdio.h>
int main(){
  int a=3,b=7,c;
  c=a;
  a=b;
  b=c;
  print("%d\n%d",a,b);
  return 0;
}
