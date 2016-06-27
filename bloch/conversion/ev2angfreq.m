function ANGFREQ = ev2angfreq( EV )
%EV2ANGFREQ Converts electron volts to angular frequency.
%   ANGFREQ = EV2ANGFREQ(EV) converts EV to rad s-1 by scaling by
%   electronic_charge/hbar.
%
%   See also EV2FREQ, FREQ2EV, ANGFREQ2EV
%
%   Seto Balian. Created 18 Sep 2015. v.0.1

ANGFREQ = EV*(Consts.electronic_charge/Consts.hbar);

end
