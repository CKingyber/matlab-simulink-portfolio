%This is the m-file for the "Thermal model of a house" assignment.
clear           %Function to clear the workspace units.
clc           %Function to clear command line.

%Calculating constants
%%House_walls_dimensions:
H = 4; W = 10; L = 30; %Wall dimensions constants
walls_TSA = 2*W*H + 2*L*H; %Calculationg walls total surface area

%%Window dimensions(6 windows):
h = 1; w = 1; %Window dimensions constants
window_TSA = 6*h*w; %Calculationg window total surface area

%%Roof dimensions): 
p = 40; %Roof pitch(in degrees)
Trif_roofh = (W/2)*tand(40); %Calculating height of triangle
Trif_roofA = (1/2)*(W)*(Trif_roofh); %Calcalating area of face of roof triangle
Trif_roofl = (W/2)/cosd(40); %Calculationg roof side lenghts
roof_TSA = Trif_roofA*2 + 2*Trif_roofl*L; %Calculationg roof total surface area

%%Thickness:
twall = 0.2;  %Wall thickness
twindow = 0.01; %Window thickness

%%%Calculating Air mass within house
rho = 1.2250; %Densisity of air constant value
vwall = W*L*H; %Calculating volume of walls
Trif_roofv = Trif_roofA*L; %Calculating volume of roofs
v_House = vwall + Trif_roofv; %Calculating total house volume
m = v_House * rho; %Total air mass in kg

%%%House Total conductivity
kwall = 136.8; %Wall conductivity(in J/hr.m.oC)
kwindow = 2808; %Window conductivity(in J/hr.m.oC)
House_TSA = walls_TSA + roof_TSA - window_TSA; %House Total surface Area
R_House = (twall)/((kwall)*(House_TSA)); %House thermal resistance
R_window = (twindow)/((kwindow)*(window_TSA)); %Window thermal resistance
R_th = (R_House*R_window)/(R_House+R_window); %Total thermal resistance

%Simulink specific constants
Th = 50; %Heater temperature (oC)
Ts = 20; %Thermostat set temperature (oC)
Tavg = 12; %Average outside temperature (oC)
c = 1005.4; %Specific heat constant of air (J/kg.K)
mdot = 3600; %Heater mass flowrate (kg/hr)
Ce = 0.09; %Cost of energy ($/kW-hr)