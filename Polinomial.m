clc
clear

x=input('Ingrese los valores de x entre []:');
n=length(x);
y=input('Ingrese los valores de y entre []:');
x2=x.*x;

for(i=1:n)
  x3(i)=(x(i))^3;
  x4(i)=(x(i))^4;
  xy(i)=x(i)*y(i);
  x2y(i)=(x(i)*x(i))*y(i);
endfor
sx=sum(x);
sy=sum(y);
sx2=sum(x2);
sx3=sum(x3);
sx4=sum(x4);
sxy=sum(xy);
sx2y=sum(x2y);

px=sx/n;
py=sy/n;

A=[n,sx,sx2,sy;sx,sx2,sx3,sxy;sx2,sx3,sx4,sx2y];
G=rref(A);

for(i=1:n)
  t1(i)=(y(i)-py)^2;
  t2(i)=(y(i)-G(1,4)-G(2,4)*x(i)-G(3,4)*x2(i))^2;
endfor

st1=sum(t1);
st2=sum(t2);
r2=(st1-st2)/st1;
r=sqrt(r2);
printf('\n');
printf('---x--------------y--------------x^2------------x^3-------------x^4------------xy------------x^2*y------------(y-ym)^2------------(y-a0-a1*x-a2*x2)^2\n')
for(i=1:n)
  printf('%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t\n',x(i),y(i),x2(i),x3(i),x4(i),xy(i),x2y(i),t1(i),t2(i));
endfor
printf('\n');
printf('Sum:%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t\n',sx,sy,sx2,sx3,sx4,sxy,sx2y,st1,st2);
printf('\n');
printf('promedio y:%f\n',py);
printf('La ecuacion del modelo es: %f + %fx + %fx^2 \n',G(1,4),G(2,4),G(3,4));
printf('El coeficiente de determinacion es: %f \n',r2);
printf('el coeficiente es: %f \n',r);

