%% Check if a unit exists as a file
%
% Roughtly equivalent to ~isempty(units(name)) but does not invoke the unit
% evaluation, and only works for a single unit rather than a unit
% expression. It also checks if it is recognized by unit_ALIASES() in case
% there is no M file for it, such as for 'sec'.
%
% If the string contains an operator, then it is evaluated with units(name)
% to see if it is a valid
%
%% Usage
%
%  boolean = unitExists(name)
%
% * name - A string that will become the name of the M file
%
% For example: unitExists('hPa')
%
% See also: units

function exists = unitExists (name)

if ~isempty(regexp(name, '\*\/\^', 'once'))
    
    exists = ~isempty(units(name));
    
else
    
    folder = fileparts(mfilename('fullpath'));

    mfile = fullfile(folder, [name '.m']);

    exists = exist(mfile,'file') || ~strcmp(name, unit_ALIASES(name));

end
