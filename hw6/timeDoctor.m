function[outDate] = timeDoctor(inDate,numDays)
   [token,rest] = strtok(inDate, ' ');
    switch token
        case {'January'}
            monthVal = 0;
        case {'February'}
            monthVal = 31;
        case {'March'}
            monthVal = 59;   
        case {'April'}
            monthVal = 90;
        case {'May'}
            monthVal = 120;
        case {'June'}
            monthVal = 151;
        case {'July'}
            monthVal = 181;
        case {'August'}
            monthVal = 212;
        case {'September'}
            monthVal = 243;
        case {'October'}
            monthVal = 273;
        case {'November'}
            monthVal = 304;
        case {'December'}
            monthVal = 334;
    end
    %the above lines assign a number vallue to each month of the year
    rest(1) = [];
    [dayVal,rest2] = strtok(rest,',');
    
    roughDateValOut = monthVal + str2num(dayVal) + numDays; %this line gives a numerical value to the new day after going through the time machine
    
    if mod(roughDateValOut,365) == 0
        yearsPassed = floor(numDays./365);
        DateValOut = mod(roughDateValOut,365);
        outDate = DateValOut;
    end
    %the above lines account for the fact that going back one day from
    %January 1st will go back an entire year
    if mod(roughDateValOut,365) ~= 0
        yearsPassed = floor(roughDateValOut./365);
        DateValOut = mod(roughDateValOut,365);
        outDate = DateValOut;
    end
    %the above lines determine the number of years passed and give a
    %numerical value between 1 and 365 for the new date
    if DateValOut == 0
        newMonth = 'December'; 
        newDate = 31;    
    end
    if DateValOut >= 1 && DateValOut <=31
        newMonth = 'January';
        newDate = DateValOut;
    end
    if DateValOut >= 32 && DateValOut <=59
        newMonth = 'February';
        newDate = DateValOut - 31;
    end
    if DateValOut >= 60 && DateValOut <=90
        newMonth = 'March';
        newDate = DateValOut - 59;
    end
    if DateValOut >= 91 && DateValOut <=120
        newMonth = 'April';
        newDate = DateValOut - 90;
    end
    if DateValOut >= 121 && DateValOut <=151
        newMonth = 'May';
        newDate = DateValOut - 120;
    end
    if DateValOut >= 152 && DateValOut <=181
        newMonth = 'June';
        newDate = DateValOut -151;
    end
    if DateValOut >= 182 && DateValOut <=212
        newMonth = 'July';
        newDate = DateValOut - 181;
    end
    if DateValOut >= 213 && DateValOut <=243
        newMonth = 'August';
        newDate = DateValOut - 212;
    end
    if DateValOut >= 244 && DateValOut <=273
        newMonth = 'September';
        newDate = DateValOut - 243;
    end
    if DateValOut >= 274 && DateValOut <=304
        newMonth = 'October';
        newDate = DateValOut - 273;
    end
    if DateValOut >= 305 && DateValOut <=334
        newMonth = 'November';
        newDate = DateValOut - 304;
    end
    if DateValOut >= 335 && DateValOut <=365
        newMonth = 'December';
        newDate = DateValOut - 334;
    end
    %the above lines determine which month and date the new date is
    rest2(1:2) = [];
    newYear = str2num(rest2) + yearsPassed; %this line calculates the new year
    
    outDate = [newMonth ' ' num2str(newDate) ', ' num2str(newYear)];
end

    
    