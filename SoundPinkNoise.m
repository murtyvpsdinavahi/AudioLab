clear all
clc
fs=44100;
n = 2;
data = pinknoise(fs*n);
NormalisedSound = soundNormalise(data);
player = audioplayer(NormalisedSound,fs);
player.play;
audiowrite(['C:\Users\LabComputer6\Documents\MATLAB\Programs\Murty\Project related\Sounds\pink' num2str(n) 's.wav'],NormalisedSound,fs);