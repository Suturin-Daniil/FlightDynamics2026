function Q_dot = QuaternionKinematics(INPUT)

% Кинематическое уравнение через кватернион
% dQ/dt = 1/2 * Q * w

w = INPUT(1:3);
Qbi = reshape(INPUT(4:7), 4, 1);

A = [[0 -w(1) -w(2) -w(3)];
    [w(1) 0 w(3) -w(2)];
    [w(2) -w(3) 0 -w(1)];
    [w(3) w(2) -w(1) 0]];

Q_dot = 0.5 * (A*Qbi);

end