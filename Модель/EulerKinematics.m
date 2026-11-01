function phi_ = EulerKinematics(INPUT)
[phi, theta, psi] = INPUT(1:3);

[p, q, r] = INPUT(3:6);

H = [1 tan(theta)*sin(phi) tan(theta)*cos(phi); 
    0 cos(phi) -sin(phi);
    0 sin(phi)/cos(theta) cos(phi)/cos(theta)];

w = [p; q; r];

phi_ = H*w;
end

