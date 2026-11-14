function OUTPUT = Coordinates(INPUT)

Vned = INPUT(1:3);
Rm = INPUT(4);
Rn = INPUT(5);
lat = INPUT(6);
lon = INPUT(7);
alt = INPUT(8);

lat_dot = Vned(1)/(Rm+alt);
lon_dot = Vned(2)/((Rn + alt)*cos(lat));
alt_dot = -Vned(3);

OUTPUT = [lat_dot; lon_dot; alt_dot];

end
