%This is the program for my Centroid PROJECT .
clear           %Function to clear the workspace units.
clc           %Function to clear command line.

a = 0; b = 10; %Assigning constant values./ Vector limits.

n = 100; %Establishing amount of trapezoids to utilize.

h = (b-a)/n; %Establishing width of individual trapezoids.

xl = 0; xr = 0; yl = 0; yr = 0; %Initilising equation variables at "0"
sigma_A = 0; %Initilising sum Area value at zero.
sigma_Mx = 0; %Initilising sum x-moment at zero.
sigma_My = 0; %Initilising sum y-moment at zero.

%Gathering required user provided x and y values and storing in vector.
xm = input("Please input the manually determined centroid x-value: ");
ym = input("Please input the manually determined centroid y-value: ");
Measuredvec = [xm,ym];

%For loop to iterate through n value to increase sum Area.
for i=1:n
    xl = (i-1)*h; %Calculating the past iteration of x by 1value.
    yl = 0.06.*((xl-10).^2); %Calculating the newest iteration of y based on x-value.
    xr = (i)*h; %Calculating the past iteration of x by 1value.
    yr = 0.06.*((xr-10).^2); %Calculating the newest iteration of y based on x-value.

    dA = ((yl + yr) / 2) * h; %Trapezoid area for current slice iteration.
    sigma_A = sigma_A + dA; %Area sum updated.
    sigma_Mx = sigma_Mx + ((xl + xr) / 2) * dA; %X-moment updated.
    sigma_My = sigma_My + (0.5 * (yl^2 + yr^2) / 2) * h; %Y-moment updated.
end  

%Final co-ordinate values for the centroid calculated via program and stored in vector.
xc = sigma_Mx / sigma_A;
yc = sigma_My / sigma_A;
Matlabvec = [xc,yc];

%Percent difference calculation. Storing results in vector.
x_pd = ((abs(xc-xm))/xc)*100;
y_pd = ((abs(yc-ym))/yc)*100;
PercDiffvec = [x_pd,y_pd];


%Generating table of results.
Cordinvec = ['x';'y']; %Creating column vector of string values.
table(Cordinvec,Measuredvec',Matlabvec',PercDiffvec','VariableNames', {'Coordinate','Measured [cm]','Matlab [cm]', 'Percent Diff [%]'}) %Creating vector table.


%%Generating Graphs.
%Background graph.
%Establishing shape of graph.
x = [0:0.5:10]; y = 0.06.*((x-10).^2);
plot(x,y);  %Function to generate a line plot.
xlabel("x [cm]"), ylabel("y [cm]"); %Functions to assign axes labels.
xlim([0 10]); ylim([0 10]); %Generating axis limits.
%Frontend graph.
hold all %Function to merge several graphs on same plot.
scatter(xc,yc); %Marked co-ordinate.
title('Centroid of an area'); %Graph titled.