function [pieces, wasted] = candy(bagSize, numKids)
    pieces = floor(bagSize./numKids); %this line rounds down the average number of candy pieces that each kid recieves since they cannot recieve a decimal amount of candy
    wasted = mod(bagSize, numKids); %this line produces a remainder after each kid recieves their share of candy, and this remainder is the waste
end

    