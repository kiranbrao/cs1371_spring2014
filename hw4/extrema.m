function[vertex] = extrema(quadraticFunction)
    
    quadraticFunction((find(quadraticFunction == 'y'))) = [];
    quadraticFunction((find(quadraticFunction == '='))) = []; %lines 3 and 4 get rid of the 'y=' in the quadratic function
    [token1,rest1] = strtok(quadraticFunction,'x'); %this line separates the coefficient 'a' from the rest of the function
    a = str2num(token1);
    
    [token2,rest2] = strtok(rest1,'x'); %this line separates the coefficient 'b' from the rest of the function 
    token2((find(token2 == '^'))) = [];
    token2((find(token2) == '^')+1) = []; %lines 9 and 10 get rid of the squared sign ('^2') in the quadratic function
    b = str2num(token2);
    
    rest2((find(rest2 == 'x'))) = []; %this line removes the last 'x' from the quadratic equation in order to seperate the constant 'c'
    c=str2num(rest2);
    
    xcoord = -b./(2.*a);
    ycoord = (4.*a.*c-b^2)./(4.*a); %lines 16 and 17 manipulate the variables 'a', 'b', and 'c' with the given equations 
    vertex = [xcoord ycoord];
end
