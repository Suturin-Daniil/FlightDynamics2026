function OUTPUT = Aerodynamic(INPUT)

Control = INPUT(1:4);
Euler = INPUT(5:7);
Rate = INPUT(8:10);
Va = INPUT(11); % воздушная скорость
a = INPUT(12); % угол атаки
b = INPUT(13); % угол скольжения

% Подгрузим файл аэродинамики
A = evalin("base", 'A');

% Аэродинамические силы и моменты в ветровой СК




% Перевод из ветровой в ССК


OUTPUT = [];
end