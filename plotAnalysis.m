function plotAnalysis(soundFile,timeAxis,unmodSoundFile,Profile,octaveAxis,Fs,SoundIndex)
    fig = figure(200);
        
%     hCarrierPlot = subplot('Position',[0.02 0.70 0.45 0.28]);
%     hFftPlot = subplot('Position',[0.5 0.70 0.45 0.28]);
%     hEnvelopPlot = subplot('Position',[0.02 0.38 0.45 0.28]);
%     hCarEnvPlot = subplot('Position',[0.5 0.38 0.45 0.28]);
%     hSoundWaveformPlot = subplot('Position',[0.02 0.05 0.45 0.28]);
%     hEnergyPerOctPlot = subplot('Position',[0.5 0.05 0.45 0.28]);
    
    hCarrierPlot = subplot(231);
    hFftPlot = subplot(235);
    hEnvelopPlot = subplot(232);
    hCarEnvPlot = subplot(233);
    hSoundWaveformPlot = subplot(234);
%     hEnergyPerOctPlot = subplot('Position',[0.5 0.05 0.45 0.28]);

    params=defparams([3 5],Fs);
    [spec,tim,fre]=mtspecgramc(unmodSoundFile(SoundIndex,:)',[0.1 0.01],params);
    [spec2,tim2,fre2]=mtspecgramc(soundFile(SoundIndex,:)',[0.1 0.01],params);

    pcolor(hCarrierPlot,tim,fre,log10(spec')); shading(hCarrierPlot,'interp'); axis tight; 
    pcolor(hEnvelopPlot,timeAxis,2.^(octaveAxis(:,SoundIndex)),Profile); shading (hEnvelopPlot,'interp'); axis tight;
    plot(hFftPlot,abs(fft(soundFile(SoundIndex,:)))); axis (hFftPlot,'tight');
    plot(hSoundWaveformPlot,timeAxis,(soundFile(SoundIndex,:))); axis tight;
    pcolor(hCarEnvPlot,tim2,fre2,log10(spec2')); shading(hCarEnvPlot, 'interp'); axis tight;
    colormap(fig,'jet');
    
    figure;
    pcolor(timeAxis,octaveAxis(:,SoundIndex),Profile); shading interp; axis tight;
    colormap('gray');
end