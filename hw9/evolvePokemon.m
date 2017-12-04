function[out] = evolvePokemon(pokedex,pokemon)
    nameVec = [pokedex.Name];
    if isempty(strfind(nameVec,pokemon))==1
        out = [pokemon ' is not a Pokemon.'];
    else
    nameArr = {pokedex.Name};
    out = {pokemon};
    evoArr = {pokedex.Evolution};
    for ind = 1:length(nameArr) 
        currentPokemon = nameArr{ind};
        if strcmp(currentPokemon,pokemon) == 1
            evo = evoArr{ind};
            while isempty(evo) == 0
                out = [out {evo}];
                for ind2=1:length(nameArr)
                    currentEvo = nameArr{ind2};
                    if strcmp(evo,currentEvo) == 1
                        evo = evoArr{ind2};
                        break
                    end
                end
            end
        end
    end
    end
end                  