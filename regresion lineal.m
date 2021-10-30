clc
clear

x=input('Ingrese los valores de x entre []:');
n=length(x);
y=input('Ingrese los valores de y entre []:');
xy=x.*y;
x2=x.*x;
sx=sum(x);
sy=sum(y);
sxy=sum(xy);
sx2=sum(x2);
mx=mean(x);
my=mean(y);
A=[n sx;sx sx2];
b=[sy;sxy];
A1=A^-1;
ya2=zeros(1,n);
yyp=zeros(1,n);
A1b=[((A1(1,1).*b(1,1))+(A1(1,2).*b(2,1)));(A1(2,1).*b(1,1)+(A1(2,2).*b(2,1)))];
for(i=1:n)
ya2(i)=(y(i)-A1b(1,1)-(A1b(2,1).*x(i)))^2;
yyp(i)=(y(i)-my)^2;
endfor
sya2=sum(ya2);
syyp=sum(yyp);
r2=(syyp-sya2)./syyp;
r=sqrt(r2);
printf('---x--------------y--------------xy--------------x^2---------(y-a0-a1x)^2---------(y-yp)^2\n')
for(i=1:n)
printf('%f\t%f\t%f\t%f\t%f\t%f\t\n',x(i),y(i),xy(i),x2(i),ya2(i),yyp(i));
endfor
printf('Sum: %f\t%f\t%f\t%f\t%f\t%f\t\n',sx,sy,sxy,sx2,sya2,syyp);
printf('Promedio: %f\t%f\n',mx,my);
printf('a0: %f\n',A1b(1,1));
printf('a1: %f\n',A1b(2,1));
printf('La ecuacion del modelo es: %f + %fx \n',A1b(1,1),A1b(2,1));
printf('El coeficiente de correlacion es: %f ',r);
