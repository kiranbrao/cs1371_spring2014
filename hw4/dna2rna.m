function[rna] = dna2rna(dna)
    [values1,places1] = find(dna == 'A'); 
    dna(places1) = 'U'; %lines 2 and 3 replace A with U
    [values2,places2] = find(dna == 'T');
    dna(places2) = 'A'; %lines 4 and 5 replace T with A
    [values3,places3] = find(dna == 'G');
    dna(places3) = 'B'; %lines 6 and 7 replace G with an arbitrary value B
    [values4,places4] = find(dna == 'C');
    dna(places4) = 'G'; %lines 8 and 9 replace C with G
    [values5,places5] = find(dna == 'B');
    dna(places5) = 'C'; %lines 10 and 11 replace the arbitrary value B with C 
    rna = dna;
end

    
    