function compareExtrap(xVals,yVals,D)
    plot(xVals,yVals,'*b')
    hold on
    minD = min(xVals) - D;
    maxD = max(xVals) + D;
    domainD = linspace(minD,maxD);
    range1 = interp1(xVals,yVals,domainD,[],'extrap');
    range2 = spline(xVals,yVals,domainD);
    range3 = polyval(polyfit(xVals,yVals,3),domainD);
    plot(domainD,range1,'g')
    plot(domainD,range2,'r')
    plot(domainD,range3,'k')
end
