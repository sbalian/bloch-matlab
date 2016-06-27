function DENS = state2dens( STATE )
%STATE2DENS State vector to density matrix.
%   DENS=STATE2DENS(STATE) converts the state vector STATE to a
%   density matrix DENS.
%
%       Seto Balian. Created 12 Oct 2015. v.0.1.

if isvector(STATE)==false
   error('Input must be a vector.');
end

if isrow(STATE)==true
   error('Convention: state vectors must be column vectors.');
end

% Output
DENS = STATE*STATE';

end
