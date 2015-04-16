function EnProfile = makeSumRipples(rippleList,Xk,timeAxis,Mo)
    Am = rippleList(:,1); w = rippleList(:,2); Om = rippleList(:,3); Ph = rippleList(:,4)-pi/2;

    f_env=Xk; f_env_size=length(f_env);
    t_env=timeAxis; t_env_size=length(t_env);

    EnProfile	= zeros(f_env_size,t_env_size);
    for row = 1:size(rippleList,1)   
        rip_amp 	= Am(row);
        rip_vel		= w(row);
        rip_freq	= Om(row);
        rip_phase	= Ph(row)+pi/2;
        f_phase = 2*pi*rip_freq*f_env + rip_phase;
        t_phase = 2*pi*rip_vel*t_env;
        Profile = rip_amp*(sin(f_phase)*cos(t_phase)+cos(f_phase)*sin(t_phase));
        EnProfile=EnProfile+Profile;
    end
    EnProfile=EnProfile/max(max(EnProfile));
    EnProfile=1+EnProfile*Mo;
end
