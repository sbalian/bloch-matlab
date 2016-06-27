function dP = blocheqns( T , P , RABIX, RABIY, RABIZ, GAMMAT, GAMMAL)
%BLOCHEQN Optical Bloch equations.
%   dP = BLOCHEQNS(T,P,RABIX,RABIY,RABIZ,GAMMA,GAMMAE)
%   gives the first differentials dP for time in T, Bloch 3-vector P,
%   time-dependent peseudo-field vector specified by function handles
%   RABIX, RABIY and RABIZ, transverse relaxation GAMMAT and longitudinal
%   relaxation GAMMAL.
%
%   Example pseudo-field vector (defined before calling this function):
%   rabiz = @(t) real(R1 + R2.*exp(1i*(D1-D2)*t));
%   rabiy = @(t) imag(R1 + R2.*exp(1i*(D1-D2)*t));
%   rabiz = @(t) D1;
%   
%   The equations are:
%   dP = RABI X P - [GAMMAT PX; GAMMAT PY; GAMMAL(1+PZ)].
%
%   Note that RABIX, RABIY and RABIZ can all be time-dependent.
%
%   Seto Balian. Created 18 Sep 2015. v.0.1
%                        28 Sep 2015. v.0.2. Added second field.
%                        10 Oct 2015. v.0.3. General time dependence.

dP = [RABIY(T).*P(3) - RABIZ(T).*P(2) - GAMMAT.*P(1);...
      RABIZ(T).*P(1) - RABIX(T).*P(3) - GAMMAT.*P(2);...
      RABIX(T).*P(2) - RABIY(T).*P(1) - GAMMAL.*(1+P(3))];


end
