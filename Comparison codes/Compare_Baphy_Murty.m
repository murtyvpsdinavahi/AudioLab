clear 
clc

Am   = 1;
w = 10;
Om   = 5;
Ph = 0*pi;

T0 = 1000;
f0 = 500;
BW = 5;
SF = 46000;
CF = 1;
dfA = 20;
df = 1/dfA;
RO = 0;
AF = 1;
Mo = 0.5;
wM = 120;
PhFlag = 0;

NormFlag=0;

T0=T0/1000;
lengthSound = round((T0)*SF); 
timeAxis  = 0:1/SF:(lengthSound-1)/SF; % Time Axis (s)

rippleList = [Am w Om Ph];
cond = [T0, f0, BW, SF,   CF, df, RO, AF, Mo, wM, PhFlag];
comp_phs_file='C:\Users\LabComputer6\Documents\MATLAB\Programs\Downloaded\baphy\SoundObjects\@Torc\Sounds\save_comp_phs';

%% Baphy code
[sound2,~,Xk,~,component2,th,fk,r] = multimvripfft1_Supratim(rippleList, cond,comp_phs_file);

%% MD

% if CF==2	%compute tones freqs
%     R1 = round(2.^([-1 1]*BW/2)*f0/df); 
%     fk = df*(R1(1):R1(2))';
% else	%compute log-spaced tones freqs
%     R1 = round((BW/2)/df); 
%     fk = f0*2.^((-R1:R1-1)*df)';
% end;
% 
% Xk = log2(fk/f0);
        
rippleList = [Am w Om Ph];
f_env_size = length(fk);
% EnProfile = makeProfile(rippleList,Xk,timeAxis,Mo);
EnProfile = makeSumRipples(rippleList,Xk,timeAxis,Mo);
        
unmodSoundFileData = zeros(1,length(timeAxis));
soundFileData = zeros(1,length(timeAxis));
for q=1:length(fk)
    unmodCarrier = (cos(2*pi*(round(fk(q)*T0)/T0)*timeAxis + th(q)));
    component1(q,:) = r(q)*((EnProfile(q,:)) .* unmodCarrier);

    unmodSoundFileData = unmodSoundFileData + unmodCarrier;
    soundFileData = soundFileData + component1(q,:);            
end


%% Comparison   
for i=1:size(component1,1)
    comp1 = component1(i,:);
    comp2 = component2(i,:);
%         comp1=comp1/max(comp1);
%         comp2=comp2/max(comp2);
    compPlot(comp1,comp2,0);
    disp(i);
    pause;        
end

compA = soundFileData;
compB = sound2';
compPlot(compA,compB,0);