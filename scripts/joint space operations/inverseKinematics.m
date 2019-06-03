function [jointPositions, r1, r2, r3, r4, r5, rEE] = inverseKinematics(l_hipAttachmentOffset, linkCount, meanCyclicMotionHipEE, quadruped, EEselection, taskSelection, configSelection, hipParalleltoBody);

 % Input: desired end-effector position, quadruped properties
 %        initial guess for joint angles, threshold for the stopping-criterion
 % Output: joint angles which match desired end-effector position

 %% Setup
  tol = 0.001;
  it = 0;
  r_H_0EE_des = meanCyclicMotionHipEE.(EEselection).position; % desired EE position
  max_it = 1000;

  %% Get initial conditions for IK algorithm
  q0 = getInitialJointAnglesForDesiredConfig(taskSelection, EEselection, configSelection);
  q = [q0'];
  jointPositions = zeros(length(meanCyclicMotionHipEE.(EEselection).position(:,1)),linkCount+2);
  lambda = 0.001; % damping factor -> values below lambda are set to zero in matrix inversion
  % Initialize error -> only position because we don't have orientation data
  rotBodyY = 0;
  q = zeros(linkCount+2, 1);
  [J_P, C_0EE, r_H_01, r_H_02, r_H_03, r_H_04, r_H_05, r_H_0EE] = jointToPosJac(l_hipAttachmentOffset, linkCount, rotBodyY, q, quadruped, EEselection, hipParalleltoBody);
  
  % preallocate arrays for joint coordinates
  r1 = zeros(length(meanCyclicMotionHipEE.(EEselection).position(:,1)), 3);
  r2 = r1;
  r3 = r1;
  r4 = r1;
  r5 = r1;
  r6 = r1;

  %% Iterative inverse kinematics
  for i = 1:length(meanCyclicMotionHipEE.(EEselection).position(:,1))
       % to keep system right handed, input body rotation as negative. A
       % negative value then means positive angle of attack.
        rotBodyY = -meanCyclicMotionHipEE.body.eulerAngles(i,2); % rotation of body about inertial y
        it = 0; % reset iteration count
        dr = r_H_0EE_des(i,:)' - r_H_0EE;
      while (norm(dr)>tol && it < max_it)
         [J_P, C_0EE, r_H_01, r_H_02, r_H_03, r_H_04, r_H_05, r_H_0EE] = jointToPosJac(l_hipAttachmentOffset, linkCount, rotBodyY, q, quadruped, EEselection, hipParalleltoBody);
         dr = r_H_0EE_des(i,:)' - r_H_0EE;
         dq = pinv(J_P, lambda)*dr;
         % update size is largely responsible for computation time. With a
         % larger update size factor of 0.2, the smallest joint angle is
         % not found, but there are no jumps of ~2pi between steps
          q = q + 0.05*dq;
         it = it+1;    
      end  
      
%       fprintf('Inverse kinematics terminated after %d iterations.\n',it);
      jointPositions(i,:) = q';
      rEE(i,:) = r_H_0EE;
      % x y z coordinates of joints
      r1(i,:) = r_H_01;
      r2(i,:) = r_H_02;
      r3(i,:) = r_H_03;
      r4(i,:) = r_H_04;
      r5(i,:) = r_H_05;
  end     