function mpc = case11bus

mpc.version = '2';

%% System MVA base
mpc.baseMVA = 100;

%% Bus Data

% bus_i  type  Pd  Qd  Gs  Bs  area  Vm  Va  baseKV  zone  Vmax  Vmin

mpc.bus = [
 % bus_i  type  Pd  Qd    Gs  Bs  area Vm  Va  baseKV  zone Vmax  Vmin
    1      2    0    0    0   0    1  1.03  0    13     1   1.05  0.95;  % G1 (Generator Bus) Vmin, Vmax = +- 5%
    2      2    0    0    0   0    1  1.03  0    13     1   1.05  0.95;  % G2 (Generator Bus)
    3      3    0    0    0   0    1  1.03  0    13     1   1.05  0.95;  % G3 (Slack)
    4      2    0    0    0   0    1  1.03  0    13     1   1.05  0.95;  % G4 (Generator Bus)
    5      1    0    0    0   0    1  1.00  0   132     1   1.05  0.95;  % (Load/Transmission Bus) The Vm = 1 is an initial guess
    6      1    0    0    0   0    1  1.00  0   132     1   1.05  0.95;  % (Load/Transmission Bus)
    7      1   850  90    0   0    1  1.00  0   132     1   1.05  0.95;  % Ld7 % (Load/Transmission Bus)
    8      1    0    0    0   0    1  1.00  0   132     1   1.05  0.95;  % (Load/Transmission Bus)
    9      1   950 110    0   0    1  1.00  0   132     1   1.05  0.95;  % Ld9 % (Load/Transmission Bus)
   10      1    0    0    0   0    1  1.00  0   132     1   1.05  0.95;  % (Load/Transmission Bus)
   11      1    0    0    0   0    1  1.00  0   132     1   1.05  0.95;  % (Load/Transmission Bus)
];

%% Generator data
% bus  Pg   Qg  Qmax  Qmin  Vg    mBase  status  Pmax  Pmin  
mpc.gen = [
%  bus  Pg   Qg  Qmax  Qmin   Vg   mBase  status  Pmax  Pmin
    1   420  0   350  -350  1.03  100    1       1000   0;  % G1 
    2   390  0   330  -330  1.03  100    1       1000   0;  % G2
    3   0    0   580  -580  1.03  100    1       1000   0;  % G3 (Slack)
    4   710  0   600  -600  1.03  100    1       1000   0;  % G4
];



%% Branch Data
% fbus tbus      r           x            b       rateA  rateB  rateC  ratio  angle  status

% Transmission Line Parameters (per km)
R_pu = 0.00011;
X_pu = 0.0011;
B_pu = 0.0012;

% Line Lengths (km)
L1 = 27.5; L2 = 11.0; L3 = 121; L4 = 121; L7 = 11.0; L8 = 27.5;

mpc.branch = [
    % Transformers (11 columns: fbus, tbus, r, x, b, rateA, rateB, rateC, ratio, angle, status, argmin, argmax)
    1  5   0         0.002   0   0   0   0   0   0   1 -360 360;  % T1
    2  6   0         0.002   0   0   0   0   0   0   1 -360 360;  % T2
    3  11  0         0.002   0   0   0   0   0   0   1 -360 360;  % T3
    4  10  0         0.002   0   0   0   0   0   0   1 -360 360;  % T4 
    5  6    R_pu*L1      X_pu*L1      B_pu*L1       0     0     0     0     0     1 -360 360;  % Ln1
    6  7    R_pu*L2      X_pu*L2      B_pu*L2       0     0     0     0     0     1 -360 360;  % Ln2
    7  8    R_pu*L3      X_pu*L3      B_pu*L3       0     0     0     0     0     1 -360 360;  % Ln3
    8  9    R_pu*L4      X_pu*L4      B_pu*L4       0     0     0     0     0     1 -360 360;  % Ln4
    7  8    R_pu*L3      X_pu*L3      B_pu*L3       0     0     0     0     0     1 -360 360;  % Ln5
    8  9    R_pu*L4      X_pu*L4      B_pu*L4       0     0     0     0     0     1 -360 360;  % Ln6
    9  10   R_pu*L7      X_pu*L7      B_pu*L7       0     0     0     0     0     1 -360 360;  % Ln7
    10 11   R_pu*L8      X_pu*L8      B_pu*L8       0     0     0     0     0     1 -360 360;  % Ln8
];