function[coded] = caesar(orig,scale)
    [placeLowercase] = find(double(orig)>=97&double(orig)<=122); 
    codedLowercase1 = char(orig(placeLowercase) + mod(scale,26)); %lines 2 and 3 find all lowercase letters in the message and shift them by the given scale
    [placeLowersymbols] = find(double(codedLowercase1)>122);
    lowerSymbolsFixed = char(double(codedLowercase1(placeLowersymbols)) - 26); 
    codedLowercase1(placeLowersymbols) = lowerSymbolsFixed; %lines 4, 5, and 6 allow the letters to cycle through when they go beyond 'z'
    orig(placeLowercase) = codedLowercase1;
    
    [placeUppercase] = find(double(orig)>=65&double(orig)<=90);
    codedUppercase1 = char(orig(placeUppercase) + mod(scale,26)); %lines 9 and 10 find all uppercase letters in the message and shift them by the given scale
    [placeUppersymbols] = find(double(codedUppercase1)>90);
    upperSymbolsFixed = char(double(codedUppercase1(placeUppersymbols)) - 26);
    codedUppercase1(placeUppersymbols) = upperSymbolsFixed; %lines 11, 12, and 13 allow the letters to cycle through when they go beyond 'Z'
    orig(placeUppercase) = codedUppercase1;
    coded = orig;
    
end

    
    
    