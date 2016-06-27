function EV = freq2ev( FREQ )
%FREQ2EV Converts frequency to electron volts.
%   EV = FREQ2EV(FREQ) converts Hz to electron volts by scaling by
%-  hbar/electronic_charge*(2*pi).
%
%   See also EV2ANGFREQ, EV2FREQ, ANGFREQ2EV
%
%   Seto Balian. Created 21 Sep 2015. v.0.1

EV = angfreq2ev( FREQ*2*pi );

end
