function[structure] = mindPalace(cellArr) 
    [row,col] = size(cellArr);
    structure = [];
    cellArrCell = [];
    cellArrLogical = [];
    cellArrChar = [];
    cellArrDouble = [];
    for ind=1:(row*col)
        fieldClass = class(cellArr{ind});
        switch fieldClass
            case 'cell'
                cellArrCell = [cellArrCell {cellArr{ind}}];
                structure.cell = (cellArrCell);
            case 'logical'
                cellArrLogical = [cellArrLogical {cellArr{ind}}];
                structure.logical = (cellArrLogical);
            case 'char'
                cellArrChar = [cellArrChar {cellArr{ind}}];
                structure.char = (cellArrChar);
            case 'double'
                cellArrDouble = [cellArrDouble {cellArr{ind}}];
                structure.double = (cellArrDouble);
        end
    end
end