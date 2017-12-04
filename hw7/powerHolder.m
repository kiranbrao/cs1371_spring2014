function[pants] = powerHolder(convo)
    fh = fopen(convo,'r');
    currentLine=fgetl(fh);
     a=1;
    name = strtok(currentLine,':');
     if isempty(strfind(lower(currentLine),'goodnight'))==0
        pants = name;  
     end
  if isempty(strfind(lower(currentLine),'goodnight'))==1
    while a==ischar(currentLine) 
        if strcmp(currentLine,'')==1
             currentLine=fgetl(fh);
             name = strtok(currentLine,':');
        end
        if isempty(strfind(lower(currentLine),'goodnight'))==0
        pants = name;   
        a=2;
        end
             currentLine=fgetl(fh);
    end
  end
    fclose(fh);
end
            
            
            