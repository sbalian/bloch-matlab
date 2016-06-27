%CONSTS Physical constants class.
% Contains:
%   - Plank's constant hbar = 1.054571800e-34 J s [Wikipedia]
%   - electronic_charge = 1.6021766209e-19 C [Wikipedia]
%
%   Seto Balian. Created 21 Sep 2015. v.0.1
%                        15 Oct 2015. v.0.1, fixed electronic charge from
%                        1.602176565e-19 C to 1.6021766209e-19 C!

classdef Consts
   properties (Constant)
      hbar = 1.054571800e-34;
      electronic_charge = 1.6021766209e-19;
   end
end
