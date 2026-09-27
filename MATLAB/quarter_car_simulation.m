%% QUARTER-CAR SUSPENSION SIMULATION
% Numerical simulation of quarter-car model

clc;
clear;
close all;

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

t_sim = 1;        % Simulation time [s]

%% Time vector
t = 0:0.001:t_sim;

%% Road displacement
xr = A*sin(omega*t);

%% Initial conditions
% State vector:
% X = [xs  xs_dot  xu  xu_dot]

X0 = [0 0 0 0];

%% Solve differential equations
[t, X] = ode45(@(t,X) quarter_car_ode(t,X,ms,mu,ks,cs,kt,A,omega), ...
               t, X0);

%% Extract states

xs     = X(:,1);       % Body displacement [m]
xs_dot = X(:,2);       % Body velocity [m/s]

xu     = X(:,3);       % Wheel displacement [m]
xu_dot = X(:,4);       % Wheel velocity [m/s]

%% Road displacement corresponding to simulation time
xr = A*sin(omega*t);

%% Calculate accelerations

xs_ddot = (-cs*(xs_dot-xu_dot) ...
           -ks*(xs-xu))/ms;

xu_ddot = (ks*(xs-xu) ...
           +cs*(xs_dot-xu_dot) ...
           -kt*(xu-xr))/mu;

%% Suspension deflection

x_suspension = xs - xu;

%% Tyre deflection

x_tyre = xu - xr;

%% =========================================================
%  PLOT 1: ROAD, WHEEL AND BODY DISPLACEMENT
% ==========================================================

figure;

plot(t,xr,'LineWidth',1.5);
hold on;

plot(t,xu,'LineWidth',1.5);
plot(t,xs,'LineWidth',1.5);

grid on;

xlabel('Time [s]');
ylabel('Displacement [m]');

title('Quarter-Car Vertical Displacement Response');

legend('Road x_r','Wheel x_u','Body x_s');

xlim([0 1]);

%% =========================================================
%  PLOT 2: BODY DISPLACEMENT
% ==========================================================

figure;

plot(t,xs,'LineWidth',1.5);

grid on;

xlabel('Time [s]');
ylabel('Body displacement x_s [m]');

title('Vehicle Body Displacement');

xlim([0 1]);

%% =========================================================
%  PLOT 3: WHEEL DISPLACEMENT
% ==========================================================

figure;

plot(t,xu,'LineWidth',1.5);

grid on;

xlabel('Time [s]');
ylabel('Wheel displacement x_u [m]');

title('Wheel Displacement');

xlim([0 1]);

%% =========================================================
%  PLOT 4: BODY ACCELERATION
% ==========================================================

figure;

plot(t,xs_ddot,'LineWidth',1.5);

grid on;

xlabel('Time [s]');
ylabel('Body acceleration [m/s^2]');

title('Vehicle Body Acceleration');

xlim([0 1]);

%% =========================================================
%  PLOT 5: SUSPENSION DEFLECTION
% ==========================================================

figure;

plot(t,x_suspension,'LineWidth',1.5);

grid on;

xlabel('Time [s]');
ylabel('Suspension deflection [m]');

title('Suspension Deflection');

xlim([0 1]);

%% =========================================================
%  PLOT 6: TYRE DEFLECTION
% ==========================================================

figure;

plot(t,x_tyre,'LineWidth',1.5);

grid on;

xlabel('Time [s]');
ylabel('Tyre deflection [m]');

title('Tyre Deflection');

xlim([0 1]);

%% =========================================================
%  IMPORTANT RESULTS
% ==========================================================

fprintf('\n========== QUARTER-CAR RESULTS ==========\n');

fprintf('Maximum body displacement  = %.4f m\n',max(abs(xs)));

fprintf('Maximum wheel displacement = %.4f m\n',max(abs(xu)));

fprintf('Maximum body acceleration  = %.4f m/s^2\n',max(abs(xs_ddot)));

fprintf('Maximum suspension travel  = %.4f m\n',max(abs(x_suspension)));

fprintf('Maximum tyre deflection    = %.4f m\n',max(abs(x_tyre)));

fprintf('==========================================\n');
