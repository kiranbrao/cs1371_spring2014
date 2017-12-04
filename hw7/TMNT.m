function[] = TMNT(fileName,priceLimitStr)
[token1,rest1] = strtok(fileName,'.');
fh1=fopen(fileName);
fh2=fopen([token1 '_order.txt'],'w');
fprintf(fh2,fgets(fh1));
fprintf(fh2,fgetl(fh1));
priceLimitStr(1)=[];
priceLimitNum = str2num(priceLimitStr);

currentLine=fgetl(fh1);
while ischar(currentLine)
[token2,rest2] = strtok(currentLine, '-');
token2(1) = [];
token2(end) = [];
itemPrice = str2num(token2);
rest2(1:2)=[];
if itemPrice <= priceLimitNum
    fprintf(fh2,['\n' rest2]);
end
currentLine=fgetl(fh1);
end
fclose(fh1);
fclose(fh2);
end