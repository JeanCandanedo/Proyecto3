clc
clear

x=input('Ingrese los valores de x entre []:');
n=length(x);
y=input('Ingrese los valores de y entre []:');
x2=x.*x;
lny=log(y);
xlny=x.*lny;


sx=sum(x);
sy=sum(y);
sx2=sum(x2);
slny=sum(lny);
p=slny/n;
sxlny=sum(xlny);


A=[n,sx;sx,sx2];
b=[slny;sxlny];
A1=A^-1;
A1b=[((A1(1,1).*b(1,1))+(A1(1,2).*b(2,1)));(A1(2,1).*b(1,1)+(A1(2,2).*b(2,1)))];
e=exp(A1b(1,1));


for(i=1:n)
  p1(i)=(lny(i)-p)^2;
  p2(i)=(lny(i)-(A1b(1,1)+A1b(2,1).*x(i)))^2;
endfor
sp1=sum(p1);
sp2=sum(p2);
r2=(sp1-sp2)/sp1;
r=sqrt(r2);
printf('---x--------------y--------------x^2------------ln*y---------x*ln*y\n')
for(i=1:n)
  printf('%f\t%f\t%f\t%f\t%f\t\n',x(i),y(i),x2(i),lny(i),xlny(i));
endfor
printf('Sum: %f\t%f\t%f\t%f\t%f\t\n',sx,sy,sx2,slny,sxlny);
printf('e^lna: %f\n',e);
printf('b: %f\n',A1b(2,1));
printf('La ecuacion del modelo es: %f ^ %fx \n',e,A1b(2,1));
printf('el coeficiente es: %f \n',r);
