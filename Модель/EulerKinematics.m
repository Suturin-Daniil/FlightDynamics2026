function phi_dot = EulerKinematics(INPUT)
Euler = INPUT(1:3);

phi = Euler(1); theta = Euler(2); psi = Euler(3);

w = INPUT(4:6);

H = [[1 tan(theta)*sin(phi) tan(theta)*cos(phi)]; 
    [0 cos(phi) -sin(phi)];
    [0 sin(phi)/cos(theta) cos(phi)/cos(theta)]];

phi_dot = H*w;
end

