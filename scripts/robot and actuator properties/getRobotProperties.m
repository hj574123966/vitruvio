%% Nominal robot classes
% This file contains the robot properties for each of the defined robot
% classes. The function returns the properties for the selected robot.
% Index 1 is for front legs, 2 is for hind legs.

function robotProperties = getRobotProperties(robotSelection, transmissionMethod, actuateJointDirectly, jointNames, linkNames, linkCount)
    %% Your robot
    %%% Add your robot properties %%%
    robot.yourRobot.mass.total = 38.8; % only used to calculated cost of transport
    robot.yourRobot.legCount   = 4;
    
    % Density of each link
    % kg/m^3. Density values calculated to give correct link mass when link
    % approximated as solid cylinder.
    robot.yourRobot.legDensity.hip(1)       = 9728.3;   robot.yourRobot.legDensity.hip(2)     = 9728.3;
    robot.yourRobot.legDensity.thigh(1)     = 5826.3;   robot.yourRobot.legDensity.thigh(2)   = 5826.3;
    robot.yourRobot.legDensity.shank(1)     = 888.2668; robot.yourRobot.legDensity.shank(2)     = 888.2668;
    robot.yourRobot.legDensity.foot(1)      = 800;      robot.yourRobot.legDensity.foot(2)      = 800;
    robot.yourRobot.legDensity.phalanges(1) = 800;      robot.yourRobot.legDensity.phalanges(2) = 800;    
    
    % End effector mass
    robot.yourRobot.EE(1).mass = 0.1402;
    robot.yourRobot.EE(2).mass = 0.1402;

    % Offset from nominal CoM position to base hip attachment for each leg.
    robot.yourRobot.xNom(1) = 0.225;
    robot.yourRobot.xNom(2) = 0.225;
    robot.yourRobot.yNom(1) = 0.11;
    robot.yourRobot.yNom(2) = 0.11;
    robot.yourRobot.zNom = 0; % offset from CoM to HAA in z direction. Positive value means HAA above CoM.
    
    robot.yourRobot.nomHipPos.LF = [ robot.yourRobot.xNom(1),  robot.yourRobot.yNom(1), robot.yourRobot.zNom];
    robot.yourRobot.nomHipPos.LH = [-robot.yourRobot.xNom(2),  robot.yourRobot.yNom(2), robot.yourRobot.zNom];
    robot.yourRobot.nomHipPos.RF = [ robot.yourRobot.xNom(1), -robot.yourRobot.yNom(1), robot.yourRobot.zNom];
    robot.yourRobot.nomHipPos.RH = [-robot.yourRobot.xNom(2), -robot.yourRobot.yNom(2), robot.yourRobot.zNom];

    % Link lengths [m]
    robot.yourRobot.hip(1).length   = 0.112;
    robot.yourRobot.hip(2).length   = 0.112;
    robot.yourRobot.thigh(1).length = 0.25;
    robot.yourRobot.thigh(2).length = 0.25;
    robot.yourRobot.shank(1).length = 0.33; 
    robot.yourRobot.shank(2).length = 0.33;
    robot.yourRobot.foot(1).length  = 0.16;
    robot.yourRobot.foot(2).length  = 0.16;
    robot.yourRobot.phalanges(1).length = 0.1;
    robot.yourRobot.phalanges(2).length = 0.1;

    % Link radius [m] (only used to calculate link mass as solid cylinder)
    robot.yourRobot.hip(1).radius = 0.015;
    robot.yourRobot.hip(2).radius = 0.015;
    robot.yourRobot.thigh(1).radius = 0.015;
    robot.yourRobot.thigh(2).radius = 0.015;
    robot.yourRobot.shank(1).radius = 0.015;
    robot.yourRobot.shank(2).radius = 0.015;
    robot.yourRobot.foot(1).radius = 0.015;
    robot.yourRobot.foot(2).radius = 0.015;
    robot.yourRobot.phalanges(1).radius = 0.015;
    robot.yourRobot.phalanges(2).radius = 0.015;

    % Joint angle limits (used only in reachable positions plot)
    % q1 HAA, q2 HFE, q3 KFE, q4 AFE
    robot.yourRobot.q1.minAngle = -pi;
    robot.yourRobot.q1.maxAngle = pi;
    robot.yourRobot.q2.minAngle = -2*pi;
    robot.yourRobot.q2.maxAngle = 2*pi;
    robot.yourRobot.q3.minAngle = -2*pi;
    robot.yourRobot.q3.maxAngle = 2*pi;
    robot.yourRobot.q4.minAngle = -pi;
    robot.yourRobot.q4.maxAngle = pi;
    robot.yourRobot.q5.minAngle = -pi;
    robot.yourRobot.q5.maxAngle = pi;

    % Base dimensions used for visualization - visualized as a box
    robot.yourRobot.baseLength = 0.6;
    robot.yourRobot.baseWidth  = 0.24;
    robot.yourRobot.baseHeight = 0.2;     

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
     %% ANYmal Bear
    robot.ANYmalBear.mass.total = 38.8; 
    robot.ANYmalBear.legCount   = 4;
    
    % Density of each link
    % kg/m^3. Density values calculated to give correct link mass when link
    % approximated as solid cylinder.
    
    robot.ANYmalBear.legDensity.hip(1)       = 9728.3;   robot.ANYmalBear.legDensity.hip(2)     = 9728.3;
    robot.ANYmalBear.legDensity.thigh(1)     = 5826.3;   robot.ANYmalBear.legDensity.thigh(2)   = 5826.3;
    robot.ANYmalBear.legDensity.shank(1)     = 888.2668; robot.ANYmalBear.legDensity.shank(2)     = 888.2668;
    robot.ANYmalBear.legDensity.foot(1)      = 800;      robot.ANYmalBear.legDensity.foot(2)      = 800;
    robot.ANYmalBear.legDensity.phalanges(1) = 800;      robot.ANYmalBear.legDensity.phalanges(2) = 800;    
    
    % End effector mass
    robot.ANYmalBear.EE(1).mass = 0.1402;
    robot.ANYmalBear.EE(2).mass = 0.1402;

    % Offset from nominal CoM position to base hip attachment for each leg.
    robot.ANYmalBear.xNom(1) = 0.225;
    robot.ANYmalBear.xNom(2) = 0.225;
    robot.ANYmalBear.yNom(1) = 0.11;
    robot.ANYmalBear.yNom(2) = 0.11;
    robot.ANYmalBear.zNom = 0; % offset from CoM to HAA in z direction. Positive value means HAA above CoM.
    
    robot.ANYmalBear.nomHipPos.LF = [ robot.ANYmalBear.xNom(1),  robot.ANYmalBear.yNom(1), robot.ANYmalBear.zNom];
    robot.ANYmalBear.nomHipPos.LH = [-robot.ANYmalBear.xNom(2),  robot.ANYmalBear.yNom(2), robot.ANYmalBear.zNom];
    robot.ANYmalBear.nomHipPos.RF = [ robot.ANYmalBear.xNom(1), -robot.ANYmalBear.yNom(1), robot.ANYmalBear.zNom];
    robot.ANYmalBear.nomHipPos.RH = [-robot.ANYmalBear.xNom(2), -robot.ANYmalBear.yNom(2), robot.ANYmalBear.zNom];

    % link lengths [m]
    robot.ANYmalBear.hip(1).length   = 0.112;
    robot.ANYmalBear.hip(2).length   = 0.112;
    robot.ANYmalBear.thigh(1).length = 0.25; 
    robot.ANYmalBear.thigh(2).length = 0.25;
    robot.ANYmalBear.shank(1).length = 0.33;
    robot.ANYmalBear.shank(2).length = 0.33;
    robot.ANYmalBear.foot(1).length  = 0.16;
    robot.ANYmalBear.foot(2).length  = 0.16;
    robot.ANYmalBear.phalanges(1).length = 0.1;
    robot.ANYmalBear.phalanges(2).length = 0.1;

    % link radius [m]
    robot.ANYmalBear.hip(1).radius = 0.015;
    robot.ANYmalBear.hip(2).radius = 0.015;
    robot.ANYmalBear.thigh(1).radius = 0.015;
    robot.ANYmalBear.thigh(2).radius = 0.015;
    robot.ANYmalBear.shank(1).radius = 0.015;
    robot.ANYmalBear.shank(2).radius = 0.015;
    robot.ANYmalBear.foot(1).radius = 0.015;
    robot.ANYmalBear.foot(2).radius = 0.015;
    robot.ANYmalBear.phalanges(1).radius = 0.015;
    robot.ANYmalBear.phalanges(2).radius = 0.015;

    % joint angle limits
    % q1 HAA, q2 HFE, q3 KFE, q4 AFE
    robot.ANYmalBear.q1.minAngle = -pi;
    robot.ANYmalBear.q1.maxAngle = pi;
    robot.ANYmalBear.q2.minAngle = -2*pi;
    robot.ANYmalBear.q2.maxAngle = 2*pi;
    robot.ANYmalBear.q3.minAngle = -2*pi;
    robot.ANYmalBear.q3.maxAngle = 2*pi;
    robot.ANYmalBear.q4.minAngle = -pi;
    robot.ANYmalBear.q4.maxAngle = pi;
    robot.ANYmalBear.q5.minAngle = -pi;
    robot.ANYmalBear.q5.maxAngle = pi;

     % Base dimensions used for visualization - visualized as a box
     robot.ANYmalBear.baseLength = 0.6;
     robot.ANYmalBear.baseWidth  = 0.24;
     robot.ANYmalBear.baseHeight = 0.2;     
     
     %% Vitruvian Biped
    robot.vitruvianBiped.mass.total = 2.21; 
    robot.vitruvianBiped.legCount   = 2;
    
    % Density of each link
    robot.vitruvianBiped.legDensity.hip(1)       = 1004;    
    robot.vitruvianBiped.legDensity.thigh(1)     = 1117.3;  
    robot.vitruvianBiped.legDensity.shank(1)     = 1004; 
    robot.vitruvianBiped.legDensity.foot(1)      = 1004;  
    robot.vitruvianBiped.legDensity.phalanges(1) = 1004; 
    
    % End effector mass
    robot.vitruvianBiped.EE(1).mass = 0.0025;

    % offset from CoM to HAA for each leg.
    robot.vitruvianBiped.xNom(1) = 0; %0.05;
    robot.vitruvianBiped.yNom(1) = 0.085;
    robot.vitruvianBiped.zNom = 0.03; % offset from CoM to HAA in z direction. Positive value means HAA above CoM.
    
    robot.vitruvianBiped.nomHipPos.LF = [robot.vitruvianBiped.xNom(1),  robot.vitruvianBiped.yNom(1), robot.vitruvianBiped.zNom];
    robot.vitruvianBiped.nomHipPos.RF = [robot.vitruvianBiped.xNom(1), -robot.vitruvianBiped.yNom(1), robot.vitruvianBiped.zNom];

    % link lengths [m]
    % fore, hind
    robot.vitruvianBiped.hip(1).length = 0.0001;
    robot.vitruvianBiped.thigh(1).length = 0.1936; %0.1936, 0.25
    robot.vitruvianBiped.shank(1).length = 0.25;
    robot.vitruvianBiped.foot(1).length = 0.05;
    robot.vitruvianBiped.phalanges(1).length = 0.05;

    % link radius [m]
    % These were selected to get the correct mass value considering the
    % material density and link length.
    robot.vitruvianBiped.hip(1).radius = 0.015;
    robot.vitruvianBiped.thigh(1).radius = 0.015; 
    robot.vitruvianBiped.shank(1).radius = 0.015;
    robot.vitruvianBiped.foot(1).radius = 0.015;
    robot.vitruvianBiped.phalanges(1).radius = 0.015;

    % joint angle limits
    % q1 HAA, q2 HFE, q3 KFE, q4 AFE
    robot.vitruvianBiped.q1.minAngle = -pi;
    robot.vitruvianBiped.q1.maxAngle = pi;
    robot.vitruvianBiped.q2.minAngle = -2*pi;
    robot.vitruvianBiped.q2.maxAngle = 2*pi;
    robot.vitruvianBiped.q3.minAngle = -2*pi;
    robot.vitruvianBiped.q3.maxAngle = 2*pi;
    robot.vitruvianBiped.q4.minAngle = -pi;
    robot.vitruvianBiped.q4.maxAngle = pi;
    robot.vitruvianBiped.q5.minAngle = -pi;
    robot.vitruvianBiped.q5.maxAngle = pi;

     % Base dimensions used for visualization - visualized as a box
     robot.vitruvianBiped.baseLength = 0.08;
     robot.vitruvianBiped.baseWidth  = 0.15;
     robot.vitruvianBiped.baseHeight = 0.08;
     
     %% Universal
    robot.universal.mass.total = 39.53; % (with payload)
    robot.universal.legCount = 4;
    
    % Density of each link
    robot.universal.legDensity.hip(1)       = 900;   robot.universal.legDensity.hip(2)         = 900;
    robot.universal.legDensity.thigh(1)     = 900;   robot.universal.legDensity.thigh(2)       = 900;
    robot.universal.legDensity.shank(1)     = 900;     robot.universal.legDensity.shank(2)     = 900;
    robot.universal.legDensity.foot(1)      = 900;     robot.universal.legDensity.foot(2)      = 900;
    robot.universal.legDensity.phalanges(1) = 900;     robot.universal.legDensity.phalanges(2) = 900;
    
    % End effector mass
    robot.universal.EE(1).mass = 0.1923;
    robot.universal.EE(2).mass = 0.1923;    

    % Offset from CoM to each hip
    robot.universal.xNom(1) = 0.25;
    robot.universal.xNom(2) = 0.25;
    robot.universal.yNom(1) = 0.19;
    robot.universal.yNom(2) = 0.19;
    robot.universal.zNom = 0; % offset from CoM to hip attachment

    % row order:    LF LH RF RH
    % column order: x, y, z
    robot.universal.nomHipPos.LF = [robot.universal.xNom(1), robot.universal.yNom(1), robot.universal.zNom];
    robot.universal.nomHipPos.LH = [-robot.universal.xNom(2), robot.universal.yNom(2), robot.universal.zNom];
    robot.universal.nomHipPos.RF = [robot.universal.xNom(1), -robot.universal.yNom(1), robot.universal.zNom];
    robot.universal.nomHipPos.RH = [-robot.universal.xNom(2), -robot.universal.yNom(2), robot.universal.zNom];

    % link lengths [m]
    % fore, hind
    robot.universal.hip(1).length = 0.14;
    robot.universal.hip(2).length = 0.14;
    robot.universal.thigh(1).length = 0.35;
    robot.universal.thigh(2).length = 0.35;
    robot.universal.shank(1).length = 0.45;
    robot.universal.shank(2).length = 0.45;
    robot.universal.foot(1).length = 0.2;
    robot.universal.foot(2).length = 0.2;
    robot.universal.phalanges(1).length = 0.05;
    robot.universal.phalanges(2).length = 0.1;

    % link radius [m]
    % update these values
    robot.universal.hip(1).radius = 0.015;
    robot.universal.hip(2).radius = 0.015;
    robot.universal.thigh(1).radius = 0.015;
    robot.universal.thigh(2).radius = 0.015;
    robot.universal.shank(1).radius = 0.015;
    robot.universal.shank(2).radius = 0.015;
    robot.universal.foot(1).radius = 0.015;
    robot.universal.foot(2).radius = 0.015;
    robot.universal.phalanges(1).radius = 0.015;
    robot.universal.phalanges(2).radius = 0.015;

    % joint angle limits
    % q1 HAA, q2 HFE, q3 KFE, q4 AFE
    robot.universal.q1.minAngle = -pi;
    robot.universal.q1.maxAngle = pi;
    robot.universal.q2.minAngle = -pi/2;
    robot.universal.q2.maxAngle = pi/2;
    robot.universal.q3.minAngle = -pi;
    robot.universal.q3.maxAngle = pi;
    robot.universal.q4.minAngle = -pi;
    robot.universal.q4.maxAngle = pi;
    robot.universal.q5.minAngle = -pi;
    robot.universal.q5.maxAngle = pi;
    
     % Base dimensions used for visualization - visualized as a box
     robot.universal.baseWidth  = 0.4;
     robot.universal.baseLength = 0.75;
     robot.universal.baseHeight = 0.2;
     
    %% Speedy 
    robot.speedy.mass.total = 22.52;
    robot.speedy.legCount   = 4;
    
    % Density of each link
    robot.speedy.legDensity.hip(1)       = 900;   robot.speedy.legDensity.hip(2)       = 900;
    robot.speedy.legDensity.thigh(1)     = 900;   robot.speedy.legDensity.thigh(2)     = 900;
    robot.speedy.legDensity.shank(1)     = 900;     robot.speedy.legDensity.shank(2)     = 900;
    robot.speedy.legDensity.foot(1)      = 900;     robot.speedy.legDensity.foot(2)      = 900;
    robot.speedy.legDensity.phalanges(1) = 900;     robot.speedy.legDensity.phalanges(2) = 900;
    
    % End effector mass
    robot.speedy.EE(1).mass = 0.1;
    robot.speedy.EE(2).mass = 0.1;    

    % Offset from CoM to each hip
    robot.speedy.xNom(1) = 0.25;
    robot.speedy.xNom(2) = 0.25;
    robot.speedy.yNom(1) = 0.1; % front
    robot.speedy.yNom(2) = 0.18; % hind
    robot.speedy.zNom = 0;

    % row order:    LF LH RF RH
    % column order: x, y, z
    robot.speedy.nomHipPos.LF = [robot.speedy.xNom(1), robot.speedy.yNom(1), robot.speedy.zNom];
    robot.speedy.nomHipPos.LH = [-robot.speedy.xNom(2), robot.speedy.yNom(2), robot.speedy.zNom];
    robot.speedy.nomHipPos.RF = [robot.speedy.xNom(1), -robot.speedy.yNom(1), robot.speedy.zNom];
    robot.speedy.nomHipPos.RH = [-robot.speedy.xNom(2), -robot.speedy.yNom(2), robot.speedy.zNom];

    % link lengths [m]
    % fore, hind
    robot.speedy.hip(1).length = 0.15;
    robot.speedy.hip(2).length = 0.15;
    robot.speedy.thigh(1).length = 0.4;
    robot.speedy.thigh(2).length = 0.4;
    robot.speedy.shank(1).length = 0.4;
    robot.speedy.shank(2).length = 0.4;
    robot.speedy.foot(1).length = 0.15;
    robot.speedy.foot(2).length = 0.15;
    robot.speedy.phalanges(1).length = 0.1;
    robot.speedy.phalanges(2).length = 0.1;

    % link radius [m]
    robot.speedy.hip(1).radius = 0.015;
    robot.speedy.hip(2).radius = 0.015;
    robot.speedy.thigh(1).radius = 0.015;
    robot.speedy.thigh(2).radius = 0.015;
    robot.speedy.shank(1).radius = 0.015;
    robot.speedy.shank(2).radius = 0.015;
    robot.speedy.foot(1).radius = 0.015;
    robot.speedy.foot(2).radius = 0.015;
    robot.speedy.phalanges(1).radius = 0.015;
    robot.speedy.phalanges(2).radius = 0.015;

    % joint angle limits
    % q1 HAA, q2 HFE, q3 KFE, q4 AFE
    robot.speedy.q1.minAngle = -pi;
    robot.speedy.q1.maxAngle = pi;
    robot.speedy.q2.minAngle = -pi/2;
    robot.speedy.q2.maxAngle = pi/2;
    robot.speedy.q3.minAngle = -pi;
    robot.speedy.q3.maxAngle = pi;
    robot.speedy.q4.minAngle = -pi;
    robot.speedy.q4.maxAngle = pi;
    robot.speedy.q5.minAngle = -pi;
    robot.speedy.q5.maxAngle = pi;
    
     % Base dimensions used for visualization - visualized as a box
     robot.speedy.baseLength = 0.8;
     robot.speedy.baseWidth  = 0.2;
     robot.speedy.baseHeight = 0.2;
     
     %% Massivo 
    robot.massivo.mass.total = 80; % (with payload)
    robot.massivo.legCount   = 4;
    
    % Density of each link
    % g/cm^3
    robot.massivo.legDensity.hip(1)       = 900;   robot.massivo.legDensity.hip(2)         = 900;
    robot.massivo.legDensity.thigh(1)     = 900;   robot.massivo.legDensity.thigh(2)       = 900;
    robot.massivo.legDensity.shank(1)     = 900;     robot.massivo.legDensity.shank(2)     = 900;
    robot.massivo.legDensity.foot(1)      = 900;     robot.massivo.legDensity.foot(2)      = 900;
    robot.massivo.legDensity.phalanges(1) = 900;     robot.massivo.legDensity.phalanges(2) = 900;
    
    % End effector mass
    robot.massivo.EE(1).mass = 0.2;
    robot.massivo.EE(2).mass = 0.2;

    % offset from CoM to each hip
    robot.massivo.xNom(1) = 0.276;
    robot.massivo.xNom(2) = 0.276;
    robot.massivo.yNom(1) = 0.3;
    robot.massivo.yNom(2) = 0.3;
    robot.massivo.zNom = -0.0487;

    % row order:    LF LH RF RH
    % column order: x, y, z
    robot.massivo.nomHipPos.LF = [robot.massivo.xNom(1), robot.massivo.yNom(1), robot.massivo.zNom];
    robot.massivo.nomHipPos.LH = [-robot.massivo.xNom(2), robot.massivo.yNom(2), robot.massivo.zNom];
    robot.massivo.nomHipPos.RF = [robot.massivo.xNom(1), -robot.massivo.yNom(1), robot.massivo.zNom];
    robot.massivo.nomHipPos.RH = [-robot.massivo.xNom(2), -robot.massivo.yNom(2), robot.massivo.zNom];

    % link lengths [m]
    % fore, hind
    robot.massivo.hip(1).length = 0.15;
    robot.massivo.hip(2).length = 0.15;
    robot.massivo.thigh(1).length = 0.45;
    robot.massivo.thigh(2).length = 0.45;
    robot.massivo.shank(1).length = 0.45;
    robot.massivo.shank(2).length = 0.45;
    robot.massivo.foot(1).length = 0.1;
    robot.massivo.foot(2).length = 0.1;
    robot.massivo.phalanges(1).length = 0.05;
    robot.massivo.phalanges(2).length = 0.05;

    % link radius [m]
    robot.massivo.hip(1).radius = 0.02;
    robot.massivo.hip(2).radius = 0.02;
    robot.massivo.thigh(1).radius = 0.02;
    robot.massivo.thigh(2).radius = 0.02;
    robot.massivo.shank(1).radius = 0.02;
    robot.massivo.shank(2).radius = 0.02;
    robot.massivo.foot(1).radius = 0.02;
    robot.massivo.foot(2).radius = 0.02;
    robot.massivo.phalanges(1).radius = 0.02;
    robot.massivo.phalanges(2).radius = 0.02;

    % joint angle limits
    % q1 HAA, q2 HFE, q3 KFE, q4 AFE
    robot.massivo.q1.minAngle = -pi;
    robot.massivo.q1.maxAngle = pi;
    robot.massivo.q2.minAngle = -pi/2;
    robot.massivo.q2.maxAngle = pi/2;
    robot.massivo.q3.minAngle = -pi;
    robot.massivo.q3.maxAngle = pi;
    robot.massivo.q4.minAngle = -pi;
    robot.massivo.q4.maxAngle = pi;
    robot.massivo.q5.minAngle = -pi;
    robot.massivo.q5.maxAngle = pi;
  
     % Base dimensions used for visualization - visualized as a box
     robot.massivo.baseLength = 0.7;
     robot.massivo.baseWidth  = 0.7;
     robot.massivo.baseHeight = 0.1;
     
    %% Centaur 
    robot.centaur.mass.total = 80; % (with payload)
    robot.centaur.legCount   = 4;

    % Density of each link
    robot.centaur.legDensity.hip(1)       = 900;   robot.centaur.legDensity.hip(2)         = 900;
    robot.centaur.legDensity.thigh(1)     = 900;   robot.centaur.legDensity.thigh(2)       = 900;
    robot.centaur.legDensity.shank(1)     = 900;     robot.centaur.legDensity.shank(2)     = 900;
    robot.centaur.legDensity.foot(1)      = 900;     robot.centaur.legDensity.foot(2)      = 900;
    robot.centaur.legDensity.phalanges(1) = 900;     robot.centaur.legDensity.phalanges(2) = 900;
    
    % End effector mass
    robot.centaur.EE(1).mass = 0.2;
    robot.centaur.EE(2).mass = 0.2;

    % offset from CoM to each hip
    robot.centaur.xNom(1) = 0.1451;
    robot.centaur.xNom(2) = 0.407;
    robot.centaur.yNom(1) = 0.3;
    robot.centaur.yNom(2) = 0.3;
    robot.centaur.zNom = 0; %-0.553 + 0.5043; This value is not correct

    % row order:    LF LH RF RH
    % column order: x, y, z
    robot.centaur.nomHipPos.LF = [robot.centaur.xNom(1), robot.centaur.yNom(1), robot.centaur.zNom];
    robot.centaur.nomHipPos.LH = [-robot.centaur.xNom(2), robot.centaur.yNom(2), robot.centaur.zNom];
    robot.centaur.nomHipPos.RF = [robot.centaur.xNom(1), -robot.centaur.yNom(1), robot.centaur.zNom];
    robot.centaur.nomHipPos.RH = [-robot.centaur.xNom(2), -robot.centaur.yNom(2), robot.centaur.zNom];

    % link lengths [m]
    % fore, hind
    robot.centaur.hip(1).length = 0.15;
    robot.centaur.hip(2).length = 0.15;
    robot.centaur.thigh(1).length = 0.35;
    robot.centaur.thigh(2).length = 0.35;
    robot.centaur.shank(1).length = 0.4;
    robot.centaur.shank(2).length = 0.4;
    robot.centaur.foot(1).length = 0.05;
    robot.centaur.foot(2).length = 0.05;
    robot.centaur.phalanges(1).length = 0.05;
    robot.centaur.phalanges(2).length = 0.05;

    % link radius [m]
    robot.centaur.hip(1).radius = 0.02;
    robot.centaur.hip(2).radius = 0.02;
    robot.centaur.thigh(1).radius = 0.02;
    robot.centaur.thigh(2).radius = 0.02;
    robot.centaur.shank(1).radius = 0.02;
    robot.centaur.shank(2).radius = 0.02;
    robot.centaur.foot(1).radius = 0.02;
    robot.centaur.foot(2).radius = 0.02;
    robot.centaur.phalanges(1).radius = 0.02;
    robot.centaur.phalanges(2).radius = 0.02;

    % joint angle limits
    % q1 HAA, q2 HFE, q3 KFE, q4 AFE
    robot.centaur.q1.minAngle = -pi;
    robot.centaur.q1.maxAngle = pi;
    robot.centaur.q2.minAngle = -pi/2;
    robot.centaur.q2.maxAngle = pi/2;
    robot.centaur.q3.minAngle = -pi;
    robot.centaur.q3.maxAngle = pi;
    robot.centaur.q4.minAngle = -pi;
    robot.centaur.q4.maxAngle = pi;
    robot.centaur.q5.minAngle = -pi;
    robot.centaur.q5.maxAngle = pi;

     % Base dimensions used for visualization - visualized as a box
     robot.centaur.baseLength = 0.7;
     robot.centaur.baseWidth  = 0.7;
     robot.centaur.baseHeight = 0.1;
     
    %% Mini 
    robot.mini.mass.total = 10;
    robot.mini.legCount   = 4;

    % Density of each link %kg/m^3
    robot.mini.legDensity.hip(1)       = 900;   robot.mini.legDensity.hip(2)       = 900;
    robot.mini.legDensity.thigh(1)     = 900;   robot.mini.legDensity.thigh(2)     = 900;
    robot.mini.legDensity.shank(1)     = 900;     robot.mini.legDensity.shank(2)     = 900;
    robot.mini.legDensity.foot(1)      = 900;     robot.mini.legDensity.foot(2)      = 900;
    robot.mini.legDensity.phalanges(1) = 900;     robot.mini.legDensity.phalanges(2) = 900;
    
    % End effector mass
    robot.mini.EE(1).mass = 0.1;
    robot.mini.EE(2).mass = 0.1;
    
    robot.mini.xNom(1) = 0.18;
    robot.mini.xNom(2) = 0.18;
    robot.mini.yNom(1) = 0.1;
    robot.mini.yNom(2) = 0.1;
    robot.mini.zNom = 0.012;

    % row order:    LF LH RF RH
    % column order: x, y, z
    robot.mini.nomHipPos.LF = [robot.mini.xNom(1), robot.mini.yNom(1), robot.mini.zNom];
    robot.mini.nomHipPos.LH = [-robot.mini.xNom(2), robot.mini.yNom(2), robot.mini.zNom];
    robot.mini.nomHipPos.RF = [robot.mini.xNom(1), -robot.mini.yNom(1), robot.mini.zNom];
    robot.mini.nomHipPos.RH = [-robot.mini.xNom(2), -robot.mini.yNom(2), robot.mini.zNom];

    % link lengths [m]
    % fore, hind
    robot.mini.hip(1).length = 0.05;
    robot.mini.hip(2).length = -0.05;
    robot.mini.thigh(1).length = 0.15;
    robot.mini.thigh(2).length = 0.15;
    robot.mini.shank(1).length = 0.15;
    robot.mini.shank(2).length = 0.15;
    robot.mini.foot(1).length = 0.05;
    robot.mini.foot(2).length = 0.05;
    robot.mini.phalanges(1).length = 0.05;
    robot.mini.phalanges(2).length = 0.05;

    % link radius [m]
    robot.mini.hip(1).radius = 0.015;
    robot.mini.hip(2).radius = 0.015;
    robot.mini.thigh(1).radius = 0.015;
    robot.mini.thigh(2).radius = 0.015;
    robot.mini.shank(1).radius = 0.015;
    robot.mini.shank(2).radius = 0.015;
    robot.mini.foot(1).radius = 0.015;
    robot.mini.foot(2).radius = 0.015;
    robot.mini.phalanges(1).radius = 0.015;
    robot.mini.phalanges(2).radius = 0.015;

    % joint angle limits
    % q1 HAA, q2 HFE, q3 KFE, q4 AFE
    robot.mini.q1.minAngle = -pi;
    robot.mini.q1.maxAngle = pi;
    robot.mini.q2.minAngle = -pi/2;
    robot.mini.q2.maxAngle = pi/2;
    robot.mini.q3.minAngle = -pi;
    robot.mini.q3.maxAngle = pi;
    robot.mini.q4.minAngle = -pi;
    robot.mini.q4.maxAngle = pi;
    robot.mini.q5.minAngle = -pi;
    robot.mini.q5.maxAngle = pi;

     % Base dimensions used for visualization - visualized as a box
     robot.mini.baseLength = 0.4;
     robot.mini.baseWidth  = 0.2;
     robot.mini.baseHeight = 0.1;
     
     %% defaultHopper 
    robot.hopper.mass.total = 10; % this value is incorrect
    robot.hopper.legCount   = 1;
    
    % Density of each link
    robot.hopper.legDensity.hip(1)       = 900;   robot.hopper.legDensity.hip(2)         = 900;
    robot.hopper.legDensity.thigh(1)     = 900;   robot.hopper.legDensity.thigh(2)       = 900;
    robot.hopper.legDensity.shank(1)     = 900;     robot.hopper.legDensity.shank(2)     = 900;
    robot.hopper.legDensity.foot(1)      = 900;     robot.hopper.legDensity.foot(2)      = 900;
    robot.hopper.legDensity.phalanges(1) = 900;     robot.hopper.legDensity.phalanges(2) = 900;
    
    % End effector mass
    robot.hopper.EE(1).mass = 0.1;

    robot.hopper.xNom(1) = 0;
    robot.hopper.yNom(1) = 0;
    robot.hopper.zNom =  0.1;

    robot.hopper.nomHipPos.LF = [robot.hopper.xNom(1), robot.hopper.yNom(1), robot.hopper.zNom];

    % link lengths [m]
    robot.hopper.hip(1).length = 0.01;
    robot.hopper.thigh(1).length = 0.45;
    robot.hopper.shank(1).length = 0.45;
    robot.hopper.foot(1).length = 0.05;
    robot.hopper.phalanges(1).length = 0.05;

    % link radius [m]
    robot.hopper.hip(1).radius = 0.015;
    robot.hopper.thigh(1).radius = 0.015;
    robot.hopper.shank(1).radius = 0.015;
    robot.hopper.foot(1).radius = 0.015;
    robot.hopper.phalanges(1).radius = 0.015;

    % joint angle limits
    % q1 HAA, q2 HFE, q3 KFE, q4 AFE
    robot.hopper.q1.minAngle = -pi;
    robot.hopper.q1.maxAngle = pi;
    robot.hopper.q2.minAngle = -pi/2;
    robot.hopper.q2.maxAngle = pi/2;
    robot.hopper.q3.minAngle = -pi;
    robot.hopper.q3.maxAngle = pi;
    robot.hopper.q4.minAngle = -pi;
    robot.hopper.q4.maxAngle = pi;
    robot.hopper.q5.minAngle = -pi;
    robot.hopper.q5.maxAngle = pi;

     % Base dimensions used for visualization - visualized as a box
     robot.hopper.baseLength = 0.2;
     robot.hopper.baseWidth  = 0.2;
     robot.hopper.baseHeight = 0.2;

     %% Compute link mass and inertia for selected robot
     % Additional mass due to transmission
     [transmissionMass, transmissionGearRatio] = getTransmissionProperties(transmissionMethod, actuateJointDirectly, robot, robotSelection, jointNames, linkNames, linkCount);
        % Link mass [kg] and inertia [kg.m^2] based on cylindrical link
        % with constant density. Density is dependent on link density and
        % transmission mass.
    for i = 1:linkCount+1
        if robot.(robotSelection).legCount > 2
            frontHindIndex = 2; % Robot has front and hind legs.
        else
            frontHindIndex = 1; % Robot only has 'front' legs (monopod, biped).
        end
        for j = 1:frontHindIndex % (1 = front, 2 = hind)
            % M = pi*R^2*L_link*density_link + m_transmission
            robot.(robotSelection).(linkNames{i})(j).mass = pi()*robot.(robotSelection).(linkNames{i})(j).radius^2*abs(robot.(robotSelection).(linkNames{i})(j).length)*robot.(robotSelection).legDensity.(linkNames{i})(j) ...
                                                            + transmissionMass.(linkNames{i})(j);
            % Inertia = (1/3)*M*L_link^2                                            
            robot.(robotSelection).(linkNames{i})(j).inertia = (1/3)*robot.(robotSelection).(linkNames{i})(j).mass*robot.(robotSelection).(linkNames{i})(j).length^2;
        end
    end
    
    for i = 1:length(jointNames)
        if robot.(robotSelection).legCount > 2
            frontHindIndex = 2; % Robot has front and hind legs.
        else
            frontHindIndex = 1; % Robot only has 'front' legs.
        end
        for j = 1:frontHindIndex % (1 = front, 2 = hind)
            robot.(robotSelection).transmissionGearRatio.(jointNames(i,:))(j) = transmissionGearRatio.(jointNames(i,:))(j);
        end
    end
    
    %% Load in the parameters of the selected robot into the struct robotProperties which is then used by the rest of the program  
    robotProperties = robot.(robotSelection);
end