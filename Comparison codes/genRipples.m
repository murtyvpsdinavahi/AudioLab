function [s,component] = genRipples(rippleList, cond,comp_phs_file)

% multimvripfft1 generates multiple moving ripples via FFT
%	s = multimvripfft1();
%	s = multimvripfft1(rippleList);
%	s = multimvripfft1(rippleList, cond);
%   [s, profile] = multimvripfft1(rippleList, cond);
%	rippleList = [Am1, w1, Om1, Ph1
%				 Am2, w2, Om2, Ph2
%				 ....
%      			 AmN, wN, OmN, PhN];
%		Am: modulation depth, 0 < Am < 1, DEFAULT = 1;
%		w: rate (Hz), integer preferred, typically, 1 .. 128, DEFAULT = 8;
%		Om: scale (cyc/oct), any real number, typically, .25 .. 4, DEFAULT = 1; 
%		Ph: (optional) sine-symmetry at f0 in radians, DEFAULT = 0.
%       N >= 1
%	cond = (optional) [T0, f0, BW, SF, CF, df, RO, AF, Mo]; 
%		T0: duartion (sec), DEFAULT = 1.
%		f0: lowest freq. (Hz), DEFAULT = 250.
%		BW: excitation band width (oct), DEFAULT = 5.
%		SF: sample freq. (Hz), should be power of 2, DEFAULT = 16384
%		CF: component-spacing flag, 1->log spacing, 0->harmonic, DEFAULT = 1
%		df: freq. spacing, in oct (CF=1) or in Hz (CF=0), DEFAULT = 1/16 or 1.
%		RO: roll-off (dB/oct), DEFAULT = 0 (CF=1) or 3 (CF=0)
%		AF: amplitude flag, 1->linear, 0->log (dB), DEFAULT = 1;
%		Mo: amp. total mod: 0<Mo<1 (AF=1); 0<Mo dB (AF=0); , DEF=0.9 or 10 dB
%		wM: Maximum temporal velocity to consider in Hz (DEFAULT = 120)
%       Ph: Component phases (0-Random,1-Save,2-load).
%	profile = spectro-temporal envelope *linear* profile; 
%
% By Powen Ru
% Acknowledge: This program is available due to Jian Lin's creative idea and
%	his C program [rip.c]. Thank Jonathan Simon and Didier Dipereux for their
%	Matlab program [ripfft.m].
%
% 08-Jun-98, v1.00
%
% 12/98 generalized by Jonathan Simon 
%    allows mulitple ripples
%    interface changed somewhat (f0 is lowest freq, Ph in radians, new defaults)
%    named multimvripfft1
% 10/99 generalized by Tai-Shih & Jonathan Simon 
%    algorithm changed to compute envelope and take fft of that!
%    Almost as fast as Jian Lin's algorithm, but it generalizes to
%    passed envelopes and non-linear operations (e.g. exponentiation) on
%    envelopes.
%    Also allows non-integer ripple velocities, at the expense of requiring
%    that (w*T) be an integer for all w.
% 10/00 Fixed cases when pads < 0 and when w = Om = 0 . JZS

% default rippleList and conditions
% rippleList = [Am, w, Om, Ph]; cond = (optional) [T0, f0, BW, SF,   CF, df, RO, AF, Mo, wM];
rippleList0  = [1,  8, 1,  0];  
cond0 =           [1, 125, 5, 16000, 1, 1/20, 0, 1, 0.9, 120,0];

% arguments
if nargin < 1, rippleList = rippleList0; end;
if nargin < 2, cond = cond0; end;
if nargin < 3, comp_phs_file = 'save_comp_phs';end;
if size(rippleList,2) < 4, rippleList(:,4) = rippleList0(4); end;
if length(cond) >= 5
	if cond(5)==0, cond0(6) = 1; cond0(7) = 3; end
end
if length(cond) >= 8
	if cond(8)==0, cond0(9) = 10; end
end
for k = 2:10, 
	if length(cond) < k, 
		cond(k) = cond0(k); 
	end; 
end;

% rippleList
Am = rippleList(:,1); w = rippleList(:,2); Om = rippleList(:,3); Ph = rippleList(:,4)-pi/2;

% excitation condition
T0 = cond(1); 	% actual duration in seconds
f0 = cond(2);	% lowest freq
BW = cond(3);	% bandwidth, # of octaves
SF = cond(4);	% sample freq, 16384, must be an even number
CF = cond(5);	% component-spacing flag, 1->log spacing, 0->harmonic
df = cond(6);	% freq. spacing, in oct (CF=1) or in Hz (CF=0)
%RO = cond(7);	% roll-off in dB/Oct
%AF = cond(8);	% amplitude flag, 1->linear, 0->log (dB)
Mo = cond(9);	% amp. total mod: 0<Mo<1 (Af=1); 0<Mo dB (Af=0)
wM = cond(10);	% amp. total mod: 0<Mo<1 (Af=1); 0<Mo dB (Af=0)
PhFlag = cond(11);% Flag which determines how to set the compnent flags

% Time Values
t=0:1/SF:T0-1/SF;

% freq axis
if CF==0	%compute harmonic tones freqs
	fr = df*(round(f0/df):round(2.^BW*f0/df)).';
else	%compute log-spaced tones freqs
	fr = f0*2.^((0:round(BW/df*2)/2-1)*df).';
end
x = log2(fr/f0);

% roll-off and phase relation
switch PhFlag
case 0
    th = 2*pi*rand(f_env_size,1);	% component phase, theta
case 1
    th = 2*pi*rand(f_env_size,1);	% component phase, theta
    save(comp_phs_file,'th');%Save component phases
case 2
    fp = load(comp_phs_file);
    th = fp.th;
otherwise
    error('Invalid selection');
    return;
end;


for row = 1:size(rippleList,1)
    rip_amp 	= Am(row);
	rip_vel		= w(row);
	rip_freq	= Om(row);
	rip_phase	= Ph(row)+pi/2;
    
    s = zeros(1,length(t));
    for i=1:length(fr)
        env = rip_amp*(1+Mo*(sin(2*pi*(rip_vel*t + rip_freq*x(i)) + rip_phase)));
        component(i,:) = env .* cos(2*pi*(round(fr(i)*T0)/T0)*t + th(i));
        s = s + component(i,:);
        
%         clf;
%         plot(t,s); hold on;
%         plot(t,component,'r');
%         pause;

    end
end