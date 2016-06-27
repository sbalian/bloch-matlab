%LAMBDA A 3-level Lambda system
%
%   Seto Balian. Created 11 Dec 2015. v.0.1
%                Developed 22 Jan 2016. v.0.1

%% Initialize

clear
clc
close all
format long

%% Input

% Derived from PRL 108 187401 2012

% symbolic parameters and values
syms xH	xV dH dV gT gS;
symparam = [xH	xV dH dV gT gS];
% Energy units in GHz
paramvals = [0.700/2 0.150/2 0 0 0.4 2e-3];
% Convert to G rad s-1
paramvals = 2*pi*paramvals;

% symbolic Hamiltonian
symhamiltonian = [0      ,xH    ,-1i*xV ;...
                  xH     ,dH    ,0      ;...
                  1i*xV  ,0     ,dV     ];

dim = length(symhamiltonian);
              
% symbolic relaxation matrix
symstate = symt('p',dim);
symrelaxation = ...
[-gT*symstate(1,1), -(1/2)*gT*symstate(1,2), -(1/2)*gT*symstate(1,3); ...
-(1/2)*gT*symstate(2,1), (1/2)*gT*symstate(1,1), -gS*symstate(2,3); ...
-(1/2)*gT*symstate(3,1),-gS*symstate(3,2), (1/2)*gT*symstate(1,1)];

% initial state
state0 = [1 0 0; 0 0 0 ; 0 0 0];
% must reshape this with argument (...,[1 dim^2])
state0 = reshape(state0,[1 9]);

% Time in nanoseconds
nanoseconds = linspace(0,10,1000);

% ODE45 options
options = odeset('RelTol',1e-4,'AbsTol',1e-5);

%% Construct master equation

eqns = mastereqn(symparam,symstate,symhamiltonian,symrelaxation);

%% Evolve state

% input parameters as arguments to eqns
paramvalsargs = num2cell(paramvals);

% solve density matrix evolution
[~,state] = ode45( @(nanoseconds,state) eqns(...
    nanoseconds,state,paramvalsargs{:}),...
    nanoseconds,state0,options);

%% Plot

% for example, let's see the rho11 and rho32

figure('color',[1 1 1]);
plot(nanoseconds,state(:,1))
hold on
plot(nanoseconds,real(state(:,3)))
plot(nanoseconds,imag(state(:,6)))
legend \rho_{11} Re[\rho_{32}] Im[\rho_{32}]
ylabel 'Density matrix element'
xlabel 'Time (ns)'


