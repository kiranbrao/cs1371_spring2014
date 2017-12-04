function [numMar] = marbles(heightCl,diameterCl,diameterMarEst)
    volumeCl = pi.*((diameterCl./2).^2).*heightCl;
    volumeMar = (4/3).*pi.*((diameterMarEst./2).^3);
 numMar = ceil(volumeCl./volumeMar);
end
