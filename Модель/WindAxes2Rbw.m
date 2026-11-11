function Rbw = WindAxes2Rbw(WindAxes)
% Функция возращает матрицу перехода из 
% ветровой СК в ССК
a = WindAxes(2); b = WindAxes(3);

% Поворот на угол атаки против OY (минус под единицей)
R1 = [[cos(a), 0, sin(a)];
    [0, 1, 0];
    [-sin(a), 0, cos(a)]];

% Поворот на угол скольжения вокруг OZ
R2 = [[cos(b), sin(b), 0];
    [-sin(b), cos(b), 0];
    [0, 0, 1]];

Rbw = (R2*R1)';
end