function w_dot = RotationalDynamics(INPUT)
M = INPUT(1:3);
w = INPUT(4:6);

A = evalin("base", "A");

% тензор инерции
J = A.J;

w_dot = (J^-1) * (M - cross(w, (J*w)));

end