function labReport(structArr, graphTitle)
    xCellArr = [];
    yCellArr = [];
    fieldNameCellArr = fieldnames(structArr);
    places1 = find(fieldNameCellArr{1}=='_');
    xLabel = fieldNameCellArr{1};
    xLabel(places1) = ' ';
    places2 = find(fieldNameCellArr{2}=='_');
    yLabel = fieldNameCellArr{2};
    yLabel(places2) = ' ';
    for ind = 1:length(structArr) 
        currentStruct1 = structArr(ind).(fieldNameCellArr{1});
        currentStruct2 = structArr(ind).(fieldNameCellArr{2});
        xCellArr = [xCellArr; {currentStruct1}];
        yCellArr = [yCellArr; {currentStruct2}];
    end
    minX = min(xCellArr{1,:});
    maxX = max(xCellArr{1,:});
    maxY = max(max(cell2mat(yCellArr)));
    minY = min(min(cell2mat(yCellArr)));
    
    for ind = 1:length(structArr)
        subplot(2,ceil(length(structArr)./2),ind)
        plot(xCellArr{ind},yCellArr{ind},'b-')
        xlabel(xLabel)
        ylabel(yLabel)
        title([graphTitle sprintf(': Trial %d',ind)])
        axis([minX maxX minY maxY])
    end
end

    
        
        
    
    