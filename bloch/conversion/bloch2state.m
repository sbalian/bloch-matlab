function STATE = bloch2state( THETA, PHI )
%BLOCH2STATE Point on surface of Bloch sphere to pure qubit state.
%   STATE = BLOCH2STATE(THETA,PHI) returns 1x2 STATE where the first
%   element is cos(THETA/2) and the second element is 
%   exp(1i*PHI).*sin(THETA/2), where THETA and PHI are the elevation
%   and azimuth angles respectively.
%
%   Seto Balian. Created 5 Oct 2015. v.0.1

STATE = [cos(THETA/2) exp(1i*PHI).*sin(THETA/2)];

end
