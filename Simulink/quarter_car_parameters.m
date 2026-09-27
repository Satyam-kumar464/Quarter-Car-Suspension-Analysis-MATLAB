
%% QUARTER-CAR SUSPENSION MODEL
% Parameter Definition File
% All physical and simulation parameters are defined here.
% These variables will be used directly in the Simulink model.

clc;
clear;

%% ================= VEHICLE PARAMETERS =================

ms = 300;          % Sprung mass [kg]
mu = 40;           % Unsprung mass [kg]


%% ================= SUSPENSION PARAMETERS =================

ks = 15000;        % Suspension stiffness [N/m]
cs = 1500;         % Suspension damping coefficient [N.s/m]


%% ================= TYRE PARAMETERS =================

kt = 150000;       % Tyre stiffness [N/m]


%% ================= ROAD PARAMETERS =================

A = 0.05;          % Road amplitude [m]
lambda = 5;        % Road wavelength [m]
v = 5;            % Vehicle velocity [m/s]


%% ================= ROAD EXCITATION =================

f = v/lambda;      % Road excitation frequency [Hz]
omega = 2*pi*f;    % Angular frequency [rad/s]


%% ================= SIMULATION PARAMETERS =================

t_sim = 10;        % Simulation time [s]
