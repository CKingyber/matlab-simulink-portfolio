%This is the program for the Ackermann Steering PROJECT .
clc
clear

r3 = 0.750; r4 = 1.031; ao = 14.04;  %Assigning constant values to variables.

x = [-0.4:0.05:0.4];  %Line of code to generate vector of 'x' values from -0.4 [in] to +0.4 [in] in 0.05 [in] increments.

%Wheel Angle Calculations
Lo = sqrt((r3^2)+(r4^2)-(2*r3*r4*cosd(90+ao)));
deltao = acosd( ((r3^2)+(Lo^2)-(r4^2))/(2*r3*Lo) );
lambdao = acosd( ((r4^2)+(Lo^2)-(r3^2))/(2*r4*Lo) );
xl = x(x<0); %Isolating 'x' values to the left of origin.
xr = x(x>=0);  %Isolating 'x' values to the right of origin.


%RightWheel
Ll = sqrt((xl.^2)+(Lo^2)-(2*xl.*Lo*cosd(deltao)));%When turning Left Calculations.
lambdal = acosd( ((r4^2)+(Ll.^2)-(r3^2))./(2*r4*Ll) );
zetal = acosd( ((Ll.^2)+(Lo^2)-(xl.^2))./(2*Lo*Ll) );

Lr = sqrt((xr.^2)+(Lo^2)-(2*xr.*Lo*cosd(deltao)));%When turning Right Calculations.
lambdar = acosd( ((r4^2)+(Lr.^2)-(r3^2))./(2*r4*Lr) );
zetar = acosd( ((Lr.^2)+(Lo^2)-(xr.^2))./(2*Lo*Lr) );


TitaRl = -1*(zetal + lambdal - lambdao);  %When turning Right angles.
TitaRr = lambdao + zetar - lambdar;  %When turning Left angles.

TitaR = [TitaRl,TitaRr];  %Combing angles into a single vector.


%LeftWheel
TitaL = -fliplr(TitaR);  %Function to flip the results of the right wheel as angles mirror each other.


%Table
Results_table = table(x',TitaL',TitaR','VariableNames',{'x [in]', 'TitaL [degrees]', 'TitaR [degrees]'});
Results_table
