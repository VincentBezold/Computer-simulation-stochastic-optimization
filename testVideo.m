% clear,clc
syms X I
F=int(X*sin((I*pi*X)/50),X,0,1)+int((2-X)*sin((I*pi*X)/50),X,1,2);
i=1:1:110;
a=double((2/50)*subs(F,I,i));
%stage 3
v=1; %m/s
x=-20:0.1:20;
for t=0:0.1:5
  gif =a*sin(i'*pi*(x-v*t)/50);  
  figure(1)
  plot(x,gif);
  grid on
  xlabel('space');
  ylabel('phi(x)');
  title(t)
  drawnow
end