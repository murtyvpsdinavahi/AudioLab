clear 
clc

Am   = 1;
w = 0;
Om   = 1;
Ph = 1;

T0 = 1000;
f0 = 1000;
BW = 5;
SF = 16000;
CF = 1;
dfA = 20;
df = 1/dfA;
RO = 0;
AF = 1;
Mo = 1;
wM = 120;
PhFlag = 0;

NormFlag=0;

T0=T0/1000;
lengthSound = round((T0)*SF); 
timeAxis  = 0:1/SF:(lengthSound-1)/SF; % Time Axis (s)

rippleList = [Am w Om Ph-0.5];
cond = [T0, f0, SF, BW, RO, df];
comp_phs_file='C:\Users\LabComputer6\Documents\MATLAB\Programs\Downloaded\baphy\SoundObjects\@Torc\Sounds\save_comp_phs';

%% Shihab's code
[s3,~,~,th,r] = mvripfft_Shihab_Original(rippleList, cond);

%% MD
if CF==2	%compute tones freqs
    R1 = round(2.^([-1 1]*BW/2)*f0/df); 
    fk = df*(R1(1):R1(2))';
else	%compute log-spaced tones freqs
    R1 = round((BW/2)/df); 
    fk = f0*2.^((-R1:R1)*df)';
end;

Xk = log2(fk/f0);
        
rippleList = [Am w Om Ph*pi];
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
componentA=soundFileData/max(soundFileData);
componentB=s3/max(s3);
compA = componentA;
compB = componentB';
compPlot(compA,compB,NormFlag);