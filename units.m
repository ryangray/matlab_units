% Units
% Prints the units system in use:  units
% Other usage gives the base dimensions:
%  units('length')
%  units('time')
%  units('mass')
%  etc.

function x = units (varargin)

if nargin == 0
    
    x = 'mks (si)';
    
else
    
    switch lower(varargin{1})
        
        case 'length'
            
            x = 'meter';
            
        case 'time'
            
            x = 'second';
            
        case 'mass'
            
            x = 'kilogram';
       
        case 'list'
            
            [p n e v] = fileparts(mfilename('fullpath'));
            ls(p)
            
        otherwise
            
            % Eval a units expression that may contain 'sec' for seconds
            % since 'sec' would otherwise evaluate to the secant funtion.
            
            ue = varargin{1};
            
            ue = units_alias('s','second', ue);
            ue = units_alias('sec','second', ue);
            ue = units_alias('m','meter', ue);
            ue = units_alias('w','watt', ue);

            x = str2num(ue);

    end
    
end

function ue = units_alias(alias, meaning, ue)

if strcmpi(ue,alias) % only alias
    ue = meaning;
else
    
    done = false;
    
    while ~done
        
        done = true;

        % Alias at start followed by an operator /, * or ^
    
        [s e t] = regexpi(ue, ['^(' alias ')[/\*\^]']);
        for i = length(t):-1:1
            done = false;
            ue = [ue(1:t{i}(1)-1) meaning ue(t{i}(2)+1:end)];
        end

        % Alias at end preceded by an operator / or *

        [s e t] = regexpi(ue, ['[/\*](' alias ')$']);
        for i = length(t):-1:1
            done = false;
            ue = [ue(1:t{i}(1)-1) meaning ue(t{i}(2)+1:end)];
        end

        % Alias in the middle preceded by an operator / or * and followed by an
        % operator /, * or ^

        [s e t] = regexpi(ue, ['[/\*](' alias ')[/\*\^]']);
        for i = length(t):-1:1
            done = false;
            ue = [ue(1:t{i}(1)-1) meaning ue(t{i}(2)+1:end)];
        end

    end
    
end
