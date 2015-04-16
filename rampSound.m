
function rampedSound = rampSound(soundFile,timeVals,rampTime) % rampTime is in seconds

rampPonits=timeVals(1:(find(timeVals==rampTime))-1);
rampPonits=rampPonits./max(rampPonits);

a=sin(0.5*pi*rampPonits);
a=(a./max(a)).^2;
b=ones(1,(length(timeVals)-(2*(length(a)))));
c=soundReverse(a);
rampingFilter=[a b c];

rampedSound=soundFile.*rampingFilter;

end