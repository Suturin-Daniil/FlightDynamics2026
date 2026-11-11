function OUTPUT = WGS84(LLA)
% геодезические широта и долгота
lat = LLA(1); lon = LLA(2);
h = LLA(3);

% Константы модели эллипсоида WGS84
a = 6378137.0; % Большая полуось эллипсоида

FlatteningFactor = 298.257223563; % Параметр сжатия эллипсоида
% равный обратной величине к полярному сжатию f = (a - b) / a

b = (1 - 1/FlatteningFactor)*a; % малая полуось эллипса

e1 = sqrt((a*a - b*b) / (a*a)); % Первый эксцентриситет

e2 = sqrt((a*a - b*b) / (b*b)); % Второй эксцентриситет

GravityEquator = 9.7803253359; % Ускорение свободного падения на экваторе эллипсоида

GravityPole = 9.8321849379; % Ускоренре свободного падения на полюсе эллипсоида

GravityConstant =  1.931852652458e-3; % WGS84_b*WGS84_GravityPole / (WGS84_GravityEquator * WGS84_a) - 1;

w = 7.292115e-5; % Среднее значение угловой скорости вращения Земли

GM = 3.986004418e14; % Геоцентрическая гравитационная константа - произведение массы Земли на гравитационную постоянную

m = (w * a)^2 * b / GM; 

% Вычислим нормальные сечения эллипсоида
Rm = a*(1-e1^2) / (1 - e1^2*sin(lat)*sin(lat))^(3/2);
Rn = a / (sqrt(1 - e1^2*sin(lat)*sin(lat)));

% Вычислим ускорение свободного падения согласно WGS84
k = b*GravityPole/(a*GravityEquator) - 1;
g = GravityEquator*(1 + k*sin(lat)*sin(lat))/sqrt(1-e1^2*sin(lat)*sin(lat));
g_h = g*(1 - 2*h/a*(1+FlatteningFactor+m-2*FlatteningFactor*sin(lat)*sin(lat)) + 3*h^2/a^2);

OUTPUT = [g_h; Rm; Rn];
end