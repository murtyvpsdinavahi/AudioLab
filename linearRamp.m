clear all; clc

fs=2000;
t=0:1/fs:1-1/fs;
f=50;
a=4;
rampTime=0.01;

x=a*sin(2*pi*f*t);
plot(t,x)

a=t(1:((find(t==rampTime))-1))/(rampTime);

b=ones(1,(length(t)-(2*(length(a)))));

c=t(length(a):(-1):1)/(rampTime);

d=[a b c];
plot(t,d)
ylim([0 5])

xm=x.*d;
plot(t,xm)