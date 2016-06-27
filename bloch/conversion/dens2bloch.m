function P = dens2bloch( DENS )
%DENS2BLOCH Convert density matrix to Bloch vector.
%   P=DENS2BLOCH(DENS) returns the Bloch vector(s) P given qubit density
%   matrix(ces) DENS. DENS can be either a 2x2 matrix, or an Nx4
%   matrix with rows iDENS11 iDENS12 iDENS21 iDENS22, i = 1 to N.
%
%   See also BLOCH2DENS
%
%   Seto Balian. Created Oct 12 2015. v.0.1.

[r,c] = size(DENS);
if (r==c) && (r==2)
    DENS = [ DENS(1,1) DENS(1,2) DENS(2,1) DENS(2,2) ];
end
[r,c] = size(DENS);

if c~=4
    error('Invalid input.'); 
end

P = zeros(r,3);

for i=1:r
    DENS = [DENS(i,1) DENS(i,2) ; DENS(i,3) DENS(i,4)];

    if isdensmat(DENS) == false
        error('Input must be a density matrix.');
    end

    P(i,1) = DENS(1,2) + DENS(2,1);
    P(i,2) = (DENS(1,2) - DENS(2,1))*1i;
    P(i,3) = DENS(1,1) - DENS(2,2);
    
end

% Check if real (MATLAB should handle this automatically ... but again)
if ( isreal(P)==false  ) 
    error('Bloch vector should be real. Something went terribly wrong.');
end

end
