function[winningCountry,bestAthlete] = myOlympics(competitors)
    [row,col] = size(competitors);
    totalCount = [];
    totalCount2 = [];
    for ind = 1:(row*col)
        currentStructure = competitors(ind);
        currentCountry = currentStructure.Country;
        athletesAndMedals = currentStructure.Athletes;
        medalArr = cell2mat([{athletesAndMedals.Gold};{athletesAndMedals.Silver};{athletesAndMedals.Bronze}]);
        totalMedals = sum(sum(medalArr));
        currentCount = {currentCountry;totalMedals};
        totalCount = [totalCount currentCount];
        
        namesList = {athletesAndMedals.Name};
        medalsPerAthlete = sum(medalArr);   
        [highCount,places2] = sort(medalsPerAthlete);
        highAthlete = namesList{places2(end)};
        highMedal = highCount(end);
        currentCount2 = {currentCountry;highAthlete;highMedal};
        totalCount2 = [totalCount2 currentCount2];
    end
    
    medalVec = cell2mat(totalCount(2,1:end));
    [sortedMedals,places1] = sort(medalVec);
    winningCountry.Winning_Country = totalCount{1,places1(end)};
    winningCountry.Total_Medals = sortedMedals(end);
    
    [highestMedal,places3] = sort(cell2mat(totalCount2(3,1:end)));
    bestAthlete.Most_Decorated_Star = totalCount2{2,places3(end)};
    bestAthlete.Country = totalCount2{1,places3(end)};
    bestAthlete.Medals = highestMedal(end);
end
