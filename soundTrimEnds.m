function trimmedSound = soundTrimEnds(originalSound)
    if size(originalSound,1)> size(originalSound,2)
        originalSound = originalSound';
    end
    for i=1:size(originalSound,1)
        startIndex = find(originalSound(i,:)~=0,1,'first');
        stopIndex = find(originalSound(i,:)~=0,1,'last');
        trimmedSound(i,:)=(originalSound(i,startIndex:stopIndex));
    end
end