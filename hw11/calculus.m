function[diffEq, intEq] = calculus(origEq)
    origCoeff = getCoefficients(origEq);
    places1 = (length(origCoeff)*ones(1,length(origCoeff))) - (1:length(origCoeff));
    diffCoeff = origCoeff.*places1;
    diffCoeff(end) = [];
    diffEq = getEquation(diffCoeff);
    
    places2 = length(origCoeff):-1:1;
    intCoeff = origCoeff./places2;
    intCoeff = [intCoeff 0];
    intEqNoC = getEquation(intCoeff);
    intEq = [intEqNoC '+C'];
end
