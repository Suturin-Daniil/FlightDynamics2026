function Rbi = Euler2Rbi(Euler)

phi = Euler(1);
theta = Euler(2);
psi = Euler(3);

% Составим матрицу перехода из 3-х последовательных поворотов
% Первый поворот на угол рыскания вокруг OZ
R1 = [[cos(psi), sin(psi), 0];
    [-sin(psi), cos(psi), 0];
    [0, 0, 1]];

% Поворот на угол тангажа вокруг OY
R2 = [[cos(theta), 0, -sin(theta)];
    [0, 1, 0];
    [sin(theta), 0, cos(theta)]];

% Поворот вокргу OX на угол тангажа
R3 = [[1, 0, 0];
    [0, cos(phi), sin(phi)];
    [0, -sin(phi), cos(phi)]];

Rbi = R3*R2*R1;

end

