function[protein] = dna2protein(dna)
    rna = dna2rna(dna); %this line turns the dna strand to an rna strand
    placesA = find(rna=='A');
    placesAU = placesA(rna(placesA+1) == 'U');
    placesAUG = placesAU(rna(placesAU+2)=='G');
    firstAUG = placesAUG(1);
    rna2 = rna(firstAUG:end);
    %the above lines find the first AUG in the rna sequence and make that
    %the starting point for the rna strand
    protein = [];
    timeCount = 1; %this creates a time counter for the while loop

while strcmp(rna2(1:3),'UAA') + strcmp(rna2(1:3),'UAG') + strcmp(rna2(1:3),'UGA') == 0 %this loop stops when the next three terms in the rna string are one of the terminating codons
    codon = rna2(1:3); 
    aa = codon2aa(codon); 
    %the above lines take the first three terms in the rna strand and
    %convert them into an amino acid
    if timeCount > 1
        if mutationAlert(aa,timeCount)==1
            aa = [aa(1) char(aa(2)-32) char((aa(3)-32))];
        end
        %the above lines capitalize the amino acid if there is a mutation
        if mutationAlert(aa,length([protein '-' aa])) == 0
            aa = aa;
        end
        % the above lines keep the amino acid the same if there is no
        % mutation
    end

    if timeCount == 1
        protein = [protein aa];
    end
    if timeCount > 1
        protein = [protein '-' aa]; %this line horizontally concatenates each following amino acid with the previous ones
    end
timeCount = timeCount+1;  %this line increases the time counter by 1 each time the function goes through the loop
rna2(1:3) = []; %this line clears the three terms that have just went through the loop in order to clear space for the next three terms
end
end

    

