function[newString] = switchCase(original,conversion)
lowerOriginal = lower(original);    
    switch conversion 
        case {'Title Case'}
            capPlaces = find(lowerOriginal==' ')+1;
            lowerOriginal(capPlaces) = lowerOriginal(capPlaces) - 'a' + 'A';
            if isletter(lowerOriginal(1)) == 1
                lowerOriginal(1) = lowerOriginal(1) - 'a' + 'A';
            else 
                lowerOriginal(1) = lowerOriginal(1);
            end
            newString = lowerOriginal; 
        case {'Camel Case'}
            capPlaces = find(lowerOriginal==' ')+1;
            lowerOriginal(capPlaces) = lowerOriginal(capPlaces) - 'a' + 'A';
            lowerOriginal(find(lowerOriginal==' '))=[];
            newString = lowerOriginal;
        case {'Da Vinci'}
            newString = original(end:-1:1);
        case {'1337'}
            if length(find(original=='l'|original=='L')) > 0 
                original(find(original=='l'|original=='L')) = '1';
            end
            if length(find(original=='z'|original=='Z')) > 0 
                original(find(original=='z'|original=='Z')) = '2';
            end
            if length(find(original=='e'|original=='E')) > 0 
                original(find(original=='e'|original=='E')) = '3';
            end
            if length(find(original=='a'|original=='A')) > 0 
                original(find(original=='a'|original=='A')) = '4';
            end
            if length(find(original=='s'|original=='S')) > 0 
                original(find(original=='s'|original=='S')) = '5';
            end
            if length(find(original=='g'|original=='G')) > 0 
                original(find(original=='g'|original=='G')) = '6';
            end
            if length(find(original=='t'|original=='T')) > 0 
                original(find(original=='t'|original=='T')) = '7';
            end
            if length(find(original=='b'|original=='B')) > 0 
                original(find(original=='b'|original=='B')) = '8';
            end
            if length(find(original=='j'|original=='J')) > 0 
                original(find(original=='j'|original=='J')) = '9';
            end
            if length(find(original=='o'|original=='O')) > 0 
                original(find(original=='o'|original=='O')) = '0';
            end
            newString = original;
                
    end
end
