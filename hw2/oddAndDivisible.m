function [logical] = oddAndDivisible(a,b,c)
   logical = mod(a,2) > 0 & mod (a,c) == 0 & mod(a,b) == 0;
end

  