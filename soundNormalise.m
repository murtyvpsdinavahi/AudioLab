function [normalisedSound] = soundNormalise(originalSound)
    if size(originalSound,1)> size(originalSound,2)
        originalSound = originalSound';
    end
    for i=1:size(originalSound,1)
        for j=1:size(originalSound,2)
            normalisedSound(i,j)=originalSound(i,j)/max(originalSound(i,:));
        end
    end
end