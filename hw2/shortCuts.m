function [step,time] = shortCuts(length1,length2)
    shortstep = 0.4.*sqrt((length1).^2 + (length2).^2); %this line calculates the distance of the shortcut in feet and converts it to number of steps
    step = ceil(0.4.*(length1 + length2) - shortstep); %this line calculates the steps saved by taking the shortcut
    longtime = (((length1 + length2)./5280)./3.1).*3600; %this line calculates the time needed to walk the two long lengths 
    shorttime = (((sqrt((length1).^2 + (length2).^2))./5280)./3.1).*3600; %this line calculates the time needed to walk the shortcut
    time = round((longtime - shorttime).*100)./100; %this line calculates the time saved by taking the shortcut
end



