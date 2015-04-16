clear all
clc

Am   = 1;
w = 0;
Om   = 1;
Ph = 0;

T0 = 1;
f0 = 250;
BW = 5;
SF = 16384;
CF = 1;
dfA = 20;
df = 1/dfA;
RO = 0;
AF = 1;
Mo = 0.9;
wM = 120;
PhFlag = 0;

NormFlag=1;

cond = [T0, f0,  BW,    SF, CF, df,  RO, AF, Mo, wM, PhFlag];   
rippleParams = [Am, w, Om, Ph];
  
[s1,profile,XkV,t_env,SList,theta,freq,rO] = multimvripfft1_Supratim(rippleParams, cond);

cond2=[T0, f0, SF, BW, RO, df, Mo]; 
rippleParams2 = rippleParams; rippleParams2(:,4)=rippleParams(:,4)/pi-1/2;
s2 = mvripfft_Shihab(rippleParams2, cond2,theta,freq,XkV,rO);

componentA=s1/max(s1);
componentB=s2/max(s2);
compA = componentA;
compB = componentB';

compPlot(compA',compB,NormFlag);

compPlotFFT(compA',compB,NormFlag);