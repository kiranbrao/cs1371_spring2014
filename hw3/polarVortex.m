function[drop]=polarVortex(temps)
    [rows,cols] = size(temps);
    restructure = reshape(temps',1,rows.*cols); %lines 2 and 3 restructure the array into a horizontal vector
    noNan = restructure((restructure>=0 | restructure<0)); %this line removes NaN from the vector
    differences = diff(noNan); %this line calculates the difference between consecutive values
    [value,position]= min(differences); %this line finds the smallest number in the vector, which is the most negative temperature change
    drop = [position(end) (position(end)+1)]; 
end


        
      
    
    