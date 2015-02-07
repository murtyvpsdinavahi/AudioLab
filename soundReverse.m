function reversedSound = soundReverse(originalSound)
    if size(originalSound,1)> size(originalSound,2)
            originalSound = originalSound';
    end
    for i=1:size(originalSound,1)
        for j=1:size(originalSound,2)
            reversedSound(i,j)=originalSound(i,(size(originalSound,2)-(j-1)));
        end
    end
end