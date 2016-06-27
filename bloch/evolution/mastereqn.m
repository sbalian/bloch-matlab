function  EQNHANDLE = mastereqn(PARAMETERS,DENSITY,HAMILTONIAN,RELAXATION)
%MASTEREQN Quantum master equation with relaxation.
%   EQNHANDLE = MASTEREQN(PARAMETERS,DENSITY,HAMILTONIAN,RELAXATION)
%   returns a handle to master equation DENSITYdot =
%   -i[HAMILTONIAN,DENSITY] + RELAXATION, where DENSITY, HAMILTONIAN and
%   RELAXATION are symbolic matrices and can all be functions of time 't'.
%   Use t in parantheses (e.g. f(t)) in symbolic inputs for explicit time
%   dependence. The first input must be a vector of ALL the symbolic
%   parameters in the input matrices EXCEPT time 't'. All matrix elements
%   in the second input must be functions of time. RELAXATION must refer to
%   the matrix elements as specified in DENSITY. Use SYMT to safely achieve
%   this.
%
%   The output function handle can be used with MATLAB's ODE solvers. The
%   ODEs for the density matrix elements are put into a vector like the
%   MATLAB function reshape with second argument [1 dim^2], where dim is
%   the dimension of the system. Finally, when entering the initial
%   state in the equation handle, don't forget to reshape it with the
%   [1 dim^2] input. Later on, to recover solution into a matrix use
%   reshape(...,[dim dim]).
%
%   See also ode45
%
%   Seto Balian. Created 17 Dec 2015. v.0.1
%                Modified 22 Jan 2016. v.0.1.

%% Initialize

% Dimension of the system
dim = length(formula(HAMILTONIAN));

% Check inputs
if ( (~ismatrix(DENSITY)) || ...
     (~ismatrix(HAMILTONIAN)) || ...
     (~ismatrix(RELAXATION)))
   error('Inputs 2-4 must be matrices.')
end
dimdens = length(formula(DENSITY));
if (dimdens~=dim) 
error('Inputs 2-4 must be of the same dimenstion.')
end
dimrelax = length(formula(RELAXATION));
if (dimrelax~=dim) 
error('Inputs 2-4 must be of the same dimenstion.')
end

%% Construct the equations of motion

% Commutator [H,rho]
comm = HAMILTONIAN*DENSITY - DENSITY*HAMILTONIAN;

% RHS
rhs = -1i.*comm + RELAXATION;

% Reshape
rhs = reshape(rhs,[1 dim*dim]);
DENSITY = reshape(DENSITY,[1 dim*dim]);

% Equations of motion
eqnm = rhs;


%% Output function handle

% Represent list of symbolic variables as argument list
args = num2cell(PARAMETERS);

% output
EQNHANDLE = odeFunction(eqnm, DENSITY, args{:});

end

