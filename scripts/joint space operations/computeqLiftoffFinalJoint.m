function qLiftoff = computeqLiftoffFinalJoint(heuristic, hipAttachmentOffset, linkCount, meanCyclicMotionHipEE, quadruped, EEselection, taskSelection, configSelection, hipParalleltoBody, Leg);
 % solve the angle of all joints such that the angle beetween the final link and the ground at liftoff is as desired. 
 %% Setup
  tol = 0.0001;
  it = 0;
  r_H_0EE_des = meanCyclicMotionHipEE.(EEselection).position(1,:); % desired EE position
  thetaLiftoff_des = heuristic.torqueAngle.thetaLiftoff_des;
  % get length of the final link, either foot or phalanges.
  if linkCount == 3
      if (EEselection == 'LF') | (EEselection == 'RF')
        finalLinkLength = quadruped.foot(1).length;
      else
        finalLinkLength = quadruped.foot(2).length; 
      end
  end
  if linkCount == 4
      if (EEselection == 'LF') | (EEselection == 'RF')
        finalLinkLength = quadruped.phalanges(1).length;
      else
        finalLinkLength = quadruped.phalanges(2).length ;
      end
  end

  % the desired position of the final joint (AFE or DFE) is determined by
  % the desired EE position and the desired liftoff angle between the
  % horizonal and the final link.
  r_H_0finalJoint_des = [r_H_0EE_des(1,1) - finalLinkLength*cos(thetaLiftoff_des), ...
                         r_H_0EE_des(1,2), ...
                         r_H_0EE_des(1,3) + finalLinkLength*sin(thetaLiftoff_des)];

  %% Initialize IK algorithm
  q0 = getInitialJointAnglesForDesiredConfig(taskSelection, EEselection, configSelection);
  q = q0';
  if linkCount == 3
      q = [q; 0];
  end
  if linkCount == 4
      q = [q; 0; 0];
  end
 
  lambda = 0.001; % damping factor -> values below lambda are set to zero in matrix inversion
  % Initialize error -> only position because we don't have orientation data
  rotBodyY = 0;
  [~, ~, ~, ~, ~, r_H_04, r_H_05, r_H_0EE] = jointToPosJac(hipAttachmentOffset, linkCount, rotBodyY, q, quadruped, EEselection, hipParalleltoBody);
  
  if linkCount == 3 
      r_H_0finalJoint = r_H_04;
  end
  if linkCount == 4  
       r_H_0finalJoint = r_H_05;
  end

  %% Iterative inverse kinematics
    rotBodyY = -meanCyclicMotionHipEE.body.eulerAngles(1,2); % rotation of body about inertial y
    %drEE = r_H_0EE_des(1,:)' - r_H_0EE; 
    dr = r_H_0finalJoint_des' -  r_H_0finalJoint;
    k = 0.001;
    max_it = 20000;
    if linkCount == 4
        q(4,1) = -q(3,1);
    end         
  while (norm(dr)>tol && it < max_it)
     [J_P, ~, ~, ~, ~, r_H_04, r_H_05, r_H_0EE] = jointToPosJac(hipAttachmentOffset, linkCount, rotBodyY, q, quadruped, EEselection, hipParalleltoBody);
     dr = r_H_0finalJoint_des' -  r_H_0finalJoint;
     dq = pinv(J_P, lambda)*dr;
     q = q + k*dq;
     it = it+1; 
     if linkCount == 3 
        r_H_0finalJoint = r_H_04;
     end
     if linkCount == 4  
        r_H_0finalJoint = r_H_05;
        q(4,1) = -q(3,1); % foot parallel to thigh requires qAFE = -qKFE 
     end
  end  
%  fprintf('Inverse kinematics terminated after %d iterations.\n',it)
 
 % Now we have the joint angles to get the final joint in the desired
 % position. We just need to rotate this joint until the end effector is in
 % it's desired position.
 
 drEE = 1; % initialize error
 it = 0;
 updateStepSize = 0.001;
 max_it = 2*pi/updateStepSize;
 tol = 0.002;
 while (norm(drEE)>tol && it < max_it)
    [~, ~, ~, ~, ~, ~, ~, r_H_0EE] = jointToPosJac(hipAttachmentOffset, linkCount, rotBodyY, q, quadruped, EEselection, hipParalleltoBody);
     drEE = r_H_0EE_des' - r_H_0EE;
     % incrementally change final joint angle until error within
     % tolerance
     if linkCount == 3 
        q(4,1) = q(4,1) - 0.001;
     end
     if linkCount == 4 
        q(5,1) = q(5,1) - 0.001;
     end
     it = it + 1;
 end
 qLiftoff = q;
end