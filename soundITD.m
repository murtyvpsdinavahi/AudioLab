function modifiedSound = soundITD(originalSound,Fs,ITD,lagChannel)
    if size(originalSound,1)> size(originalSound,2)
        originalSound = originalSound';
    end
    
    if (size(originalSound,1) == 1)
        tempSound = originalSound;
        originalSound(1,:)=tempSound;
        originalSound(2,:)=tempSound;
        clear tempSound;
    end
    
    extraSamplesNum = round((Fs*ITD)/(1000000));
    extraSamples = zeros(1,extraSamplesNum);
    
    if (~exist('lagChannel','var')) || (strcmp(lagChannel,'Left'))
        modifiedSound(1,:) = [extraSamples originalSound(1,:)];
        modifiedSound(2,:) = [originalSound(2,:) extraSamples];
    else 
        modifiedSound(1,:) = [originalSound(1,:) extraSamples];
        modifiedSound(2,:) = [extraSamples originalSound(2,:)];        
    end    
end