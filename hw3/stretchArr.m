function[arrFinal] = stretchArr(arrOrig,factor)
    [rows,cols] = size(arrOrig)
    colVec = round(linspace(1,cols,factor.*cols)) %this line stretches the columns of the vector 
    rowVec = round(linspace(1,rows,factor.*rows)) %this line stretches the rows of the vector 
    arrFinal = arrOrig(rowVec,colVec);   
end

   
