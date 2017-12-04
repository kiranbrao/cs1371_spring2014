function[totalPrice] = tripPlanner(schoolCode,areaCode,VIN)
    
    [totalSchool,secondGrade] = schoolRoster(schoolCode); 
    totalPeople = ceil(totalSchool.*secondGrade); %this line calculates the total number of second graders and rounds up
    
    [miles,galPrice,tax] = cityInfo(areaCode); 
    miles2Travel = miles;
    [mpg] = busInfo(miles2Travel,VIN); 
    gallonsGas = miles2Travel./mpg; %this line caclulates the total gallons of gas used by the bus by dividing total miles traveled by mpg
    priceGas = gallonsGas.*galPrice; %this line calculates the price of gas used by multiplying the total gallons of gas used by the price of gas
    priceGasPerStudent = priceGas./totalPeople; %this line calculates how much of the gas price each student will have to pay 
    
    [price] = ticketPrice(areaCode,miles,totalPeople); 
    priceTax = price.*(1+tax); %this line adds the price of sales tax to the price of each ticket
    
    totalPrice = ceil((priceGasPerStudent + priceTax + 40).*10)./10; %this line calculates the total trip price that each student will have to pay, counting their lunch
    
end

    