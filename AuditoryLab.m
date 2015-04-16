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
    'Style','popup','String','Sinusoidal','FontSize',fontSizeMedium);


uicontrol('Parent',hSoundPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+8*textHeight textWidth textHeight],...
    'Style','text','String','Sound Index','FontSize',fontSizeMedium);

hSoundIndex = uicontrol('Parent',hSoundPanel,'Unit','Normalized', ...
    'BackgroundColor', backgroundColor, ...
    'Position',[editStartPosX textStartPosY+8*textHeight editWidth textHeight], ...
    'Style','edit','String','1','FontSize',fontSizeMedium);


uicontrol('Parent',hSoundPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+7*textHeight textWidth textHeight],...
    'Style','text','String','Lowest Freq (Hz)','FontSize',fontSizeMedium);

hBaseFreq = uicontrol('Parent',hSoundPanel,'Unit','Normalized', ...
    'BackgroundColor', backgroundColor, ...
    'Position',[editStartPosX textStartPosY+7*textHeight editWidth textHeight], ...
    'Style','edit','String','250','FontSize',fontSizeMedium);


uicontrol('Parent',hSoundPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+6*textHeight textWidth textHeight],...
    'Style','text','String','No. of Octaves','FontSize',fontSizeMedium);

hOct = uicontrol('Parent',hSoundPanel,'Unit','Normalized', ...
    'BackgroundColor', backgroundColor, ...
    'Position',[editStartPosX textStartPosY+6*textHeight editWidth textHeight], ...
    'Style','edit','String','5','FontSize',fontSizeMedium);


uicontrol('Parent',hSoundPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+5*textHeight textWidth textHeight],...
    'Style','text','String','Freq/octave','FontSize',fontSizeMedium);

hOctFreq = uicontrol('Parent',hSoundPanel,'Unit','Normalized', ...
    'BackgroundColor', backgroundColor, ...
    'Position',[editStartPosX textStartPosY+5*textHeight editWidth textHeight], ...
    'Style','edit','String','20','FontSize',fontSizeMedium);


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
    'Style','edit','String','16384','FontSize',fontSizeMedium);


uicontrol('Parent',hSoundPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+2*textHeight textWidth textHeight],...
    'Style','text','String','Phase of different freqs.','FontSize',fontSizeMedium);

hFreqPhase = uicontrol('Parent',hSoundPanel,'Unit','Normalized', ...
    'BackgroundColor', backgroundColor, ...
    'Position',[editStartPosX textStartPosY+2*textHeight editWidth textHeight], ...
    'Style','popup','String','Random|Not random|Load|Save','FontSize',fontSizeMedium);


uicontrol('Parent',hSoundPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+1*textHeight textWidth textHeight],...
    'Style','text','String','Freq Seperation','FontSize',fontSizeMedium);

hFreqSeperationType = uicontrol('Parent',hSoundPanel,'Unit','Normalized', ...
    'BackgroundColor', backgroundColor, 'Position', ...
    [editStartPosX textStartPosY+1*textHeight editWidth textHeight], ...
    'Style','popup','String','Log 2|Harmonic','FontSize',fontSizeMedium);


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
    'Style','popup','String','Moving ripple','FontSize',fontSizeMedium);

uicontrol('Parent',hModulationPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+8*textHeight textWidth textHeight],...
    'Style','text','String','Ripple velocity (Hz)','FontSize',fontSizeMedium);

hModRate = uicontrol('Parent',hModulationPanel,'Unit','Normalized', ...
    'BackgroundColor', backgroundColor, ...
    'Position',[editStartPosX textStartPosY+8*textHeight editWidth textHeight], ...
    'Style','edit','String','8','FontSize',fontSizeMedium);

uicontrol('Parent',hModulationPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+7*textHeight textWidth textHeight],...
    'Style','text','String','Ripple density (cyc/oct)','FontSize',fontSizeMedium);

hRippleDensity = uicontrol('Parent',hModulationPanel,'Unit','Normalized', ...
    'BackgroundColor', backgroundColor, ...
    'Position',[editStartPosX textStartPosY+7*textHeight editWidth textHeight], ...
    'Style','edit','String','1','FontSize',fontSizeMedium);

uicontrol('Parent',hModulationPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+6*textHeight textWidth textHeight],...
    'Style','text','String','Ripple Amplitude (0-1)','FontSize',fontSizeMedium);

hModDepth = uicontrol('Parent',hModulationPanel,'Unit','Normalized', ...
    'BackgroundColor', backgroundColor, ...
    'Position',[editStartPosX textStartPosY+6*textHeight editWidth textHeight], ...
    'Style','edit','String','1','FontSize',fontSizeMedium);

uicontrol('Parent',hModulationPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+5*textHeight textWidth textHeight],...
    'Style','text','String','Background Loudness (dB)','FontSize',fontSizeMedium);

hBGLoudness = uicontrol('Parent',hModulationPanel,'Unit','Normalized', ...
    'BackgroundColor', backgroundColor, ...
    'Position',[editStartPosX textStartPosY+5*textHeight editWidth textHeight], ...
    'Style','edit','String','60','FontSize',fontSizeMedium);

uicontrol('Parent',hModulationPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+4*textHeight textWidth textHeight],...
    'Style','text','String','Roll off (dB)','FontSize',fontSizeMedium);

hRollOff = uicontrol('Parent',hModulationPanel,'Unit','Normalized', ...
    'BackgroundColor', backgroundColor, ...
    'Position',[editStartPosX textStartPosY+4*textHeight editWidth textHeight], ...
    'Style','edit','String','0','FontSize',fontSizeMedium);

uicontrol('Parent',hModulationPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+3*textHeight textWidth textHeight],...
    'Style','text','String','Modulation Depth (0-1)','FontSize',fontSizeMedium);

hMo = uicontrol('Parent',hModulationPanel,'Unit','Normalized', ...
    'BackgroundColor', backgroundColor, ...
    'Position',[editStartPosX textStartPosY+3*textHeight editWidth textHeight], ...
    'Style','edit','String','0.9','FontSize',fontSizeMedium);

uicontrol('Parent',hModulationPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+2*textHeight textWidth textHeight],...
    'Style','text','String','Max. temporal vel. (Hz)','FontSize',fontSizeMedium);

hwM = uicontrol('Parent',hModulationPanel,'Unit','Normalized', ...
    'BackgroundColor', backgroundColor, ...
    'Position',[editStartPosX textStartPosY+2*textHeight editWidth textHeight], ...
    'Style','edit','String','120','FontSize',fontSizeMedium);


uicontrol('Parent',hModulationPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+1*textHeight textWidth textHeight],...
    'Style','text','String','Phase (x*pi)','FontSize',fontSizeMedium);

hEnPhi = uicontrol('Parent',hModulationPanel,'Unit','Normalized', ...
    'BackgroundColor', backgroundColor, ...
    'Position',[editStartPosX textStartPosY+1*textHeight editWidth textHeight], ...
    'Style','edit','String','0','FontSize',fontSizeMedium);

uicontrol('Parent',hModulationPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+0*textHeight textWidth textHeight],...
    'Style','text','String','Amplitude flag','FontSize',fontSizeMedium);

hAF = uicontrol('Parent',hModulationPanel,'Unit','Normalized', ...
    'BackgroundColor', backgroundColor, ...
    'Position',[editStartPosX textStartPosY+0*textHeight editWidth textHeight], ...
    'Style','popup','String','Linear','FontSize',fontSizeMedium);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Actions Panel %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ButtonWidth = 0.5;

hActionsPanel = uipanel('Title','Actions','fontSize', fontSizeLarge, ...
    'Unit','Normalized','Position',[panelStartPosX+2*panelWidth panelStartPosY panelWidth panelHeight]);


uicontrol('Parent',hActionsPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+9*textHeight ButtonWidth textHeight],...
    'Style','pushbutton','String','Create','FontSize',fontSizeMedium,...
    'Callback',{@Create_Callback});

uicontrol('Parent',hActionsPanel,'Unit','Normalized', ...
    'Position',[textStartPosX+ButtonWidth textStartPosY+9*textHeight ButtonWidth textHeight],...
    'Style','pushbutton','String','Ramp','FontSize',fontSizeMedium,...
    'Callback',{@Ramp_Callback});

uicontrol('Parent',hActionsPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+8*textHeight ButtonWidth textHeight],...
    'Style','pushbutton','String','Plot','FontSize',fontSizeMedium,...
    'Callback',{@Plot_Callback});

uicontrol('Parent',hActionsPanel,'Unit','Normalized', ...
    'Position',[textStartPosX+ButtonWidth textStartPosY+8*textHeight ButtonWidth/2 textHeight],...
    'Style','text','String','sec','FontSize',fontSizeMedium);

hRampTime = uicontrol('Parent',hActionsPanel,'Unit','Normalized', ...
    'BackgroundColor', backgroundColor, ...
    'Position',[textStartPosX+((3/2)*ButtonWidth) textStartPosY+8*textHeight ButtonWidth/2 textHeight], ...
    'Style','edit','String','0.01','FontSize',fontSizeMedium);

uicontrol('Parent',hActionsPanel,'Unit','Normalized', ...
    'Position',[textStartPosX+ButtonWidth textStartPosY+7*textHeight ButtonWidth textHeight],...
    'Style','pushbutton','String','Play','FontSize',fontSizeMedium,...
    'Callback',{@Play_Callback});

uicontrol('Parent',hActionsPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+7*textHeight ButtonWidth textHeight],...
    'Style','pushbutton','String','Analyse','FontSize',fontSizeMedium,...
    'Callback',{@Analyse_Callback});

uicontrol('Parent',hActionsPanel,'Unit','Normalized', ...
    'Position',[textStartPosX+ButtonWidth textStartPosY+6*textHeight ButtonWidth textHeight],...
    'Style','pushbutton','String','Save','FontSize',fontSizeMedium,...
    'Callback',{@Save_Callback});

uicontrol('Parent',hActionsPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+6*textHeight ButtonWidth textHeight],...
    'Style','pushbutton','String','Normalise','FontSize',fontSizeMedium,...
    'Callback',{@Normalise_Callback});

uicontrol('Parent',hActionsPanel,'Unit','Normalized', ...
    'Position',[textStartPosX+ButtonWidth textStartPosY+5*textHeight ButtonWidth/2 textHeight],...
    'Style','text','String','(.wav)','FontSize',fontSizeMedium);

uicontrol('Parent',hActionsPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+5*textHeight ButtonWidth textHeight],...
    'Style','pushbutton','String','Clear Plot','FontSize',fontSizeMedium,...
    'Callback',{@cla_Callback});

hFileName = uicontrol('Parent',hActionsPanel,'Unit','Normalized', ...
    'BackgroundColor', backgroundColor, ...
    'Position',[textStartPosX+((3/2)*ButtonWidth) textStartPosY+5*textHeight ButtonWidth/2 textHeight], ...
    'Style','edit','FontSize',fontSizeMedium);

uicontrol('Parent',hActionsPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+4*textHeight ButtonWidth textHeight],...
    'Style','pushbutton','String','Clear Workspace','FontSize',fontSizeMedium,...
    'Callback',{@claWS_Callback});

hCompare = uicontrol('Parent',hActionsPanel,'Unit','Normalized', ...
    'Position',[textStartPosX+(ButtonWidth) textStartPosY+4*textHeight ButtonWidth textHeight],...
    'Style','togglebutton','String','Compare','FontSize',fontSizeMedium,...
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Binaural Panel %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

hBinauralPanel = uipanel('Title','Binaural Hearing','fontSize', fontSizeLarge, ...
    'Unit','Normalized','Position',[panelStartPosX+2*panelWidth 0 panelWidth panelHeight]);


uicontrol('Parent',hBinauralPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+9*textHeight textWidth textHeight],...
    'Style','text','String','Sound Index','FontSize',fontSizeMedium);

hBinauralSoundIndex = uicontrol('Parent',hBinauralPanel,'Unit','Normalized', ...
    'BackgroundColor', backgroundColor, 'Position', ...
    [editStartPosX textStartPosY+9*textHeight editWidth textHeight], ...
    'Style','edit','FontSize',fontSizeMedium);

uicontrol('Parent',hBinauralPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+8*textHeight textWidth textHeight],...
    'Style','text','String','ITD (microseconds)','FontSize',fontSizeMedium);

hITD = uicontrol('Parent',hBinauralPanel,'Unit','Normalized', ...
    'BackgroundColor', backgroundColor, 'Position', ...
    [editStartPosX textStartPosY+8*textHeight editWidth textHeight], ...
    'Style','edit','FontSize',fontSizeMedium);

uicontrol('Parent',hBinauralPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+7*textHeight textWidth textHeight],...
    'Style','text','String','Direction','FontSize',fontSizeMedium);

hLagChannel = uicontrol('Parent',hBinauralPanel,'Unit','Normalized', ...
    'BackgroundColor', backgroundColor, 'Position', ...
    [editStartPosX textStartPosY+7*textHeight editWidth textHeight], ...
    'Style','popup','string','Right|Left','FontSize',fontSizeMedium);

uicontrol('Parent',hBinauralPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+6*textHeight 1 textHeight],...
    'Style','pushbutton','String','Create','FontSize',fontSizeMedium,...
    'Callback',{@CreateBinaural_Callback});

uicontrol('Parent',hBinauralPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+5*textHeight 1 textHeight],...
    'Style','pushbutton','String','Play','FontSize',fontSizeMedium,...
    'Callback',{@PlayBinaural_Callback});

uicontrol('Parent',hBinauralPanel,'Unit','Normalized', ...
    'Position',[textStartPosX textStartPosY+4*textHeight textWidth textHeight],...
    'Style','pushbutton','String','Append with Sound Index','FontSize',fontSizeMedium,...
    'Callback',{@AppendBinaural_Callback});

hAppendSoundIndex = uicontrol('Parent',hBinauralPanel,'Unit','Normalized', ...
    'BackgroundColor', backgroundColor, 'Position', ...
    [editStartPosX textStartPosY+4*textHeight editWidth textHeight], ...
    'Style','edit','FontSize',fontSizeMedium);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Plots %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

hSoundPlot = subplot('Position',[0.5 0.51 0.45 0.45]);
hEditSoundPlot = subplot('Position',[0.5 0.05 0.45 0.40]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Functions %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    function Create_Callback(~,~)
%% Initialisation
        Am   = str2double(get(hModDepth,'string')); % Modulation depth of the envelope
        w = str2double(get(hModRate,'string')); % Instantaneous Modulation Rate (Hz)
        Om   = str2double(get(hRippleDensity,'string')); % Capital Omega (cyc/oct)
        Ph = str2double(get(hEnPhi,'string'))*pi;
        
        T0 = str2double(get(hSoundDur,'string')); % Sound duration (ms)
        f0 = str2double(get(hBaseFreq,'string')); % base frequency (Hz)
        BW = str2double(get(hOct,'string')); % Total no. of octaves
        SF = str2double(get(hSoundFs,'string')); % sampling frequency (Hz) of sound
        CF = get(hFreqSeperationType,'val');
        dfA = str2double(get(hOctFreq,'string'));
        df = 1/dfA;
        RO = str2double(get(hRollOff,'string'));
        AF = (get(hAF,'val'));
        Mo = str2double(get(hMo,'string'));
        wM = str2double(get(hwM,'string'));
        PhFlag = get(hFreqPhase,'val')-1;
        
        % Others
        SoundType = get(hSoundType,'val');
        ModType = get(hModType,'val');
        BGLoudness = str2double(get(hBGLoudness,'string')); % Background Loudness (dB)
        CompareVal = get(hCompare,'val');
        
        soundExist = evalin('base','(exist(''soundFile'',''var''))');
        if soundExist == 0
            soundFile = [];
            unmodSoundFile = [];
            Frequencies=[];
            XkV = [];
        else
            soundFile=evalin('base','soundFile');
            unmodSoundFile=evalin('base','unmodSoundFile');
            Frequencies=evalin('base','Frequencies');
            XkV = evalin('base','XkV');
        end
        
        T0=T0/1000;
        lengthSound = round((T0)*SF); 
        timeAxis  = 0:1/SF:(lengthSound-1)/SF; % Time Axis (s)

        rippleList = [Am w Om Ph];
        
        cond = [T0,f0,BW,SF,CF,df,RO,AF,Mo,wM,4];
        comp_phs_file='C:\Users\LabComputer6\Documents\MATLAB\Programs\Downloaded\baphy\SoundObjects\@Torc\Sounds\save_comp_phs';
        
        
        
        
%% Calculations  


%% Frequency Axis

        if CF==2	%compute tones freqs
            R1 = round(2.^([-1 1]*BW/2)*f0/df); 
            fk = df*(R1(1):R1(2))';
        else	%compute log-spaced tones freqs
            R1 = round((BW/2)/df); 
            fk = f0*2.^((-R1:R1)*df)';
        end;
        
        Xk = log2(fk/f0);
        f_env_size = length(fk); 
         
% Ph2 = Ph/pi-1/2;
% rippleList2 = rippleList; rippleList2(:,4) = Ph2;
% cond2=[T0, f0, SF, BW, RO, df, Mo];        
% [s4,fk,Xk,th] = mvripfft_Shihab_Original(rippleList2, cond2);
%% Envelope
        if ModType==1
            disp('Calculating Envelope profile for moving ripple...');
            EnProfile = makeSumRipples(rippleList,Xk,timeAxis,Mo);            
        end

%% Waveform
        switch PhFlag
        case 0
            th = 2*pi*rand(f_env_size,1);	% component phase, theta
        case 1
            th = zeros(f_env_size,1);
        case 2
            fp = load(comp_phs_file);
            th = fp.th;
        case 3
            th = 2*pi*rand(f_env_size,1);	% component phase, theta
            save(comp_phs_file,'th');%Save component phases
        otherwise
            error('Invalid selection');
            return;
        end;
         
        r = 10.^(-Xk*RO/20);		% roll-off, RO = 20log10(r)
        
        unmodSoundFileData = zeros(1,length(timeAxis));
        soundFileData = zeros(1,length(timeAxis));
        for q=1:length(fk)
            unmodCarrier = (cos(2*pi*(round(fk(q)*T0)/T0)*timeAxis + th(q)));
            component1(q,:) = r(q)*((EnProfile(q,:)) .* unmodCarrier);

            unmodSoundFileData = unmodSoundFileData + unmodCarrier;
            soundFileData = soundFileData + component1(q,:);            
        end

        
%% Comparison
if CompareVal == 1
    
%     disp('Calculating components from Shihab code');
%     Ph2 = Ph/pi-1/2;
%     rippleList2 = rippleList; rippleList2(:,4) = Ph2;
%     cond2=[T0, f0, SF, BW, RO, df, Mo];        
%     NormFlag=1;
%     s3 = mvripfft_Shihab(rippleList2, cond2, th,fk,Xk,r);
%     componentA=soundFileData/max(soundFileData);
%     componentB=s3/max(s3);
%     compA = componentA;
%     compB = componentB';
%     compPlot(compA,compB,NormFlag);
% %     compPlotFFT(compA,compB,NormFlag);
    
    disp('Calculating components from Baphy code');
    [s2,profile2,f_env2,t_env2,component2] = multimvripfft1_new(rippleList, cond,comp_phs_file,th,fk,Xk); % Using Baphy Code for comparison    
    disp('Start of iteration');
    for i=1:size(component1,1)
        comp1 = component1(i,:);
        comp2 = component2(i,:);
        comp1=comp1;%/max(comp1);
        comp2=comp2;%/max(comp2);
        compPlot(comp1,comp2,0);
        disp(i);
        pause;        
    end
end
%% Adding to workspace
        unmodSoundFile = [unmodSoundFile;unmodSoundFileData];
        soundFile=[soundFile;soundFileData];
        Frequencies = [Frequencies;fk];
        Profile=EnProfile;
        XkV = [XkV;Xk];
        
        assignin('base','timeAxis',timeAxis);
        assignin('base','soundFile',soundFile);
        assignin('base','unmodSoundFile',unmodSoundFile);
        assignin('base','Frequencies',Frequencies);
        assignin('base','Profile',Profile);
        assignin('base','XkV',XkV);
        
        plot(hSoundPlot,timeAxis,soundFile);
    end

    function Plot_Callback(~,~)
        SoundIndex = str2double(get(hSoundIndex,'string')); % Sound Index
        soundFile=evalin('base','soundFile');
        timeAxis=evalin('base','timeAxis');
        plot(hSoundPlot,timeAxis,soundFile(SoundIndex,:));
    end

    function Analyse_Callback(~,~)
        
        soundFile=evalin('base','soundFile');
        timeAxis=evalin('base','timeAxis');
        unmodSoundFile=evalin('base','unmodSoundFile');
        Profile=evalin('base','Profile');
        Xk=evalin('base','XkV');
        Fs = str2double(get(hSoundFs,'string')); % sampling frequency (Hz)
        SoundIndex = str2double(get(hSoundIndex,'string')); % Sound Index
        
        plotAnalysis(soundFile,timeAxis,unmodSoundFile,Profile,Xk,Fs,SoundIndex)
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

    function Ramp_Callback(~,~)
        SoundIndex = str2double(get(hSoundIndex,'string')); % Sound Index
        rampTime = str2double(get(hRampTime,'string'));
        soundFile=evalin('base','soundFile');
        unmodSoundFile=evalin('base','unmodSoundFile');
        timeAxis=evalin('base','timeAxis');
        [rampedSound] = rampSound(soundFile(SoundIndex,:),timeAxis,rampTime);
        soundFile((SoundIndex+1),:)=rampedSound;
        unmodSoundFile((SoundIndex+1),:)=soundFile(SoundIndex,:);
        assignin('base','soundFile',soundFile);
        assignin('base','unmodSoundFile',unmodSoundFile);
        
        plot(hSoundPlot,timeAxis,soundFile((SoundIndex+1),:));
    end

    function Play_Callback(~,~)
        SoundIndex = str2double(get(hSoundIndex,'string')); % Sound Index
        soundFile=evalin('base','soundFile');
        Fs = str2double(get(hSoundFs,'string')); % sampling frequency (Hz)
        SoundType = get(hSoundType,'val');
                
        if SoundType == 4
            Fs = evalin('base', 'fs');            
        end
        
        audioPlayer = audioplayer(soundFile(SoundIndex,:),Fs);
        disp('Playing Sound');
        audioPlayer.playblocking;
    end

    function Save_Callback(~,~)
        FileName = get(hFileName,'string');
        SoundIndex = str2double(get(hSoundIndex,'string'));
        Fs = str2double(get(hSoundFs,'string')); 
        soundFile=evalin('base','soundFile');
        
        audiowrite(['C:\Users\LabComputer6\Documents\MATLAB\Programs\Murty\Project related\Sounds\' FileName '.wav'],soundFile(SoundIndex,:),Fs);
    end

    function cla_Callback(~,~)
        cla(hSoundPlot);
        cla(hEditSoundPlot);
    end

    function claWS_Callback(~,~)
        evalin('base','clear');
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
        soundDur = str2double(get(hSoundDur,'string')); % Sound duration (ms)
        
        Fs = str2double(get(hSoundFs,'string')); % sampling frequency (Hz)
        
        if SoundType == 4
            Fs = evalin('base', 'fs');            
        end
        
        audioPlayerEdit = audioplayer(soundFile,Fs);
        disp('Playing Sound');
        audioPlayerEdit.play;
        pause(soundDur/1000);
    end

    function Push_Callback(~,~)
        EditedSound=evalin('base','EditedSound');
        unmodSoundFile=evalin('base','soundFile');
        soundFile=evalin('base','soundFile');
        Frequencies = evalin('base','Frequencies');
        SoundIndex = str2double(get(hSound1Index,'string'));
        
        unmodSoundFile=[unmodSoundFile;soundFile(SoundIndex,:)];
        soundFile=[soundFile;EditedSound];
        Frequencies = [Frequencies;Frequencies(SoundIndex,:)];
        
        assignin('base','soundFile',soundFile);
        assignin('base','unmodSoundFile',unmodSoundFile);
        assignin('base','Frequencies',Frequencies);
    end

    function CreateBinaural_Callback(~,~)
         % initialise
        
        binSoundIndex = str2double(get(hBinauralSoundIndex,'string')); % Sound index
        soundDur = str2double(get(hSoundDur,'string')); % Sound duration (ms)
        Fs = str2double(get(hSoundFs,'string')); % sampling frequency (Hz) of sound
        ITDelay = str2double(get(hITD,'string')); % ITD (microseconds)
        LagChannelIndex = get(hLagChannel,'val');
        
        if LagChannelIndex == 1
            LagChannel = 'Left';
        else
            LagChannel = 'Right';
        end
        
        soundFile = evalin('base','soundFile');
        OriginalSound = soundFile(binSoundIndex,:);
        
        [~,LeftChannelDel, RightChannelDel] = soundITD(OriginalSound,Fs,ITDelay,LagChannel);
        
        startTime = 0; 
        endTime = soundDur/1000;
        
        LeftChannel = soundTrimToTime(LeftChannelDel,Fs,startTime,endTime);
        RightChannel = soundTrimToTime(RightChannelDel,Fs,startTime,endTime);
        
        LeftExist = evalin('base','(exist(''LeftSoundFile'',''var''))');
        if LeftExist == 0
            LeftSoundFile = [];
        else
            LeftSoundFile=evalin('base','LeftSoundFile');
        end
        
        RightExist = evalin('base','(exist(''RightSoundFile'',''var''))');
        if RightExist == 0
            RightSoundFile = [];            
        else
            RightSoundFile=evalin('base','RightSoundFile');            
        end
        
        LeftSoundFile = [LeftSoundFile;LeftChannel];
        RightSoundFile = [RightSoundFile;RightChannel];
        
        assignin('base','LeftSoundFile',LeftSoundFile);
        assignin('base','RightSoundFile',RightSoundFile);
    end

    function PlayBinaural_Callback(~,~)
        Fs = str2double(get(hSoundFs,'string')); % sampling frequency (Hz) of sound
        soundDur = str2double(get(hSoundDur,'string')); % Sound duration (ms)
        binSoundIndex = str2double(get(hBinauralSoundIndex,'string')); % Sound index
        LeftSoundFile = evalin('base','LeftSoundFile');
        RightSoundFile = evalin('base','RightSoundFile');
        
        BinauralFile = [LeftSoundFile(binSoundIndex,:);RightSoundFile(binSoundIndex,:)];
        BinauralFile=BinauralFile';
        
        BinauralPlayer = audioplayer(BinauralFile,Fs);
        BinauralPlayer.play;
        pause(soundDur/1000);
    end

    function AppendBinaural_Callback(~,~)
        
        binSoundIndex = str2double(get(hBinauralSoundIndex,'string')); % Sound index
        SoundIndex = str2double(get(hAppendSoundIndex,'string'));
        
        soundFile = evalin('base','soundFile');
        LeftSoundFile = evalin('base','LeftSoundFile');
        RightSoundFile = evalin('base','RightSoundFile');
        
        OriginalSound = soundFile(SoundIndex,:);
        LeftSound = LeftSoundFile(binSoundIndex,:) + OriginalSound;
        RightSound = RightSoundFile(binSoundIndex,:) + OriginalSound;
        LeftSoundFile = [LeftSoundFile;LeftSound];
        RightSoundFile = [RightSoundFile;RightSound];
        
        assignin('base','LeftSoundFile',LeftSoundFile);
        assignin('base','RightSoundFile',RightSoundFile);    
        
    end
end
