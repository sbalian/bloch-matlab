function INVUEV = ns2invuev( NS )
%NS2INVUEV Converts ns to inverse microelectron volts.
%   INVUEV = NS2INVUEV(NS) converts NS to ueV-1.
%
%   See also EV2ANGFREQ, EV2FREQ, FREQ2EV, ANGFREQ2EV
%
%   Seto Balian. Created 11 Dec 2015. v.0.1

INVUEV = ev2angfreq(NS*1e-9)*1e-6;

end
