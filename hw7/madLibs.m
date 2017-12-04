function madLibs(madlib,words)
fhm = fopen(madlib, 'r');
A = 'a\n';
B = sprintf(A);
fh3 = fopen(words, 'r');
outname = [madlib(1:(end-4)),'_fixed.txt'];
fh2 = fopen(outname, 'w');
currentLine = '';
nouns = fgetl(fh3);
verbs = fgetl(fh3);
adj = fgetl(fh3);
while ischar(currentLine)
    currentLine = fgets(fhm);
    [token,rest] = strtok(currentLine, '%');
    if ~ischar(token)
        break
    end
    fprintf(fh2,token);
    while ~isempty(rest)
        switch rest(2)
            case 'a'
                [word,adj] = strtok(adj,',');
                adj = adj(2:end);
                fprintf(fh2,word);
            case 'n'
                [word,nouns] = strtok(nouns,',');
                nouns = nouns(2:end);
                fprintf(fh2,word);
            case 'v'
                [word,verbs] = strtok(verbs,',');
                fprintf(fh2,word);
        end
        set = {' ','.','!','?',',',';',':',B(2)};
        [~,rest] = strtok(rest,set);
        if isempty(strfind(rest,'%'))
            fprintf(fh2, rest);
            rest = '';
        else
            [token, rest] = strtok(rest, '%');
            fprintf(fh2,token);
        end
    end
end

fclose(fhm);
fclose(fh3);
fclose(fh2);
end   
             
         