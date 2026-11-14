function OUTPUT = WindAxes(INPUT)
    Qbi = reshape(INPUT(1:4), 4, 1);
    Vbody = reshape(INPUT(5:7),3,1);
    Wind = reshape(INPUT(8:10),3,1);
    
    Rbi = Qbi2Rbi(Qbi); % матрица перехода
    Wind_body = Rbi*Wind; % ветер в ССК
    % вычислим аэродинамические углы и воздушную скорость
    Va_body = Vbody - Wind_body;
    Va = sqrt(Va_body(1)^2+Va_body(2)^2+Va_body(3)^2);

    if (Va < 1e-6)
        Va = 1e-6;
    end
    if (Va_body(1) < 1e-6)
        Va_body(1) = 1e-6;
    end

    AOA = atan(Va_body(3)/Va_body(1)); % угол атаки
    AOS = asin(Va_body(2)/Va); % угол скольжения
    
    OUTPUT = [Va; AOA; AOS];
end