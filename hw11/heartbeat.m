function[area,condition] = heartbeat(xVals,yVals,pressureDomain)
    area = trapz(abs(xVals),abs(yVals));
    if area < pressureDomain(1)
        condition = 'Low Blood Pressure';
    elseif area > pressureDomain(2)
        condition = 'High Blood Pressure';
    else 
        condition = 'Normal Blood Pressure';
    end
end
