clear all;clc;

f=2000;
% fs=f*(0.2/500);
fs=0.2;
% x=(f-f/100):fs:(f+f/100);
x=(f-5):fs:(f+5);
y=f*exp((-1/2)*(((x-f)/2).^2));


figure; plot(x,y)

x1=find(x==(f-(fs*5))):find(x==f);
x2=find(x==(f+fs)):find(x==(f+(fs*5)));

y1=y(x1)-f;
y2=(f*1)-y(x2);
z=[y1 y2];

freq = 