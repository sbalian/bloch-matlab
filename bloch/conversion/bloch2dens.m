function DENS = bloch2dens( P )
%BLOCH2DENS Convert Bloch vector to density matrix.
%   DENS=BLOCH2DENS(P) returns the qubit density matrices DENS as rows
%   given Bloch vectors P. P must be an Nx3 matrix (for the 3 Cartesian
%   Bloch components) and the rows of the output correspond to DENS11
%   DENS12 DENS21 DENS22. So output is a Nx4 matrix.
%
%   See also DENS2BLOCH
%
%   Seto Balian. Created Oct 14 2015. v.0.1.

[r,c] = size(P);

if c~=3
    error('Invalid input.'); 
end

DENS = zeros(r,4);

for i=1:r
    
    DENS(i,:)=[(1+P(i,3))/2 ...
               (P(i,1) - P(i,2)*1i)/2 ...
               (P(i,1) + P(i,2)*1i)/2 ...
               (1-P(i,3))/2];
end


end
