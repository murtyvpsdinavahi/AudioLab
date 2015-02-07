%%
%Auditory Stimuli Toolbox
%Toolbox For production of auditory stimuli for use in
%auditory research.
% 
%Based on methodology described in 
%Escabi, Monty A., and Christoph E. Schreiner. 
%“Nonlinear Spectrotemporal Sound Analysis by Neurons in the Auditory Midbrain.” 
%The Journal of Neuroscience 22, no. 10 (May 15, 2002): 4114–31.
%
%This Toolbox requires Chronux Toolbox for Spectral Analysis of sounds.
%
%Created by Murty V P S Dinavahi: 19/01/2015
%
%To do: pink noise, ripple noise, gabor modulation, binaural hearing
%

function AuditoryLab
fontSizeSmall = 10; fontSizeMedium = 12; fontSizeLarge = 16;

panelStartPosY=0.51;
panelStartPosX = 0;

panelHeight = 0.45; 

panelWidth = 0.16; 
backgroundColor = 'w';

textStartPosX=0;
textStartPosY=0;
textWidth=0.70;
textHeight=0.10;

editStartPosX=textStartPosX+textWidth;
editWidth=1-textWidth;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Sound Panel %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

hSoundPanel = uipanel('Title','Sound Properties','fontSize', fontSizeLarge, ...
    'Unit','Normalized','Position',[panelStartPosX panelStartPosY panelWidth panelHeight]);


uicontrol('Parent',hSoundPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+9*textHeight textWidth textHeight],...
    'Style','text','String','Sound Type','FontSize',fontSizeMedium);

hSoundType = uicontrol('Parent',hSoundPanel,'Unit','Normalized', ...
    'BackgroundColor', backgroundColor, 'Position', ...
    [editStartPosX textStartPosY+9*textHeight editWidth textHeight], ...
    'Style','popup','String','Sinusoidal|Linear Chirp|Exp. Chirp|Imported Sound','FontSize',fontSizeMedium);


uicontrol('Parent',hSoundPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+8*textHeight textWidth textHeight],...
    'Style','text','String','Sound Index','FontSize',fontSizeMedium);

hSoundIndex = uicontrol('Parent',hSoundPanel,'Unit','Normalized', ...
    'BackgroundColor', backgroundColor, ...
    'Position',[editStartPosX textStartPosY+8*textHeight editWidth textHeight], ...
    'Style','edit','String','1','FontSize',fontSizeMedium);


uicontrol('Parent',hSoundPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+7*textHeight textWidth textHeight],...
    'Style','text','String','Base Freq (Hz)','FontSize',fontSizeMedium);

hBaseFreq = uicontrol('Parent',hSoundPanel,'Unit','Normalized', ...
    'BackgroundColor', backgroundColor, ...
    'Position',[editStartPosX textStartPosY+7*textHeight editWidth textHeight], ...
    'Style','edit','String','500','FontSize',fontSizeMedium);


uicontrol('Parent',hSoundPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+6*textHeight textWidth textHeight],...
    'Style','text','String','Total Freqs','FontSize',fontSizeMedium);

hTotalFreq = uicontrol('Parent',hSoundPanel,'Unit','Normalized', ...
    'BackgroundColor', backgroundColor, ...
    'Position',[editStartPosX textStartPosY+6*textHeight editWidth textHeight], ...
    'Style','edit','String','10','FontSize',fontSizeMedium);


uicontrol('Parent',hSoundPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+5*textHeight textWidth textHeight],...
    'Style','text','String','Freqs/octave','FontSize',fontSizeMedium);

hOctFreq = uicontrol('Parent',hSoundPanel,'Unit','Normalized', ...
    'BackgroundColor', backgroundColor, ...
    'Position',[editStartPosX textStartPosY+5*textHeight editWidth textHeight], ...
    'Style','edit','String','1','FontSize',fontSizeMedium);


uicontrol('Parent',hSoundPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+4*textHeight textWidth textHeight],...
    'Style','text','String','Sound Duration (ms)','FontSize',fontSizeMedium);

hSoundDur = uicontrol('Parent',hSoundPanel,'Unit','Normalized', ...
    'BackgroundColor', backgroundColor, ...
    'Position',[editStartPosX textStartPosY+4*textHeight editWidth textHeight], ...
    'Style','edit','String','1000','FontSize',fontSizeMedium);


uicontrol('Parent',hSoundPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+3*textHeight textWidth textHeight],...
    'Style','text','String','Sound Fs (Hz)','FontSize',fontSizeMedium);

hSoundFs = uicontrol('Parent',hSoundPanel,'Unit','Normalized', ...
    'BackgroundColor', backgroundColor, ...
    'Position',[editStartPosX textStartPosY+3*textHeight editWidth textHeight], ...
    'Style','edit','String','20000','FontSize',fontSizeMedium);


uicontrol('Parent',hSoundPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+2*textHeight textWidth textHeight],...
    'Style','text','String','Phases of different freqs','FontSize',fontSizeMedium);

hFreqPhase = uicontrol('Parent',hSoundPanel,'Unit','Normalized', ...
    'BackgroundColor', backgroundColor, ...
    'Position',[editStartPosX textStartPosY+2*textHeight editWidth textHeight], ...
    'Style','popup','String','Zero|Random','FontSize',fontSizeMedium);


uicontrol('Parent',hSoundPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+1*textHeight textWidth textHeight],...
    'Style','text','String','Freq Seperation','FontSize',fontSizeMedium);

hFreqSeperationType = uicontrol('Parent',hSoundPanel,'Unit','Normalized', ...
    'BackgroundColor', backgroundColor, 'Position', ...
    [editStartPosX textStartPosY+1*textHeight editWidth textHeight], ...
    'Style','popup','String','Linear|Log 2','FontSize',fontSizeMedium);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Modulation Panel %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

hModulationPanel = uipanel('Title','Envelope Properties','fontSize', fontSizeLarge, ...
    'Unit','Normalized','Position',[panelStartPosX+panelWidth panelStartPosY panelWidth panelHeight]);

uicontrol('Parent',hModulationPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+9*textHeight textWidth textHeight],...
    'Style','text','String','Envelope Type','FontSize',fontSizeMedium);

hModType = uicontrol('Parent',hModulationPanel,'Unit','Normalized', ...
    'BackgroundColor', backgroundColor, 'Position', ...
    [editStartPosX textStartPosY+9*textHeight editWidth textHeight], ...
    'Style','popup','String','None|DMR|Ripple Noise','FontSize',fontSizeMedium);

uicontrol('Parent',hModulationPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+8*textHeight textWidth textHeight],...
    'Style','text','String','Inst. Modulation Rate (Hz)','FontSize',fontSizeMedium);

hModRate = uicontrol('Parent',hModulationPanel,'Unit','Normalized', ...
    'BackgroundColor', backgroundColor, ...
    'Position',[editStartPosX textStartPosY+8*textHeight editWidth textHeight], ...
    'Style','edit','String','10','FontSize',fontSizeMedium);


uicontrol('Parent',hModulationPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+7*textHeight textWidth textHeight],...
    'Style','text','String','Ripple Density (cyc/oct)','FontSize',fontSizeMedium);

hRippleDensity = uicontrol('Parent',hModulationPanel,'Unit','Normalized', ...
    'BackgroundColor', backgroundColor, ...
    'Position',[editStartPosX textStartPosY+7*textHeight editWidth textHeight], ...
    'Style','edit','String','0','FontSize',fontSizeMedium);


uicontrol('Parent',hModulationPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+6*textHeight textWidth textHeight],...
    'Style','text','String','Modulation Depth (dB)','FontSize',fontSizeMedium);

hModDepth = uicontrol('Parent',hModulationPanel,'Unit','Normalized', ...
    'BackgroundColor', backgroundColor, ...
    'Position',[editStartPosX textStartPosY+6*textHeight editWidth textHeight], ...
    'Style','edit','String','10','FontSize',fontSizeMedium);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Actions Panel %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

hActionsPanel = uipanel('Title','Actions','fontSize', fontSizeLarge, ...
    'Unit','Normalized','Position',[panelStartPosX+2*panelWidth panelStartPosY panelWidth panelHeight]);


uicontrol('Parent',hActionsPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+9*textHeight 1 textHeight],...
    'Style','pushbutton','String','Create','FontSize',fontSizeMedium,...
    'Callback',{@Create_Callback});


uicontrol('Parent',hActionsPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+8*textHeight 1 textHeight],...
    'Style','pushbutton','String','Plot','FontSize',fontSizeMedium,...
    'Callback',{@Plot_Callback});


uicontrol('Parent',hActionsPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+7*textHeight 1 textHeight],...
    'Style','pushbutton','String','Analyse','FontSize',fontSizeMedium,...
    'Callback',{@Analyse_Callback});


uicontrol('Parent',hActionsPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+6*textHeight 1 textHeight],...
    'Style','pushbutton','String','Normalise','FontSize',fontSizeMedium,...
    'Callback',{@Normalise_Callback});


uicontrol('Parent',hActionsPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+5*textHeight 1 textHeight],...
    'Style','pushbutton','String','Play','FontSize',fontSizeMedium,...
    'Callback',{@Play_Callback});


uicontrol('Parent',hActionsPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+4*textHeight 1 textHeight],...
    'Style','pushbutton','String','Save','FontSize',fontSizeMedium,...
    'Callback',{@Save_Callback});


uicontrol('Parent',hActionsPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+3*textHeight 1 textHeight],...
    'Style','pushbutton','String','Clear Plot','FontSize',fontSizeMedium,...
    'Callback',{@cla_Callback});

uicontrol('Parent',hActionsPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+2*textHeight 1 textHeight],...
    'Style','pushbutton','String','Clear Workspace','FontSize',fontSizeMedium,...
    'Callback',{@claWS_Callback});


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Edit Panel %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

hEditPanel = uipanel('Title','Sound Properties','fontSize', fontSizeLarge, ...
    'Unit','Normalized','Position',[panelStartPosX 0 panelWidth panelHeight]);


uicontrol('Parent',hEditPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+9*textHeight textWidth textHeight],...
    'Style','text','String','Sound 1 Index','FontSize',fontSizeMedium);

hSound1Index = uicontrol('Parent',hEditPanel,'Unit','Normalized', ...
    'BackgroundColor', backgroundColor, 'Position', ...
    [editStartPosX textStartPosY+9*textHeight editWidth textHeight], ...
    'Style','edit','FontSize',fontSizeMedium);


uicontrol('Parent',hEditPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+8*textHeight textWidth textHeight],...
    'Style','text','String','Sound 1 Time','FontSize',fontSizeMedium);

hSound1TimeStart = uicontrol('Parent',hEditPanel,'Unit','Normalized', ...
    'BackgroundColor', backgroundColor, ...
    'Position',[editStartPosX textStartPosY+8*textHeight editWidth/2 textHeight], ...
    'Style','edit','FontSize',fontSizeMedium);

hSound1TimeEnd = uicontrol('Parent',hEditPanel,'Unit','Normalized', ...
    'BackgroundColor', backgroundColor, ...
    'Position',[editStartPosX+editWidth/2 textStartPosY+8*textHeight editWidth/2 textHeight], ...
    'Style','edit','FontSize',fontSizeMedium);


uicontrol('Parent',hEditPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+7*textHeight textWidth textHeight],...
    'Style','text','String','Sound 1 Amplitude','FontSize',fontSizeMedium);

hSound1Amplitude = uicontrol('Parent',hEditPanel,'Unit','Normalized', ...
    'BackgroundColor', backgroundColor, ...
    'Position',[editStartPosX textStartPosY+7*textHeight editWidth textHeight], ...
    'Style','edit','FontSize',fontSizeMedium);


uicontrol('Parent',hEditPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+6*textHeight textWidth textHeight],...
    'Style','text','String','Sound 2 Index','FontSize',fontSizeMedium);

hSound2Index = uicontrol('Parent',hEditPanel,'Unit','Normalized', ...
    'BackgroundColor', backgroundColor, ...
    'Position',[editStartPosX textStartPosY+6*textHeight editWidth textHeight], ...
    'Style','edit','FontSize',fontSizeMedium);


uicontrol('Parent',hEditPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+5*textHeight textWidth textHeight],...
    'Style','text','String','Sound 2 Time','FontSize',fontSizeMedium);

hSound2TimeStart = uicontrol('Parent',hEditPanel,'Unit','Normalized', ...
    'BackgroundColor', backgroundColor, ...
    'Position',[editStartPosX textStartPosY+5*textHeight editWidth/2 textHeight], ...
    'Style','edit','FontSize',fontSizeMedium);

hSound2TimeEnd = uicontrol('Parent',hEditPanel,'Unit','Normalized', ...
    'BackgroundColor', backgroundColor, ...
    'Position',[editStartPosX+editWidth/2 textStartPosY+5*textHeight editWidth/2 textHeight], ...
    'Style','edit','FontSize',fontSizeMedium);


uicontrol('Parent',hEditPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+4*textHeight textWidth textHeight],...
    'Style','text','String','Sound 2 Amplitude','FontSize',fontSizeMedium);

hSound2Amplitude = uicontrol('Parent',hEditPanel,'Unit','Normalized', ...
    'BackgroundColor', backgroundColor, ...
    'Position',[editStartPosX textStartPosY+4*textHeight editWidth textHeight], ...
    'Style','edit','FontSize',fontSizeMedium);


% uicontrol('Parent',hEditPanel,'Unit','Normalized', ...
%     'Position',[textStartPosX textStartPosY+3*textHeight textWidth textHeight],...
%     'Style','text','String','Translate At Time','FontSize',fontSizeMedium);
% 
% hTranslateAtTime = uicontrol('Parent',hEditPanel,'Unit','Normalized', ...
%     'BackgroundColor', backgroundColor, ...
%     'Position',[editStartPosX textStartPosY+3*textHeight editWidth textHeight], ...
%     'Style','edit','FontSize',fontSizeMedium);
% 
% 
% uicontrol('Parent',hEditPanel,'Unit','Normalized', ...
%     'Position',[textStartPosX textStartPosY+3*textHeight textWidth textHeight],...
%     'Style','text','String','Translate By Time','FontSize',fontSizeMedium);
% 
% hTranslateByTime = uicontrol('Parent',hEditPanel,'Unit','Normalized', ...
%     'BackgroundColor', backgroundColor, ...
%     'Position',[editStartPosX textStartPosY+3*textHeight editWidth textHeight], ...
%     'Style','edit','FontSize',fontSizeMedium);
% 
% 
% uicontrol('Parent',hEditPanel,'Unit','Normalized', ...
%     'Position',[textStartPosX textStartPosY+2*textHeight textWidth textHeight],...
%     'Style','text','String','Break Time','FontSize',fontSizeMedium);
% 
% hBreakFromTime = uicontrol('Parent',hEditPanel,'Unit','Normalized', ...
%     'BackgroundColor', backgroundColor, ...
%     'Position',[editStartPosX textStartPosY+2*textHeight editWidth/2 textHeight], ...
%     'Style','edit','FontSize',fontSizeMedium);
% 
% hBreakTillTime = uicontrol('Parent',hEditPanel,'Unit','Normalized', ...
%     'BackgroundColor', backgroundColor, ...
%     'Position',[editStartPosX+editWidth/2 textStartPosY+2*textHeight editWidth/2 textHeight], ...
%     'Style','edit','FontSize',fontSizeMedium);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% Edit Actions Panel %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

hEditActionsPanel = uipanel('Title','Actions','fontSize', fontSizeLarge, ...
    'Unit','Normalized','Position',[panelStartPosX+1*panelWidth 0 panelWidth panelHeight]);


uicontrol('Parent',hEditActionsPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+9*textHeight 1 textHeight],...
    'Style','pushbutton','String','Add','FontSize',fontSizeMedium,...
    'Callback',{@Add_Callback});


uicontrol('Parent',hEditActionsPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+8*textHeight 1 textHeight],...
    'Style','pushbutton','String','Break','FontSize',fontSizeMedium,...
    'Callback',{@Break_Callback});


uicontrol('Parent',hEditActionsPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+7*textHeight 1 textHeight],...
    'Style','pushbutton','String','Translate','FontSize',fontSizeMedium,...
    'Callback',{@Translate_Callback});


uicontrol('Parent',hEditActionsPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+6*textHeight 1 textHeight],...
    'Style','pushbutton','String','Stitch','FontSize',fontSizeMedium,...
    'Callback',{@Stitch_Callback});


% uicontrol('Parent',hEditActionsPanel,'Unit','Normalized', ...
%     'Position',[textStartPosX textStartPosY+5*textHeight 1 textHeight],...
%     'Style','pushbutton','String','Trim','FontSize',fontSizeMedium,...
%     'Callback',{@Trim_Callback});


uicontrol('Parent',hEditActionsPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+5*textHeight 1 textHeight],...
    'Style','pushbutton','String','Analyse','FontSize',fontSizeMedium,...
    'Callback',{@EditAnalyse_Callback});


uicontrol('Parent',hEditActionsPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+4*textHeight 1 textHeight],...
    'Style','pushbutton','String','Play','FontSize',fontSizeMedium,...
    'Callback',{@PlayEdit_Callback});


uicontrol('Parent',hEditActionsPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+3*textHeight 1 textHeight],...
    'Style','pushbutton','String','Push','FontSize',fontSizeMedium,...
    'Callback',{@Push_Callback});

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Plots %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

hSoundPlot = subplot('Position',[0.5 0.51 0.45 0.45]);
hEditSoundPlot = subplot('Position',[0.5 0.05 0.45 0.40]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Functions %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    function Create_Callback(~,~)
        
        % initialise
        
        f1 = str2double(get(hBaseFreq,'string')); % base frequency (Hz)
        nFreq = str2double(get(hTotalFreq,'string')); % Total no. of Frequencies
        NfrOct = str2double(get(hOctFreq,'string')); % No. of frequencies per octave
        soundDur = str2double(get(hSoundDur,'string')); % Sound duration (ms)
        Fs = str2double(get(hSoundFs,'string')); % sampling frequency (Hz) of sound
        FreqPhase = get(hFreqPhase,'val');
        SoundType = get(hSoundType,'val');
        FreqSeperationType = get(hFreqSeperationType,'val');
                
        Fm = str2double(get(hModRate,'string')); % Instantaneous Modulation Rate (Hz)
        rippleDensity   = str2double(get(hRippleDensity,'string')); % Capital Omega (cyc/oct)
        ModType = get(hModType,'val');
        ModDepth   = str2double(get(hModDepth,'string')); % Modulation depth of the envelope (dB)
        
        if SoundType == 4
            Fs = evalin('base', 'fs');
            soundData = evalin('base', 'data');
            soundDur = (size(soundData,1)/Fs)*1000;
        end
        
        soundExist = evalin('base','(exist(''soundFile'',''var''))');
        if soundExist == 0
            soundFile = [];
            unmodSoundFile = [];
        else
            soundFile=evalin('base','soundFile');
            unmodSoundFile=evalin('base','unmodSoundFile');
        end
                
        % calculations
        
        FreqStep = 1:1:nFreq; % every frequency step
        Xk = FreqStep/NfrOct; % Octave frequency axis relative to f1
        if FreqSeperationType == 1
            fk = f1 * Xk; % linear frequency axis (Hz)
        else
            fk = f1 * 2.^Xk; % log 2 frequency axis (Hz)
        end
        
        ChirpRate = (fk(nFreq)-f1)/(soundDur/1000);
        lengthSound = round((soundDur/1000)*Fs); % # Samples for Rippled Noise
        timeAxis  = 0:1/Fs:(lengthSound-1)/Fs; % Time Axis (s)

        % Calculating SDMR
        if ModType==2
            disp('Calculating SDMR');
            for T=1:length(timeAxis)
                for X=1:nFreq
                    Sdmr(T,X) = (ModDepth/2)*(sin((2*pi*rippleDensity*Xk(X)) + (2*pi*Fm*timeAxis(T))));
                end
            end
        end

        % Calculating SLIN
        disp('Calculating SLIN');
        if ModType == 1 % No Modulation
            for T=1:length(timeAxis)
                for X=1:nFreq
                    Slin(T,X)=ModDepth;
                end
            end
        else    
            for T=1:length(timeAxis)
                for X=1:nFreq
                    Slin(T,X)=10^(((Sdmr(T,X))-(ModDepth/2))/20);
                end
            end
        end
        
        % Calculating the acoustic waveform
        disp('Calculating the acoustic waveform');
 
        if SoundType == 1 % Sinusoidal carrier
             for k = 1:nFreq
                if FreqPhase == 1
                  Phi=0;
                else
                  Phi=2*pi*rand(1);
                end
                carrier=Slin(:,k)'.*sin(2*pi* fk(k) .* timeAxis + Phi);
                unmodCarrier = sin(2*pi* fk(k) .* timeAxis + Phi);
                if k==1
                    unmodSoundFileData= unmodCarrier;
                    soundFileData= carrier;                    
                else
                    unmodSoundFileData = unmodSoundFileData + unmodCarrier;
                    soundFileData = soundFileData + carrier;
                end
             end
             
        elseif SoundType == 2 % Linear chirp
            for k = 1:nFreq
                if FreqPhase == 1
                  Phi=0;
                else
                  Phi=2*pi*rand(1);
                end
                carrier=Slin(:,k)'.*(sin(2*pi* (fk(k) .* timeAxis + ChirpRate *(timeAxis.*timeAxis)) + Phi));
                unmodCarrier = sin(2*pi* (fk(k) .* timeAxis + ChirpRate *(timeAxis.*timeAxis)) + Phi);
                if k==1
                    unmodSoundFileData= unmodCarrier;
                    soundFileData= carrier;                    
                else
                    unmodSoundFileData = unmodSoundFileData + unmodCarrier;
                    soundFileData = soundFileData + carrier;
                end
             end
             
        elseif SoundType == 3 % Exponential Chirp
            for k = 1:nFreq
                if FreqPhase == 1
                  Phi=0;
                else
                  Phi=2*pi*rand(1);
                end
                carrier=Slin(:,k)'.*(sin(2*pi*f1*(((ChirpRate.^timeAxis)-1)/(log(ChirpRate))) + Phi));
                unmodCarrier = sin(2*pi*f1*(((ChirpRate.^timeAxis)-1)/(log(ChirpRate))) + Phi);
                if k==1
                    unmodSoundFileData= unmodCarrier;
                    soundFileData= carrier;                    
                else
                    unmodSoundFileData = unmodSoundFileData + unmodCarrier;
                    soundFileData = soundFileData + carrier;
                end
            end
            
        else
            for k = 1:nFreq
                if FreqPhase == 1
                  Phi=0;
                else
                  Phi=2*pi*rand(1);
                end
                carrier=Slin(:,k)'.*(soundData');
                unmodCarrier = soundData';
                if k==1
                    unmodSoundFileData= unmodCarrier;
                    soundFileData= carrier;                    
                else
                    unmodSoundFileData = unmodSoundFileData + unmodCarrier;
                    soundFileData = soundFileData + carrier;
                end
            end
             
        end
        
        unmodSoundFile = [unmodSoundFile;unmodSoundFileData];
        soundFile=[soundFile;soundFileData];
        
        assignin('base','timeAxis',timeAxis);
        assignin('base','soundFile',soundFile);
        assignin('base','unmodSoundFile',unmodSoundFile);
        
        plot(hSoundPlot,timeAxis,soundFile);
    end

    function Plot_Callback(~,~)
        SoundIndex = str2double(get(hSoundIndex,'string')); % Sound Index
        soundFile=evalin('base','soundFile');
        timeAxis=evalin('base','timeAxis');
        plot(hSoundPlot,timeAxis,soundFile(SoundIndex,:));
    end

    function Analyse_Callback(~,~)
        figure; hold on; 
        
        hUnmodSoundPlot = subplot('Position',[0.02 0.70 0.45 0.28]);
        hModSoundPlot = subplot('Position',[0.5 0.70 0.45 0.28]);
        
        hUnmodPowerPlot = subplot('Position',[0.02 0.38 0.45 0.28]);
        hModPowerPlot = subplot('Position',[0.5 0.38 0.45 0.28]);
        
        hUnmodPowerChangePlot = subplot('Position',[0.02 0.05 0.45 0.28]);
        hModPowerChangePlot = subplot('Position',[0.5 0.05 0.45 0.28]);
        
        soundFile=evalin('base','soundFile');
        timeAxis=evalin('base','timeAxis');
        unmodSoundFile=evalin('base','unmodSoundFile');
        Fs = str2double(get(hSoundFs,'string')); % sampling frequency (Hz)
        SoundIndex = str2double(get(hSoundIndex,'string')); % Sound Index

        % Raw Power Spectrum
        params=defparams([3 5],Fs);
        
        plot(hUnmodSoundPlot,timeAxis,unmodSoundFile(SoundIndex,:));
        plot(hModSoundPlot,timeAxis,soundFile(SoundIndex,:));
        
        [spec,tim,fre]=mtspecgramc(unmodSoundFile(SoundIndex,:)',[0.1 0.01],params);
        pcolor(hUnmodPowerPlot,tim,fre,log10(spec')); shading(hUnmodPowerPlot, 'interp');
        pchangespecgramc(unmodSoundFile(SoundIndex,:),timeAxis,params,[0 0.1],0.01,Fs,hUnmodPowerChangePlot);
        
        [spec2,tim2,fre2]=mtspecgramc(soundFile(SoundIndex,:)',[0.1 0.01],params);
        pcolor(hModPowerPlot,tim2,fre2,log10(spec2')); shading(hModPowerPlot, 'interp');
        pchangespecgramc(soundFile(SoundIndex,:),timeAxis,params,[0 0.1],0.01,Fs,hModPowerChangePlot);
    end

    function Normalise_Callback(~,~)
        SoundIndex = str2double(get(hSoundIndex,'string')); % Sound Index
        soundFile=evalin('base','soundFile');
        timeAxis=evalin('base','timeAxis');
        [normalisedSound] = soundNormalise(soundFile(SoundIndex,:));
        soundFile(SoundIndex,:)=normalisedSound;
        assignin('base','soundFile',soundFile);
        
        plot(hSoundPlot,timeAxis,soundFile(SoundIndex,:));
        Analyse_Callback;
    end

    function Play_Callback(~,~)
        SoundIndex = str2double(get(hSoundIndex,'string')); % Sound Index
        soundFile=evalin('base','soundFile');
        timeAxis=evalin('base','timeAxis');
        Fs = str2double(get(hSoundFs,'string')); % sampling frequency (Hz)
        SoundType = get(hSoundType,'val');
        if SoundType == 4
            Fs = evalin('base', 'fs');            
        end
        
        audioPlayer = audioplayer(soundFile(SoundIndex,:),Fs);
        disp('Playing Sound');
        audioPlayer.play;
        pause(1);
    end

    function cla_Callback(~,~)
        cla(hSoundPlot);
        cla(hEditSoundPlot);
    end

    function claWS_Callback(~,~)
        evalin('base','clear all');
    end

    function Add_Callback(~,~)
        
        Sound1Index = str2double(get(hSound1Index,'string')); 
        Sound2Index = str2double(get(hSound2Index,'string')); 
        
        Sound1TimeStart = str2double(get(hSound1TimeStart,'string'));
        Sound1TimeEnd = str2double(get(hSound1TimeEnd,'string'));
        
        Sound2TimeStart = str2double(get(hSound2TimeStart,'string'));
        Sound2TimeEnd = str2double(get(hSound2TimeEnd,'string'));
        
        Sound1Amplitude = str2double(get(hSound1Amplitude,'string'));
        Sound2Amplitude = str2double(get(hSound2Amplitude,'string'));
        
        Fs = str2double(get(hSoundFs,'string'));
        
        soundFile=evalin('base','soundFile');        
        timeAxis=evalin('base','timeAxis');        
        
        Sound1StartIndex = round((Sound1TimeStart/1000)*Fs)+1;
        Sound1StopIndex = round((Sound1TimeEnd/1000)*Fs);
        
        Sound2StartIndex = round((Sound2TimeStart/1000)*Fs)+1;
        Sound2StopIndex = round((Sound2TimeEnd/1000)*Fs);
        
        Sound1 = Sound1Amplitude*soundFile(Sound1Index,:);
        Sound2 = Sound2Amplitude*soundFile(Sound2Index,Sound2StartIndex:Sound2StopIndex);
        
        Sound12 = [zeros(1,(Sound1StartIndex-1)) Sound2 zeros(1,(length(Sound1)-Sound1StopIndex))];
        EditedSound = Sound1 + Sound12;
        
        plot(hEditSoundPlot,timeAxis,EditedSound);
        
        assignin('base','EditedSound',EditedSound);
        
    end

    function Break_Callback(~,~)
        Sound1Index = str2double(get(hSound1Index,'string')); 
                
        Sound1TimeStart = str2double(get(hSound1TimeStart,'string'));
        Sound1TimeEnd = str2double(get(hSound1TimeEnd,'string'));
        
                
        Sound1Amplitude = str2double(get(hSound1Amplitude,'string'));
        
        Fs = str2double(get(hSoundFs,'string'));
        
        soundFile=evalin('base','soundFile');        
        timeAxis=evalin('base','timeAxis');        
        
        Sound1StartIndex = round((Sound1TimeStart/1000)*Fs)+1;
        Sound1StopIndex = round((Sound1TimeEnd/1000)*Fs);
        
        Sound1 = Sound1Amplitude*soundFile(Sound1Index,:);

        Sound1(1,Sound1StartIndex:Sound1StopIndex)=0;
        
        EditedSound = Sound1;
        
        plot(hEditSoundPlot,timeAxis,EditedSound);
        
        assignin('base','EditedSound',EditedSound);
    end

    function Translate_Callback(~,~)
        Sound1Index = str2double(get(hSound1Index,'string')); 
                
        Sound1TimeBreak = str2double(get(hSound1TimeStart,'string'));
        Sound1TimeNewStart = str2double(get(hSound1TimeEnd,'string'));
        
                
        Sound1Amplitude = str2double(get(hSound1Amplitude,'string'));
        
        Fs = str2double(get(hSoundFs,'string'));
        
        soundFile=evalin('base','soundFile');        
        timeAxis=evalin('base','timeAxis');        
        
        Sound1BreakIndex = round((Sound1TimeBreak/1000)*Fs)+1;
        Sound1NewStartIndex = round((Sound1TimeNewStart/1000)*Fs);
        
        Sound1 = Sound1Amplitude*soundFile(Sound1Index,:);
        
        SoundStartPiece = Sound1(1,(1:Sound1BreakIndex-1));        
        SoundEndPiece = Sound1(1,Sound1BreakIndex:(length(Sound1)-(Sound1NewStartIndex-Sound1BreakIndex)));
        
        EditedSound = [SoundStartPiece zeros(1,(Sound1NewStartIndex-Sound1BreakIndex)) SoundEndPiece];
        
        plot(hEditSoundPlot,timeAxis,EditedSound);
        
        assignin('base','EditedSound',EditedSound);
    end

    function Stitch_Callback(~,~)
        Sound1Index = str2double(get(hSound1Index,'string')); 
        Sound2Index = str2double(get(hSound2Index,'string')); 
        
        Sound1TimeStart = str2double(get(hSound1TimeStart,'string'));
        Sound1TimeEnd = str2double(get(hSound1TimeEnd,'string'));
        
        Sound2TimeStart = str2double(get(hSound2TimeStart,'string'));
        Sound2TimeEnd = str2double(get(hSound2TimeEnd,'string'));
        
        Sound1Amplitude = str2double(get(hSound1Amplitude,'string'));
        Sound2Amplitude = str2double(get(hSound2Amplitude,'string'));
        
        Fs = str2double(get(hSoundFs,'string'));
        
        soundFile=evalin('base','soundFile');        
        timeAxis=evalin('base','timeAxis');        
        
        Sound1StartIndex = round((Sound1TimeStart/1000)*Fs)+1;
        Sound1StopIndex = round((Sound1TimeEnd/1000)*Fs);
        
        Sound2StartIndex = round((Sound2TimeStart/1000)*Fs)+1;
        Sound2StopIndex = round((Sound2TimeEnd/1000)*Fs);
        
        Sound1 = Sound1Amplitude*soundFile(Sound1Index,:);
        Sound1(1,Sound1StartIndex:Sound1StopIndex) = 0;
        
        Sound2 = Sound2Amplitude*soundFile(Sound2Index,Sound2StartIndex:Sound2StopIndex);
        
        Sound12 = [zeros(1,(Sound1StartIndex-1)) Sound2 zeros(1,(length(Sound1)-Sound1StopIndex))];
        EditedSound = Sound1 + Sound12;
        
        plot(hEditSoundPlot,timeAxis,EditedSound);
        
        assignin('base','EditedSound',EditedSound);
    end

    function EditAnalyse_Callback(~,~)
        figure; hold on; 
        
        hUnmodSoundPlot = subplot('Position',[0.02 0.70 0.45 0.28]);
        hModSoundPlot = subplot('Position',[0.5 0.70 0.45 0.28]);
        
        hUnmodPowerPlot = subplot('Position',[0.02 0.38 0.45 0.28]);
        hModPowerPlot = subplot('Position',[0.5 0.38 0.45 0.28]);
        
        hUnmodPowerChangePlot = subplot('Position',[0.02 0.05 0.45 0.28]);
        hModPowerChangePlot = subplot('Position',[0.5 0.05 0.45 0.28]);
        
%         soundFile=evalin('base','soundFile');
        soundFile=evalin('base','EditedSound');
        timeAxis=evalin('base','timeAxis');
        unmodSoundFile=evalin('base','unmodSoundFile');
        Fs = str2double(get(hSoundFs,'string')); % sampling frequency (Hz)
        SoundIndex = str2double(get(hSound1Index,'string')); % Sound Index

        % Raw Power Spectrum
        params=defparams([3 5],Fs);
        
        plot(hUnmodSoundPlot,timeAxis,unmodSoundFile(SoundIndex,:));
        plot(hModSoundPlot,timeAxis,soundFile);
        
        [spec,tim,fre]=mtspecgramc(unmodSoundFile(SoundIndex,:)',[0.1 0.01],params);
        pcolor(hUnmodPowerPlot,tim,fre,log10(spec')); shading(hUnmodPowerPlot, 'interp');
        pchangespecgramc(unmodSoundFile(SoundIndex,:),timeAxis,params,[0 0.1],0.01,Fs,hUnmodPowerChangePlot);
        
        [spec2,tim2,fre2]=mtspecgramc(soundFile',[0.1 0.01],params);
        pcolor(hModPowerPlot,tim2,fre2,log10(spec2')); shading(hModPowerPlot, 'interp');
        pchangespecgramc(soundFile,timeAxis,params,[0 0.1],0.01,Fs,hModPowerChangePlot);
        
    end

    function PlayEdit_Callback(~,~)
        SoundType = get(hSoundType,'val');
        soundFile=evalin('base','EditedSound');
        Fs = str2double(get(hSoundFs,'string')); % sampling frequency (Hz)
        
        if SoundType == 4
            Fs = evalin('base', 'fs');            
        end
        
        audioPlayerEdit = audioplayer(soundFile,Fs);
        disp('Playing Sound');
        audioPlayerEdit.play;
        pause(1);
    end

    function Push_Callback(~,~)
        EditedSound=evalin('base','EditedSound');
        unmodSoundFile=evalin('base','soundFile');
        soundFile=evalin('base','soundFile');
        SoundIndex = str2double(get(hSound1Index,'string'));
        
        unmodSoundFile=[unmodSoundFile;soundFile(SoundIndex,:)];
        soundFile=[soundFile;EditedSound];
        assignin('base','soundFile',soundFile);
        assignin('base','unmodSoundFile',unmodSoundFile);        
    end
end
