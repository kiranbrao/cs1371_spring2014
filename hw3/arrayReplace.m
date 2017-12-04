function[arrLast] = arrayReplace(arr1,arr2,num)
    log = arr1==num; %this line finds where the first array has the designated number
    change = find(log==1);%this line finds which places in the first array have the designated number
    arr1(change) = arr2(change); %this line replaces the numbers in the first array with the numbers in the second array 
    arrLast=arr1;
end
