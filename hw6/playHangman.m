function[boardList,missed,outcome] = playHangman(trueWord,guessed)
    boardList = [];
    missed = [];
    for index = 1:length(guessed) %this line creates a loop that runs each guessed letter through the loop
      
      if index == 1
         log = (trueWord == guessed(index)) + (trueWord == (guessed(index)-'a'+'A')); %this line checks to see if the guessed word is in the true word
      end
        
      if index >1
        log = (trueWord == guessed(index)) + (trueWord == (guessed(index)-'a'+'A')) + (trueWord == boardList((index-1),:)); %this line checks to see if the guessed word is in the true word or the previous line of the boardList array
      end
        trueWord2=trueWord;
        trueWord2(log==0) = '_'; %this line makes every character not equal to the guessed word an underscore
        boardList=[boardList;trueWord2]; %this line vertically concatenates every line of boardList for every gussed word
      if norm((trueWord == guessed(index)) + (trueWord == (guessed(index)-'a'+'A'))) == 0
         missed = [missed,guessed(index)]; %this line produces a vector of missed lines
      end
      
    end
    
numLives = (6-length(missed)); %this line establishes the number of lives left by subtracting the length of the missed vector from six   
    switch length(missed)
        case {0 1 2 3 4}
            outcome = sprintf('You have %d lives left.',numLives);
        case {5}
            outcome = sprintf('You have 1 life left.');
        case {6}
            outcome = sprintf('You lose!');
    end
end

        