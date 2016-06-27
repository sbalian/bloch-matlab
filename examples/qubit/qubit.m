%QUBIT A 2-level system under optical control.
%
%   Seto Balian. Created 13 Dec 2015. v.0.1

% All energy units are ueV

% clean up
clear
close all

% Set up the 2-level system with the following pseudofield
driving = 2.0;
detuning = 0.5;

rabix = @(t) driving;
rabiy = @(t) 0;
rabiz = @(t) detuning;

% Relaxation

gammastar = 0.0;
gammal = 2.0;
gammat = gammal/2 + gammastar;

% Initial state and time array

P0 = [0 0 -1]; % ground state
nanoseconds = linspace(0,10,200);
naturaltime = ns2invuev(nanoseconds); % convert to natural time

% Solve for the Bloch vector
P = solvebloch(P0,naturaltime,rabix,rabiy,rabiz,gammat,gammal);

% Get density matrix from P
rho = bloch2dens(P);

% Plot density matrix elements

% Population
figure('name','Population','color',[1 1 1]);
plot(nanoseconds,rho(:,1))
hold on
plot(nanoseconds,rho(:,4))
legend \rho_{11} \rho_{22}
ylabel \rho_{ii}
xlabel 'Time (ns)'

% Coherence

figure('name','Coherence','color',[1 1 1]);
plot(nanoseconds,real(rho(:,2)))
hold on
plot(nanoseconds,imag(rho(:,2)))
legend Re[\rho_{12}] Im[\rho_{12}]
ylabel \rho_{12}
xlabel 'Time (ns)'

