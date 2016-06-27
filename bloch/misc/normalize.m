function NORMALIZED = normalize( V )
%NORMALIZE Normalize a vector.
%   NORMALIZED=NORMALIZE(V) returns normalized V.
%
%   Seto Balian. Created 28 Sep 2015. v.0.1

if ~isvector(V)
   error('Must be vector.'); 
end

n = norm(V);
NORMALIZED = V/n; 

end
