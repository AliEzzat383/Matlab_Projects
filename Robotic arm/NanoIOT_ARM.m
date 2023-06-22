clear all;
clc;

a = arduino('COM5', 'Nano33IoT', 'libraries', 'Servo');

basePin = 'D12';
shoulderPin = 'D11';
elbowPin = 'D10';

% Initialize servo objects
baseServo = servo(a, basePin);
shoulderServo = servo(a, shoulderPin);
elbowServo = servo(a, elbowPin);

l1 = 40.5;
l2 = 12.5;
l3 = 14;

% Set initial positions of servo motors
writePosition(baseServo, 0.5); % theta1
writePosition(shoulderServo, 0.5); % theta2
writePosition(elbowServo, 0); % theta3
Home_base = readPosition(baseServo);
Home_shoulder = readPosition(shoulderServo);
Home_elbow = readPosition(elbowServo);

% Set the initial position and orientation of the robotic arm
x = 0; % Constant x value
y = -2.5; % Initial y value
z = -2.5; % Initial z value

side = 5;

while(1)
    % Move along the y-axis (draw a line)
    for t = 0:0.1:1
        y_interp = y + side * t;
        z_interp = z;

        % Forward kinematics to calculate joint angles
        r = sqrt(x^2 + y_interp^2);
        s = z_interp - l1;
        w = sqrt(s^2 + r^2);
        D = (w^2 - l2^2 - l3^2) / (2 * l2 * l3);
        theta3 = atan2d(real(sqrt(1 - D^2)), D);
        theta1 = atan2d(y_interp, x);
        gamma = atan2d(z_interp - l1, r);
        alpha = atan2d(l3 * sind(theta3), l2 + l3 * cosd(theta3));
        theta2 = gamma - alpha;

        theta1 = (theta1 + 180) / 360;
        theta2 = (theta2 + 180) / 360;
        theta3 = (theta3 + 180) / 360;

        % Set servo positions
        writePosition(baseServo, theta1);
        writePosition(shoulderServo, theta2);
        writePosition(elbowServo, theta3);
        pause(0.5);
    end

    % Move along the z-axis (draw a line)
    for t = 0:0.1:1
        y_interp = y + side;
        z_interp = z + side * t;

        % Forward kinematics to calculate joint angles
        r = sqrt(x^2 + y_interp^2);
        s = z_interp - l1;
        w = sqrt(s^2 + r^2);
        D = (w^2 - l2^2 - l3^2) / (2 * l2 * l3);
        theta3 = atan2d(real(sqrt(1 - D^2)), D);
        theta1 = atan2d(y_interp, x);
        gamma = atan2d(z_interp - l1, r);
        alpha = atan2d(l3 * sind(theta3), l2 + l3 * cosd(theta3));
        theta2 = gamma - alpha;

        theta1 = (theta1 + 180) / 360;
        theta2 = (theta2 + 180) / 360;
        theta3 = (theta3 + 180) / 360;

        % Set servo positions
        writePosition(baseServo, theta1);
        writePosition(shoulderServo, theta2);
        writePosition(elbowServo, theta3);
        pause(0.5);
    end

    % Move along the y-axis (draw a line)
    for t = 1:-0.1:0
        y_interp = y + side * t;
        z_interp = z + side;

        % Forward kinematics to calculate joint angles
        r = sqrt(x^2 + y_interp^2);
        s = z_interp - l1;
        w = sqrt(s^2 + r^2);
        D = (w^2 - l2^2 - l3^2) / (2 * l2 * l3);
        theta3 = atan2d(real(sqrt(1 - D^2)), D);
        theta1 = atan2d(y_interp, x);
        gamma = atan2d(z_interp - l1, r);
        alpha = atan2d(l3 * sind(theta3), l2 + l3 * cosd(theta3));
        theta2 = gamma - alpha;

        theta1 = (theta1 + 180) / 360;
        theta2 = (theta2 + 180) / 360;
        theta3 = (theta3 + 180) / 360;

        % Set servo positions
        writePosition(baseServo, theta1);
        writePosition(shoulderServo, theta2);
        writePosition(elbowServo, theta3);
        pause(0.5);
    end

    % Move along the z-axis (draw a line)
    for t = 1:-0.1:0
        y_interp = y;
        z_interp = z + side * t;

        % Forward kinematics to calculate joint angles
        r = sqrt(x^2 + y_interp^2);
        s = z_interp - l1;
        w = sqrt(s^2 + r^2);
        D = (w^2 - l2^2 - l3^2) / (2 * l2 * l3);
        theta3 = atan2d(real(sqrt(1 - D^2)), D);
        theta1 = atan2d(y_interp, x);
        gamma = atan2d(z_interp - l1, r);
        alpha = atan2d(l3 * sind(theta3), l2 + l3 * cosd(theta3));
        theta2 = gamma - alpha;

        theta1 = (theta1 + 180) / 360;
        theta2 = (theta2 + 180) / 360;
        theta3 = (theta3 + 180) / 360;

        % Set servo positions
        writePosition(baseServo, theta1);
        writePosition(shoulderServo, theta2);
        writePosition(elbowServo, theta3);
        pause(0.5);
    end
end
