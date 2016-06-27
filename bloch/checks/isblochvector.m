function PASS = isblochvector( VEC )
%ISDENSMAT Is the argument a Bloch vector?
%   PASS=isblochvector(VEC) checks (1) Is VEC a 3 vector?
%   (2) Is it of norme <=1?
%   If both of these are true, then PASS=true, otherwise PASS=false.
%
%   Seto Balian. Created Dec 10 2015. v.0.1.

[m,n] = size(VEC);
if ( ( ((m==1) && (n==3)) || ((m==3) && (n==1)) ) && ( norm(VEC) <= 1) )
    PASS=true;
else
    PASS=false;
end

end

