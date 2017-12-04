function[slope] = linFit(fileName,lowerBound,upperBound)
    xyArr = dlmread(fileName);
    xCol = xyArr(1:end,1);
    yCol = xyArr(1:end,2);
    plot(xCol,yCol,'ob')
    origDomain = linspace(min(xCol),max(xCol));
    hold on
    placesX = find(xCol<=upperBound & xCol>=lowerBound);
    boundedX = xCol(placesX);
    boundedY = yCol(placesX);
    lineRange = polyval(polyfit(boundedX,boundedY,1),origDomain);
    plot(origDomain,lineRange,'r')
    diffVec = diff(lineRange)./diff(origDomain);
    slope = round(diffVec(1)*1000)./1000;
end

    