function plotStock(cellArr)
    numArr = cell2mat(cellArr);
    day = numArr(1:2:end);
    price = numArr(2:2:end);
    plot(day,price,'black');
    hold on 
    plot([day(1) day(end)],[price(1),price(1)],'black');
    for ind = 2:length(day)
        if price(ind) > price(1)
            plot([day(ind - 1) day(ind)], [price(ind - 1) price(ind)],'green');
        else 
            plot([day(ind - 1) day(ind)], [price(ind - 1) price(ind)],'red');
        end
    end
xlabel('Trading Day');
ylabel('Closing Price (USD)');
end   