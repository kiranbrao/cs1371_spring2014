function[shifted] = barrelShift(vec,num)
   vecLength = length(vec);
    if num>0
        shifted = vec([end-(mod(num,vecLength)-1):end,1:end-mod(num,vecLength)]); %this line calculates the shift when the number is greater than zero
    end
    if num==0
        shifted = vec; %this line keeps the vector the same when the number is equal to zero
    end
    if num<0
        shifted = vec([end-(mod((num+vecLength),vecLength)-1):end,1:end-mod((num+vecLength),vecLength)]); %this line calculates the shift when the number is less than zero
    end
end
