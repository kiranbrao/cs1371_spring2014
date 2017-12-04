function[averageRating,badStudents] = RateMyProf(input)
    [sortScores,position] = sort(input(2,1:end)); %this line sorts the scores from least to greatest
    topThree = sortScores(end-2:end); %this line chooses the top three scores
    averageRating = mean(topThree); %this line averages the top three scores
    
    pinPoint = input(:,position); 
    badStudents = pinPoint(1:2:5); %lines 6 and 7 find the students who gave low ratings
end
    