function pose = forward_kinematics(t1, t2, t3, t4, t5, t6)  

    % Calculate end-effector position (tx, ty, tz)
    tx = 0.32*cos(t1) + 1.28*cos(t1)*cos(t2) + 0.71113*sin(t5)*(sin(t1)*sin(t4) + cos(t1)*cos(t4)*cos(t2+t3)) + 0.71113*sin(t2+t3)*cos(t1)*cos(t5) + 0.2*cos(t1)*cos(t2+t3) + 1.5925*cos(t1)*sin(t2+t3);
    ty = 0.32*sin(t1) + 1.28*cos(t2)*sin(t1) - 0.71113*sin(t5)*(cos(t1)*sin(t4) - cos(t4)*sin(t1)*cos(t2+t3)) + 1.5925*sin(t1)*sin(t2+t3) + 0.71113*sin(t2+t3)*cos(t5)*sin(t1) + 0.2*sin(t1)*cos(t2+t3);
    tz = 0.2*sin(t2+t3) - 1.5925*cos(t2+t3) + 1.28*sin(t2) + 0.71113*sin(t2+t3)*cos(t4)*sin(t5) - 0.71113*cos(t2+t3)*cos(t5) + 0.78;
    
    %Elements of rotation matrix
    rxx = sin(t6)*(cos(t4)*sin(t1) - cos(t1)*cos(t2+t3)*sin(t4)) + cos(t6)*(cos(t5)*(sin(t1)*sin(t4) + cos(t1)*cos(t2+t3)*cos(t4)) - cos(t1)*sin(t2+t3)*sin(t5));

    rxy = -sin(t6)*(cos(t4)*cos(t1)+sin(t1)*cos(t2+t3)*sin(t4)) - cos(t6)*(cos(t5)*(cos(t1)*sin(t4) - sin(t1)*cos(t2+t3)*cos(t4)) + sin(t1)*sin(t2+t3)*sin(t5));

    rxz = cos(t6)*(cos(t2+t3)*sin(t5) + sin(t2+t3)*cos(t4)*cos(t5)) - sin(t2+t3)*sin(t4)*sin(t6);

    ryx = cos(t6)*(cos(t4)*sin(t1) - cos(t1)*cos(t2+t3)*sin(t4)) - sin(t6)*(cos(t5)*(sin(t1)*sin(t4) + cos(t1)*cos(t2+t3)*cos(t4)) - cos(t1)*sin(t2+t3)*sin(t5));

    ryy = sin(t6)*(cos(t5)*(cos(t1)*sin(t4) - cos(t2+t3)*cos(t4)*sin(t1)) + sin(t1)*sin(t5)*sin(t2+t3)) - cos(t6)*(cos(t1)*cos(t4) + cos(t2+t3)*sin(t1)*sin(t4));

    ryz = -sin(t6)*(cos(t2+t3)*sin(t5) + sin(t2+t3)*cos(t4)*cos(t5)) - sin(t2+t3)*cos(t6)*sin(t4);
    
    rzx = sin(t5)*(sin(t1)*sin(t4) + cos(t1)*cos(t2+t3)*cos(t4)) + cos(t1)*cos(t5)*sin(t2+t3);

    rzy = cos(t5)*sin(t1)*sin(t2+t3) - sin(t5)*(cos(t1)*sin(t4) - cos(t2+t3)*cos(t4)*sin(t1));

    rzz = cos(t4)*sin(t2+t3)*sin(t5) - cos(t2+t3)*cos(t5);

   pitch = atan2(-rxz,sqrt(1-rxz^2));

   yaw = atan2(ryz/cos(pitch),rzz/cos(pitch));

   roll = atan2(rxy/cos(pitch),rxx/cos(pitch));

    %Calculate Pose
    
%     pose = [tx, ty, tz, rxx, rxy, rxz, ryx, ryy, ryz, rzx, rzy, rzz]';  

    pose = [tx, ty, tz, roll, pitch, yaw]';

end