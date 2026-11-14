function OUTPUT = Aerodynamic(INPUT)

Control = INPUT(1:4); % (da, de, dr, Vin)
Rate = INPUT(5:7); p = Rate(1); q = Rate(2); r = Rate(3);
Va = INPUT(8); % воздушная скорость
a = INPUT(9); % угол атаки
b = INPUT(10); % угол скольжения
rho = INPUT(11);

% Подгрузим файл аэродинамики
A = evalin("base", 'A');

% Аэродинамические коэффициенты сил и моментов
CL = A.CL0 + A.CLa*a + A.CLde*Control(2) + A.CLq*q*A.c/(2*Va);
CD = A.CD0 + A.CDa*a + A.CDde*abs(Control(2)) + A.CDq*q*A.c/(2*Va);
CY = A.CY0 + A.CYb*b + A.CYda*Control(1) + A.CYdr*Control(3) + A.CYp*p*A.b/(2*Va) + ...
    + A.CYr*r*A.b/(2*Va);

Cl = A.Cl0 + A.Clb*b + A.Clda*Control(1) + A.Cldr*Control(3) + A.Clp*p*A.b/(2*Va) + ...
    + A.Clr*r*A.b/(2*Va);
Cm = A.Cm0 + A.Cma*a + A.Cmde*Control(2) + A.Cmq*q*A.c/(2*Va);
Cn = A.Cn0 + A.Cnb*b + A.Cnda*Control(1) + A.Cndr*Control(3) + A.Cnp*p*A.b/(2*Va) + ...
    + A.Cnr*r*A.b/(2*Va);

% вектор сил и моментв в ветровой СК
fw = [-CD; CY; -CL] * A.S * (rho*Va^2)/2;
Mw = [Cl*A.b; Cm*A.c; Cn*A.b] * A.S * (rho*Va^2)/2;

% Перевод из ветровой в ССК
WindAxes = [Va;a;b];
Rbw = WindAxes2Rbw(WindAxes);
faero = Rbw*fw;
%Maero = Rbw*Mw;

OUTPUT = [faero; Mw];
end