function[guilt] = zoinks(suspect,clue,scrap)
    scrapTranspose = scrap';
    spacePlaces = find(scrapTranspose == ' ');
    scrapTranspose(spacePlaces)=[]; %lines 3 and 4 find the spaces in the scrap message and delete them 
    [row,col] = size(scrapTranspose);
    noSpaces = transpose(reshape(scrapTranspose,(row.*col)./4,4)); %lines 5 and 6 rebuild the scrap array so that there are no spaces; the transpositions are necessary to build the matrix back in the same way it was given
    averageScrap = mean(noSpaces); %this line averages the ASCII values of each column of the new scrap array 
    log1 = key(char(averageScrap)); %this line uses the 'key' function and outputs a logical true or false
    
    shift = mod(length(suspect),10); %this line finds the necessary shift for the 'clueCipher' function with respect to the suspect's name
    clueValue = clueCipher(clue,shift); %this line employs the 'clueCipher' function to determine the usefulness of the clue
    log2 = clueValue>5;
    
    log3=log1+log2==2; %this line states that if both the 'key' function yields a logical true, and the clueCipher function yields a value greater than 5, then the suspect is guilty 
    guilt=log3;
    
end

