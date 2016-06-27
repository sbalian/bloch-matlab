function P = solvebloch(P0,TIME,RABIX,RABIY,RABIZ,GAMMAT,GAMMAL)
%SOLVEBLOCH Solves the Bloch equations for a two-level atom.
%   P = SOLVEBLOCH(P0,TIME,RABIX,RABIY,RABIZ,GAMMAT,GAMMAL)
%   gives the bloch vector solution P, for intial Bloch vector P0,
%   evolution time array TIME, Rabi frequency specified by RABIX,Y and Z
%   (function handles as a function of time), transverse relaxation GAMMAT,
%   and longitudinal relaxation GAMMAL.
%   
%   Seto Balian. Created 19 Oct 2015. v.0.1
%                        10 Dec 2015. v.0.1 improved usage 

% First check if input is a Bloch vector
if isblochvector(P0)==false
    error('Invalid initial Bloch vector.')
end

% ODE options
options = odeset('RelTol',1e-4,'AbsTol',[1e-4 1e-4 1e-5]);

% Solve coupled ODEs
[~,P] = ode45( @(TIME,P) blocheqns(TIME,P, ... 
    RABIX,RABIY,RABIZ,GAMMAT,GAMMAL), ...
    TIME,P0,options);

end

