function OUTPUT = Aerodynamic(INPUT)

Control = INPUT(1:4); % (da, de, dr, Vin)
Rate = INPUT(5:7);
Va = INPUT(8); % воздушная скорость
a = INPUT(9); % угол атаки
b = INPUT(10); % угол скольжения
rho = INPUT(11);

% Подгрузим файл аэродинамики
A = evalin("base", 'A');

% Аэродинамические коэффициенты сил и моментов
CL = A.CL0 + A.CLa*a + A.CLde*Control(2) + A.CLq*Rate(2)*A.c/(2*Va);
CD = A.CD0 + A.CDa*a + A.CDde*abs(Control(2)) + A.CDq*Rate(2)*A.c/(2*Va);
CY = A.CY0 + A.CYb*b + A.CYda*Control(1) + A.CYdr*Control(3) + A.CYp*Rate(1)*A.b/(2*Va) + ...
    + A.CYr*Rate(3)*A.b/(2*Va);

Cl = A.Cl0 + A.Clb*b + A.Clda*Control(1) + A.Cldr*Control(3) + A.Clp*Rate(1)*A.b/(2*Va) + ...
    + A.Clr*Rate(3)*A.b/(2*Va);
Cm = A.Cm0 + A.Cma*a + A.Cmde*Control(2) + A.Cmq*Rate(2)*A.c/(2*Va);
Cn = A.Cn0 + A.Cnb*b + A.Cnda*Control(1) + A.Cndr*Control(3) + A.Cnp*Rate(1)*A.b/(2*Va) + ...
    + A.Cnr*Rate(3)*A.b/(2*Va);

% вектор сил и моментв в ветровой СК
fw = [-CD; CY; -CL] * A.S * (rho*Va^2)/2;
Mw = [Cl*A.b; Cm*A.c; Cn*A.b] * A.S * (rho*Va^2)/2;

% Перевод из ветровой в ССК
Rbw = WindAxes2Rbw([Va;a;b]);
faero = Rbw*fw;
Maero = Rbw*Mw;

OUTPUT = [faero; Maero];
end