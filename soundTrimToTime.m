function trimmedSound = soundTrimToTime(originalSound,Fs,startTime,endTime)
    if size(originalSound,1)> size(originalSound,2)
        originalSound = originalSound';
    end
    
    startIndex = round(startTime*Fs)+1;
    stopIndex = round(endTime*Fs);
        
    for i=1:size(originalSound,1)        
        trimmedSound(i,:)=(originalSound(i,startIndex:stopIndex));
    end
end