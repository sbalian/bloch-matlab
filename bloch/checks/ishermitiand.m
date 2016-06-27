function PASS = ishermitiand( A , TOL )
%ISHERMITIAND Like ishermitian but with floating point precision.
%   TOL is the tolerance.
%
%   Seto Balian. Created 25 Jan 2016. v.0.1

% Check if square
[m,n] = size(A);
if m~=n
    PASS = false; 
    return 
end

for j=1:m
    k = 1;
    while (k <= j)
        if (abs( conj(A(j,k)) - A(k,j) ) > TOL)
            PASS = false;
            return
        end
        k = k+1;
    end
end

PASS = true;

end

