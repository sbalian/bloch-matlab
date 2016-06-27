%PAULI Pauli matrices class.
% Contains:
%   - Pauli X, Y, Z, I
%
%   Seto Balian. Created 5 Oct 2015. v.0.1

classdef Pauli
   properties (Constant)
      X = [0 1;1 0];
      Y = [0 -1i;1i 0];
      Z = [1 0;0 -1];
      I = eye(2);
   end
end
