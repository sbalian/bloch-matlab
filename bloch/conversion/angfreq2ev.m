function EV = angfreq2ev( ANGFREQ )
%ANGFREQ2EV Converts angular frequency to electron volts.
%   EV = ANGFREQ2EV(ANGFREQ) converts ANGFREQ in rad s-1 to electron volts
%   by scaling by hbar/electronic_charge.
%
%   See also EV2ANGFREQ, EV2FREQ, FREQ2EV
%
%   Seto Balian. Created 18 Sep 2015. v.0.1

EV = ANGFREQ*(Consts.hbar/Consts.electronic_charge);

end
