function Qbi = Euler2Qbi(Euler)

phi = Euler(1);
theta = Euler(2);
psi = Euler(3);

% Сделаем кватернион ориентации путем 3-х последоваельных поворотов
% запишем кватернионы в тригономерическом представлении
Q1 = [cos(psi/2), 0, 0, sin(psi/2)];

Q2 = [cos(theta/2), 0, sin(theta/2), 0];

Q3 = [cos(phi/2), sin(phi/2), 0, 0];

%quatmultiply - стандартная функция перемножения кватернионов
% принимает вектор строку, на выходе тоже векор строка 1х4
% используем reshape, чтобы получить вектор столюец 4х1
Qbi = reshape(quatmultiply(quatmultiply(Q1, Q2), Q3), 4, 1);
end