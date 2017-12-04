function score = gradeEssay(essay, wordCount)
fh1 = fopen(essay);
title = fgetl(fh1);
pl = plagiarized(title);
currentLine = fgetl(fh1);
longstring = currentLine;
while ischar(currentLine)
    currentLine = fgetl(fh1);
    longstring = [longstring,currentLine];
end
wc = length(find(longstring == ' ')) +1;
wcf = 120 - (120*abs((wc-wordCount)/wordCount));
array1 = [];
while ~isempty(longstring)
    [sentence,longstring] = strtok(longstring,'.!?');
    sentence = [sentence,longstring(1)];
    if length(longstring) > 2
        longstring = longstring(2:end);
    else
        longstring = '';
    end
    [ss,iS] = scoreSentence(sentence);
    if iS
        array1 = [array1,ss];
    else
        array1 = [array1,0];
    end
end
ssf = mean(array1);
mn = round(mean([ssf,wcf]));
if pl
    score = 0;
elseif mn > 100
    score = 100;
else
    score = mn;
end
fclose(fh1);
end
