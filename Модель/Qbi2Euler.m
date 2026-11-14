function Euler = Qbi2Euler(Qbi)
Qbi = reshape(Qbi, 4, 1);
q0 = Qbi(1); q1 = Qbi(2); q2 = Qbi(3); q3 = Qbi(4);

roll = atan2(2*(q0*q1+q3*q2),(q0^2+q3^2-q1^2-q2^2));
pitch = asin(2*(q0*q2-q1*q3));
yaw = atan2(2*(q0*q3+q1*q2),(q0^2+q1^2-q2^2-q3^2));

Euler = [roll;pitch;yaw];

end