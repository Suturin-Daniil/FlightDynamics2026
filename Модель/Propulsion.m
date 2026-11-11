function OUTPUT = Propulsion(INPUT)
Vin = INPUT(4); % напряжение на моторе

Va = INPUT(5); % воздушная скорость

alpha = INPUT(6); beta = INPUT(7);

% можно сделать поправку на аэродинамические углы
Rbw = WindAxes2Rbw([Va;alpha;beta]); % матрица перехода из ветровой СК в ССК

% модуль проекции воздушной скорости на перпендикуляр к диску винта
Va_body = Rbw*[Va; 0; 0];
Va_new = Va_body(1); % = Va*cos(beta)*cos(alpha)

rho = INPUT(8); % плотность

% Подгрузим данные мотора и винта
Mot = evalin("base", 'Mot');
Prop = evalin("base", 'Prop');

D = Prop.diameter;

% Вычисляем силу тяги винта и момент согласно модели
a = rho*D^5*Prop.CQ0 / (4*pi^2); b = rho*D^4*Prop.CQ1*Va/(2*pi) + Mot.Kq*Mot.Kv/Mot.R;
c = rho*D^3*Va^2*Prop.CQ2 + Mot.Kq*Mot.i0 - Mot.Kq*Vin/Mot.R;

Omega = (-b + sqrt(b^2-4*a*c))/(2*a); % Угловая скорость вращения винта
if Omega < 0
    Omega = 0;
end

J = 2*pi*Va/(Omega*D); % поступь винта. Можно Va_new использовать

Thrust = rho*D^4/(4*pi^2)*Omega^2*(Prop.CT0 + Prop.CT1*J + Prop.CT2*J^2);
Torque = rho*D^5/(4*pi^2)*Omega^2*(Prop.CQ0 + Prop.CQ1*J + Prop.CQ2*J^2);

% Вектора тяги и момента в ССК
th = [Thrust; 0; 0]; trq = [-Torque; 0; 0];
OUTPUT = [th; trq];
end