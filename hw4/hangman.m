function[board] = hangman(mysteryWord,guessedLetter)
    guessedLetterCap = char(guessedLetter - 'a' + 'A');
    log = mysteryWord == guessedLetter; 
    log2 = mysteryWord == guessedLetterCap; 
    log3 = log + log2; %lines 3, 4, and 5 allow both lowercase and capital letters to be used in the hangman function
    [values,places]=find(log3 < 1);
    mysteryWord(places)= '_'; %this line replaces letters that are not gussed with an underscore
    board=mysteryWord;
end

    