
function worldClock( timeStr, citiesCellArr )        
border = linspace(0, 2*pi, 100);
[hourHand, minuteHand] = strtok(timeStr, ':');
switch str2num(hourHand)
    case 1
        hourTipX = .6 * cos(pi/3);
        hourTipY = .6 * sin(pi/3);
    case 2
        hourTipX = .6 * cos(pi/6);
        hourTipY = .6 * sin(pi/6);
    case 3
        hourTipX = .6 * cos(0);
        hourTipY = .6 * sin(0);
    case 4
        hourTipX = .6 * cos(11*pi/6);
        hourTipY = .6 * sin(11*pi/6);
    case 5
        hourTipX = .6 * cos(5*pi/3);
        hourTipY = .6 * sin(5*pi/3);
    case 6
        hourTipX = .6 * cos(3*pi/2);
        hourTipY = .6 * sin(3*pi/2);
    case 7
        hourTipX = .6 * cos(4*pi/3);
        hourTipY = .6 * sin(4*pi/3);
    case 8
        hourTipX = .6 * cos(7*pi/6);
        hourTipY = .6 * sin(7*pi/6);
    case 9
        hourTipX = .6 * cos(pi);
        hourTipY = .6 * sin(pi);
    case 10
        hourTipX = .6 * cos(5*pi/6);
        hourTipY = .6 * sin(5*pi/6);
    case 11
        hourTipX = .6 * cos(2*pi/3);
        hourTipY = .6 * sin(2*pi/3);
    case 12
        hourTipX = .6 * cos(pi/2);
        hourTipY = .6 * sin(pi/2);
end
minAngle = pi/2 - (str2num(minuteHand(2:end))/60*2*pi);
numCities = length(citiesCellArr);
for ind = 1:numCities
    subplot(1,numCities,ind);
    hold on;
    plot(cos(border), sin(border), 'k', 0, 0, 'ko');
    hours = linspace(0, 2*pi, 13);
    for ind2 = hours
        plot([.9*cos(ind2), cos(ind2)], [.9*sin(ind2), sin(ind2)], 'k');    
    end
    shiftStr = citiesCellArr{ind}{2};
    [hourShift, ~] = strtok(shiftStr, ':');
    switch hourShift(1)
        case '+'
            shiftAng = -1*str2num(hourShift(2:end))/12*2*pi;
        case '-'
            shiftAng = str2num(hourShift(2:end))/12*2*pi;
        otherwise
            shiftAng = -1*str2num(hourShift(2:end))/12*2*pi;
    end
    hourTipNew = [cos(shiftAng), -sin(shiftAng);
                  sin(shiftAng), cos(shiftAng)] * [hourTipX; hourTipY];
    plot([0, hourTipNew(1)], [0, hourTipNew(2)], 'b');
    plot([0, .9*cos(minAngle)], [0, .9*sin(minAngle)], 'r');
    title(citiesCellArr{ind}{1});
    hold off;
    axis square;
    axis off;
end
whitebg([0.5, 0.5, 0.5]);
end

