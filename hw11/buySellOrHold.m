function[decision] = buySellOrHold(xlsFile)
    [num,txt,raw] = xlsread(xlsFile);
    closeCol = find(strcmp(txt,'Close'));
    pricesVec = transpose(num(:,closeCol));
    daysVec1 = 1:length(pricesVec);
    daysVec2 = 2:length(pricesVec);
    avgVec = movingAverage(pricesVec, 22);
    avgVec65 = avgVec(length(avgVec)-64:end);
    days65 = daysVec1(length(daysVec1)-64:end);
    bestFit65 = polyval(polyfit(days65,avgVec65,1),days65);
    avgVec130 = avgVec(length(avgVec)-129:end);
    days130 = daysVec1(length(daysVec1)-129:end);
    bestFit130 = polyval(polyfit(days130,avgVec130,1),days130);
    avgVecDiff = diff(avgVec)./diff(daysVec1);
    avgVecDiffAvg = movingAverage(avgVecDiff, 22);
    bestFitRange = polyval(polyfit(daysVec2,avgVecDiffAvg,1),daysVec2);
    
    subplot(2,1,1)
    plot(daysVec1,pricesVec,'b')
    hold on
    plot(daysVec1,avgVec,'r')
    plot(days65,bestFit65,'k')
    plot(days130,bestFit130,'k')
    
    subplot(2,1,2)
    hold on
    plot(daysVec2,avgVecDiff,'c')
    plot(daysVec2,avgVecDiffAvg,'m')
    plot(daysVec2,bestFitRange,'k')
    
    diff65 = diff(bestFit65)./diff(days65);
    diff130 = diff(bestFit130)./diff(days130);
    diffBestFit = diff(bestFitRange)./diff(daysVec2);
    
    decision = processSlopes(diff65(1),diff130(1),diffBestFit(1));  
end

    