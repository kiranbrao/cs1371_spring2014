function [goodred, goodgreen] = probability(totred, totgreen, percentredrot, percentgreenrot)
    totapples = totred + totgreen; %this line expresses the total number of apples in the bag
    goodred = (100 - percentredrot).*(totred./totapples); %this line multiplies the proportion of red apples in the bag by the percent of non-rotten red apples
    goodgreen = (100 - percentgreenrot).*(totgreen./totapples); %this line multiplies the proporiton of green apples in the bag by the percent of non-rotten green apples
end

    
    