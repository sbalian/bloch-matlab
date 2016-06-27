function FREQ = ev2freq( EV )
%EV2FREQ Converts electron volts to frequency.
%   FREQ = EV2FREQ(EV) converts EV to Hz by scaling by 
%   electronic_charge/hbar/(2*pi).
%
%   See also EV2ANGFREQ, FREQ2EV, ANGFREQ2EV
%
%   Seto Balian. Created 21 Sep 2015. v.0.1

FREQ = ev2angfreq(EV)/(2*pi);

end
