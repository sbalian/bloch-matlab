function PSTAT = statbloch(RABIX, RABIY, RABIZ, GAMMAT, GAMMAL)
%STATBLOCHEQNS Stationary limit of the optical Bloch equations.
%   PSTAT = STATBLOCHEQNS(RABIX,RABIY,RABIZ,GAMMAT,GAMMAL)
%   gives the stationary solutions PSTAT to the optical Bloch equations for
%   peseudo-field vector specified by scalar RABIX, RABIY and RABIZ,
%   transverse relaxation GAMMAT and longitudinal relaxation GAMMAL.
%   
%   The output is the solution to:
%   0 = RABI X P - [GAMMAT PX; GAMMAT PY; GAMMAL(1+PZ)].
%
%   See also BLOCHEQNS
%
%   Seto Balian. Created 10 Oct 2015. v.0.1


A = [ -GAMMAT  -RABIZ  RABIY; ...
       RABIZ  -GAMMAT -RABIX; ...
     - RABIY   RABIX -GAMMAL ];
B = [0;0;GAMMAL];
PSTAT = (A\B)';

end
