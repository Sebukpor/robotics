% Define sinusoidal trajectory parameters
num_samples = 5000; % Number of samples

% Define joint limits
joint_limits = [-170*pi/180, 170*pi/180; 25*pi/180, 175*pi/180; -70*pi/180, 180*pi/180; -300*pi/180, 300*pi/180; -130*pi/180, 130*pi/180; -360*pi/180, 360*pi/180];

% Generate random joint angle trajectories within the joint limits
joint_angles = zeros(num_samples, 6);
for i = 1:6
    joint_angles(:, i) = (joint_limits(i, 2) - joint_limits(i, 1)) * rand(num_samples, 1) + joint_limits(i, 1);
end

% Calculate end-effector poses using forward kinematics
poses = zeros(num_samples, 6);
for i = 1:num_samples
    poses(i, :) = forward_kinematics(joint_angles(i, 1), joint_angles(i, 2), joint_angles(i, 3), joint_angles(i, 4), joint_angles(i, 5), joint_angles(i, 6));
end

% Extract x, y, and z coordinates from poses
x = poses(:, 1);
y = poses(:, 2);
z = poses(:, 3);

% Extract rotation elements (excluding x, y, z)
rotation_elements = poses(:, 4:end);

% Concatenate joint angles, position, and rotation elements
dataset = [joint_angles, x, y, z, rotation_elements];

% Save dataset as a CSV file
csvwrite('random2.csv', dataset);

% Plot the end-effector positions in 3D space
figure;
scatter3(x, y, z, 10, 'filled');
xlabel('X');
ylabel('Y');
zlabel('Z');
title('End-Effector Positions');
grid on;
