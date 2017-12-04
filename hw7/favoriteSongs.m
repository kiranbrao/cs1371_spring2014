function[bestSong,finalScore] = favoriteSongs(song1,song2,song3,filename);
    fh = fopen(filename,'r');
    scoreKeep1 = [];
    scoreKeep2 = [];
    scoreKeep3 = [];
    currentLine=fgets(fh);
    while ischar(currentLine)>0
    if length(strfind(currentLine,song1))>0
        places1 = find(currentLine==':');
        [token1,rest1] = strtok(currentLine,currentLine(places1(end)));
        rest1(1:2) = [];
        score1 = str2num(rest1);
        scoreKeep1 = [scoreKeep1 score1];
    end
     if length(strfind(currentLine,song2))>0
        places2 = find(currentLine==':');
        [token2,rest2] = strtok(currentLine,currentLine(places2(end)));
        rest2(1:2) = [];
        score2 = str2num(rest2);
        scoreKeep2 = [scoreKeep2 score2];
     end
      if length(strfind(currentLine,song3))>0
        places3 = find(currentLine==':');
        [token3,rest3] = strtok(currentLine,currentLine(places3(end)));
        rest3(1:2) = [];
        score3 = str2num(rest3);
        scoreKeep3 = [scoreKeep3 score3];
      end
    currentLine=fgets(fh);  
    end
    totalScore1 = sum(scoreKeep1);
    totalScore2 = sum(scoreKeep2);
    totalScore3 = sum(scoreKeep3);
    finalScore = max([totalScore1 totalScore2 totalScore3]);
    switch finalScore
        case sum(scoreKeep1)
            bestSong = song1;
        case sum(scoreKeep2)
            bestSong = song2;
        case sum(scoreKeep3)
            bestSong = song3;
    end
    fclose(fh);
end

    
      
    