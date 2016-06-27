function PASS = isdensmat( MAT,TOL )
%ISDENSMAT Is the argument a density matrix?
%   PASS=isdensmat(MAT,TOL) checks (1) Is MAT Hermitian? (2) Is MAT of
%   trace 1? If both of these are true, then PASS=true, otherwise
%   PASS=false. TOL is the tolerance.
%
%   Seto Balian. Created 12 Oct 2015. v.0.1.
%                Revised 17 Dec 2015. v.0.1.

if ( (ishermitiand(MAT,TOL)==true) && ( abs(1-trace(MAT)) <= TOL) )
    PASS=true;
else
    PASS=false;
end

end
