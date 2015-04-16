clear all
clc

Am   = 1;
w = 8;
Om   = 1;
Ph = 0;

T0 = 1000;
f0 = 250;
BW = 5;
SF = 16000;
CF = 1;
dfA = 20;
df = 1/dfA;
RO = 0;
AF = 1;
Mo = 0.9;
wM = 120;
PhFlag = 2;

T0=T0/1000;
lengthSound = round((T0)*SF); 
timeAxis  = 0:1/SF:(lengthSound-1)/SF; % Time Axis (s)

rippleList = [Am w Om Ph];
cond = [T0,f0,BW,SF,CF,df,RO,AF,Mo,wM,3];
comp_phs_file='C:\Users\LabComputer6\Documents\MATLAB\Programs\Downloaded\baphy\SoundObjects\@Torc\Sounds\save_comp_phs';
        
%% Calculations  

% [s2,component2] = genRipples(rippleList, cond,comp_phs_file);

%         % Time Values
%         t=0:1/SF:T0-1/SF;

% freq axis
if CF==0	%compute harmonic tones freqs
    fr = df*(round(f0/df):round(2.^BW*f0/df)).';
else	%compute log-spaced tones freqs
    fr = f0*2.^((0:round(BW/df*2)/2-1)*df).';
end
Xk = log2(fr/f0);

% roll-off and phase relation
        
switch PhFlag
case 0
    th = 2*pi*rand(f_env_size,1);	% component phase, theta
case 1
    th = 2*pi*rand(f_env_size,1);	% component phase, theta
    save(comp_phs_file,'th');%Save component phases
case 2
    fp = load(comp_phs_file);
    th = fp.th;
otherwise
    error('Invalid selection');
    return;
end;

% Using Baphy Code for comparison
[s2,profile2,f_env2,t_env2,component2] = multimvripfft1(rippleList, cond,comp_phs_file,th);

EnProfile = makeProfile(rippleList,Xk,timeAxis,Mo);
for q=1:length(fr)
    component1(q,:) = (EnProfile(q,:)) .* (cos(2*pi*(round(fr(q)*T0)/T0)*timeAxis + th(q)));
end

for i=1:size(component1,1)
    subplot(221);
    plot(component1(i,:)); hold on; plot(component2(i,:),'r--');
    hold off;
    subplot(223);
    plot(component1(i,:) - component2(i,:),'k');

    subplot(222);
    plot(abs(fft(component1(i,:)))); hold on; plot(abs(fft(component2(i,:))),'r--');
    hold off;
    subplot(224);
    plot(abs(fft(component1(i,:))) - abs(fft(component2(i,:))),'k');
    disp(i);
    pause;
end