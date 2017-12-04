function[modifiedPlayers,winner] = jeopardy(board,players,clues)
    [row,col] = size(clues);
    orderArr = cell2mat(transpose({players.order}));
    [~,origPlaces] = sort(orderArr);  
    answerArr = transpose({players.answer});
    earningsArr = {0 0 0};
    for ind1 = 1:(row*col)
       position = clues{ind1};
       row1 = position(1);
       col1 = position(2);
       currentBoard = board(row1,col1);
       currentAns = currentBoard.answer;
       currentVal = currentBoard.value;
       if strcmpi(currentAns, answerArr{origPlaces(1,ind1)}{ind1})==1
         earningsArr{origPlaces(1,ind1)} = earningsArr{origPlaces(1,ind1)} + currentVal;
       elseif strcmpi(currentAns, answerArr{origPlaces(1,ind1)}{ind1})==0
           earningsArr{origPlaces(1,ind1)} = earningsArr{origPlaces(1,ind1)} - currentVal;
           if strcmpi(currentAns, answerArr{origPlaces(2,ind1)}{ind1})==1
              earningsArr{origPlaces(2,ind1)} = earningsArr{origPlaces(2,ind1)} + currentVal;
           elseif strcmpi(currentAns, answerArr{origPlaces(2,ind1)}{ind1})==0
                  earningsArr{origPlaces(2,ind1)} = earningsArr{origPlaces(2,ind1)} - currentVal;
                  if strcmpi(currentAns, answerArr{origPlaces(3,ind1)}{ind1})==1
                     earningsArr{origPlaces(3,ind1)} = earningsArr{origPlaces(3,ind1)} + currentVal;
                  elseif strcmpi(currentAns, answerArr{origPlaces(3,ind1)}{ind1})==0
                         earningsArr{origPlaces(3,ind1)} = earningsArr{origPlaces(3,ind1)} - currentVal;
                  end
           end
       end
       
    end
      modifiedPlayers = players;
       modifiedPlayers(1).earnings = earningsArr{1};
       modifiedPlayers(2).earnings = earningsArr{2};
       modifiedPlayers(3).earnings = earningsArr{3};
       
       [~,finalPlaces] = sort(cell2mat(earningsArr));
       winner = players(finalPlaces(end)).name;
end    