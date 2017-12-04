function[closed] = snowDay(week)
    weekArr = [];
    for ind = 1:length(week)
        currentDay = week(ind).Day;
        currentForecast = week(ind).Forecast;
        currentHigh = week(ind).High;
        weekCell = [{currentDay};{currentForecast};{currentHigh}];
        weekArr = [weekArr weekCell];
    end
    snowCol = find(strcmp(weekArr(2,1:end),'Snow'));
    if isempty(snowCol) == 1
        closed = 'Campus will remain open.';
    else 
        highTempsBeforeSnow = cell2mat(weekArr(3,1:(snowCol-1)));
        log = willItStick(highTempsBeforeSnow);
        if log==false
            closed = 'Campus will remain open.';
        else
        tempsAfterSnow = cell2mat(weekArr(3,snowCol:end));
        aboveFreezing = find(tempsAfterSnow>32);
        aboveFreezingCol = aboveFreezing(1);
        daysOfSnow = aboveFreezingCol;
        [detailed, rate] = weatherMan(week(snowCol));
        predictedSnowfall = sum(detailed)*rate;
        
        report.Week = week;
        report.SnowDay = weekArr{1,snowCol};
        report.PredictedSnowfall = predictedSnowfall;
        report.PredictedDuration = daysOfSnow;
        
        closed = askBud(report);
        end
    end
end
    

        