function[victor] = myFootball(teams,seasonRecord,seasonHardness)
    
    [seasonHardness1,rest1] = strtok(seasonHardness,';');
    rest1(1) = [];
    seasonHardness2 = rest1;

    switch seasonHardness1
        case {'Easy'}
            seasonHardness1 = 50;
        case {'Medium'}
            seasonHardness1 = 75;
        case {'Hard'}
            seasonHardness1 = 100; 
    end
    
    switch seasonHardness2
        case {'Easy'}
            seasonHardness2 = 50;
        case {'Medium'}
            seasonHardness2 = 75;
        case {'Hard'}
            seasonHardness2 = 100; 
    end
    
    [team1,rest2] = strtok(teams,';');
    if seasonRecord(2) > 0
        winRatio1 = seasonRecord(1)/seasonRecord(2); 
    end
    if seasonRecord(2) == 0
        winRatio1 = seasonRecord(1);
    end
    team1Rating = winRatio1.*seasonHardness1; 
    
    rest2(1) = [];
    team2 = rest2; 
    if seasonRecord(4) > 0
        winRatio2 = seasonRecord(3)/seasonRecord(4); 
    end
    if seasonRecord(4) == 0
        winRatio2 = seasonRecord(3);
    end
    team2Rating = winRatio2.*seasonHardness2;
    
    if team1Rating>team2Rating
        victor = sprintf('%s win the Superbowl!',team1);
    end
    if team1Rating<team2Rating
        victor = sprintf('%s win the Superbowl!',team2);
    end
    if team1Rating==team2Rating
        victor = sprintf('Tie Ballgame!');
    end
end

    