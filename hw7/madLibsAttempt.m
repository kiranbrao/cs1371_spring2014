function[] = madLibs(structure,wordList)
    [token1,rest1] = strtok(structure,'.');
    fh1=fopen(structure);
    fh2=fopen([token1 '_fixed.txt'],'w');
    fh3=fopen(wordList);
    a='~';
    b='*';
    c='@';
    currentLine=fgets(fh1);
    nounLine = fgetl(fh3);
    verbLine = fgetl(fh3);
    adjLine = fgetl(fh3);
    while ischar(currentLine) 
          if isempty(strfind(currentLine,'%n'))==1
            places2=strfind(currentLine,'%v');
            currentLine(places2) = b;
            currentLine(places2+1) = [];
            
            places3=strfind(currentLine,'%a');
            currentLine(places3) = c;
            currentLine(places3+1) = [];
              fprintf(fh2,[currentLine]);
          end
          if isempty(strfind(currentLine,'%n'))==0
           
            places1=strfind(currentLine,'%n');
            currentLine(places1) = a;
            currentLine(places1+1) = [];
                          
            places2=strfind(currentLine,'%v');
            currentLine(places2) = b;
            currentLine(places2+1) = [];
            
            places3=strfind(currentLine,'%a');
            currentLine(places3) = c;
            currentLine(places3+1) = [];
            
            places4=strfind(currentLine,a);
            for ind=1:length(places4)
                [token2,rest2] = strtok(nounLine,',');
                token3 = currentLine(1:(places4(ind)-1));
                rest3 = currentLine(places4(ind):end);
                rest3(1)=[];
                fprintf(fh2,[token3 token2 rest3]);
                nounLine = rest2;
                if length(nounLine)>0;
                nounLine(1)=[];
                end
            currentLine = sprintf([token3 token2 rest3]);    
            end
          end
            if length(currentLine==b)>0
              places5 = find(currentLine==b);
              for ind=1:length(places5)
              [token4,rest4] = strtok(verbLine,',');
                token5 = currentLine(1:(places5(ind)-1));
                rest5 = currentLine(places5(ind):end);
                rest5(1)=[];
                fprintf(fh2,[token5 token4 rest4]);
                verbLine = rest4;
            if length(verbLine)>0;
                verbLine(1)=[];
                end
            currentLine = sprintf([token5 token4 rest5]); 
            
              end     
          end
          end
        
     fclose(fh2);
     fclose(fh3);

end