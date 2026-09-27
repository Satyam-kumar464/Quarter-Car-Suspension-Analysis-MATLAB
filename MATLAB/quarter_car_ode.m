function dXdt = quarter_car_ode(t,X,ms,mu,ks,cs,kt,A,omega)

%% State variables

xs     = X(1);
xs_dot = X(2);

xu     = X(3);
xu_dot = X(4);

%% Road displacement

xr = A*sin(omega*t);

%% Equations of motion

xs_ddot = (-cs*(xs_dot-xu_dot) ...
    -ks*(xs-xu))/ms;

xu_ddot = (ks*(xs-xu) ...
    +cs*(xs_dot-xu_dot) ...
    -kt*(xu-xr))/mu;

%% State derivatives

dXdt = [
    xs_dot;
    xs_ddot;
    xu_dot;
    xu_ddot
    ];

end