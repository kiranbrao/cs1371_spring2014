function ticTacToe(game)
plotTicTacToeGrid(2,2);
hold on
xShift = 0.3;
yShift = 0.3;
radiusO = 0.3;
boundary = linspace(0, 2*pi);

for pos = 1:9
    translate = game(pos);
    switch pos
        case 1
            centerX = 1;
            centerY = 3;
        case 2
            centerX = 1;
            centerY = 2;
        case 3
            centerX = 1;
            centerY = 1;
        case 4
            centerX = 2;
            centerY = 3;
        case 5
            centerX = 2;
            centerY = 2;
        case 6
            centerX = 2;
            centerY = 1;
        case 7
            centerX = 3;
            centerY = 3;
        case 8
            centerX = 3;
            centerY = 2;
        case 9
            centerX = 3;
            centerY = 1;
    end
switch translate
    case 'X'
        plot([centerX-xShift,centerX+xShift], [centerY-yShift,centerY+yShift], 'k');
        plot([centerX-xShift,centerX+xShift], [centerY+yShift,centerY-yShift], 'k');
    case 'O'
        plot(centerX+radiusO*cos(boundary), centerY+radiusO*sin(boundary), 'r');
end

end
winner = getWinner(game);
switch winner
    case 'tie'
        verdict = 'Cat''s game.';
    otherwise
        verdict = sprintf('Player %s wins!', winner);
end
title(verdict)
hold off
axis off
end

