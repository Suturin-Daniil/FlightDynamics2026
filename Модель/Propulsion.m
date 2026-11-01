function OUTPUT = Propulsion(Control)
Vin = Control(4);

% Подгрузим данные мотора и винта
Mot = evalin("base", 'Mot');
Prop = evalin("base", 'Prop');

% Вычисляем силу тяги винта и момент согласно модели


OUTPUT = [];
end