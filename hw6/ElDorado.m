function[decoded] = ElDorado(start,dir,space,letter)
    decoded = letter(start(1),start(2)); %this line gives a starting point for the array of scrambled letters
    while space(start(1),start(2)) > 0  %this line creates a loop that ends when the indexing of the space array yields 0
     row = start(1);
     col = start(2);  
        switch (dir(row,col));
            case {'N'}
                start = [row-space(row,col) col]; %these lines say to move up a determined number of rows if North is read
                
            case {'S'}
                start = [row+space(row,col) col]; %these lines say to move down a determined number of rows if South is read
                
            case {'E'}
                start = [row col+space(row,col)]; %these lines say to move to the right a determined number of columns if East is read
                 
            case {'W'}
                start = [row col-space(row,col)]; %these lines say to move to the left a determined number of columns if West is read
                
        end
        decoded = [decoded letter(start(1),start(2))]; %this line concatenates the the previous decoded letters with the new ones
    end
        
end

                
                
                
                
            