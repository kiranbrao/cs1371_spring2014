function[recommendation] = ifOrSwitch(inputClass)
    inputClassLower = lower(inputClass);
    switch inputClassLower;
        case {'discrete' 'distinct' 'many-to-one'}
            recommendation = sprintf('My data is %s, so I''ll try a switch statement.', inputClassLower);
        case {'range' 'continuous'}
            recommendation = sprintf('My data is %s, so I''ll try an if statement.', inputClassLower);
        otherwise 
            recommendation = sprintf('Unsure about my data. I''ll try an if statement.');
    end
end
