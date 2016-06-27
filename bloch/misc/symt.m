function S = symt(A,N)
%SYMT Similar to sym(A,N) but each element is a function of 't'.
%   Note that the '%d' feature is not supported. This function is useful
%   for constructing relaxation matrices.
%
%   See also sym
%
%   Seto Balian. Created 22 Jan 2016. v.0.1

S = sym(zeros(N,N));

for i=1:N
    for j=1:N
        varname = [A num2str(i) '_' num2str(j) '(t)'];
        S(i,j) = sym(varname);
    end
end

end
