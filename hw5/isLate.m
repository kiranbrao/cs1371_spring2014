function[eta,trans,late] = isLate(currentTime,destination,targetArrival)
    
    [timeToGetReady, traffic] = getTimeEffects(currentTime);
      
    if timeToArrive(destination, traffic, 'Walking') <= timeToArrive(destination, traffic, 'Driving')
        trans = 'Walking';
        commuteTime = timeToArrive(destination, traffic, 'Walking');
    end
    if timeToArrive(destination, traffic, 'Walking') > timeToArrive(destination, traffic, 'Driving')
        trans = 'Driving';
        commuteTime = timeToArrive(destination, traffic, 'Driving');
    end
    
    passingMinutes = timeToGetReady + commuteTime;
                

    if isempty(find(currentTime=='p')) == 0 
        [token1,rest1] = strtok(currentTime, ':');
        militaryTime = [num2str((str2num(token1) + 12)) rest1];
    end
    
    if isempty(find(currentTime=='p')) > 0
       [token1,rest1] = strtok(currentTime, ':');
        militaryTime = [num2str((mod(str2num(token1),12))) rest1];
    end
    
    [militaryHour,rest2] = strtok(militaryTime,':');
    rest2(find(rest2 == ':')) = [];
    militaryMinutes = strtok(rest2,' ');
    currentMinutes = (str2num(militaryHour).*60) + str2num(militaryMinutes);
    
    minutesFinal = currentMinutes + passingMinutes;
    
    finalHourMilitary = floor(minutesFinal./60);
    finalMinuteMilitary = mod(minutesFinal,60);
    
    if finalHourMilitary > 12
        finalHour = num2str(mod(finalHourMilitary,12));
        if finalMinuteMilitary < 10
            finalMinute = ['0' num2str(finalMinuteMilitary)];
        end
        if finalMinuteMilitary > 10
            finalMinute = num2str(finalMinuteMilitary);
        end
        eta = [finalHour ':' finalMinute ' ' 'pm'];
    end
    
    if finalHourMilitary <12
        finalHour = num2str(finalHourMilitary);
        if finalMinuteMilitary < 10
            finalMinute = ['0' num2str(finalMinuteMilitary)];
        end
        if finalMinuteMilitary > 10
            finalMinute = num2str(finalMinuteMilitary);
        end
        eta = [finalHour ':' finalMinute ' ' 'am'];
    end
    
    if finalHourMilitary == 12
         finalHour = num2str(finalHourMilitary);
        if finalMinuteMilitary < 10
            finalMinute = ['0' num2str(finalMinuteMilitary)];
        end
        if finalMinuteMilitary > 10
            finalMinute = num2str(finalMinuteMilitary);
        end
        eta = [finalHour ':' finalMinute ' ' 'pm'];
    end
    
    late = compareTimes(targetArrival,eta);  
    
end

        
       