% Generate Ripples


%	cond = [T0, f0, BW, SF, CF, df, RO, AF, Mo, wM, Ph]; 
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

% cond = [T0, f0,  BW,    SF, CF, df,  RO, AF, Mo, wM, Ph]; 
  cond = [1, 250, 5, 16384, 1, 1/100, 0, 1, 0.9, 120, 1];
  
% rippleParams = [Am1, w1, Om1, Ph1]
  rippleParams = [1, 4, 0.2, pi/2];
  
[s1,profile,fr_env,t_env,component1] = multimvripfft1(rippleParams, cond);
%pcolor(t_env,fr_env,abs(profile)); shading interp;

cond2 = cond; cond2(11)=2;
[s2,component2] = genRipples(rippleParams, cond2,'save_comp_phs');

for i=1:size(component1,1)
    subplot(221);
    plot(component1(i,:)); hold on; plot(component2(i,:),'r--');
    hold off;
    subplot(223);
    plot(component1(i,:) - component2(i,:),'k');
    
    subplot(222);
    plot(abs(fft(component1(i,:)))); hold on; plot(abs(fft(component2(i,:))),'r--');
    hold off;
    subplot(224);
    plot(abs(fft(component1(i,:))) - abs(fft(component2(i,:))),'k');
    disp(i);
    pause;
end