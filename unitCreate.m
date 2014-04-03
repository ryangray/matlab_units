%% Create a new unit definition M file
%
% An easy way to initially make a new unit definition. This will create a
% basic function in the units library folder.
%
%% Usage
%
%  mfilename = unitCreate(name, definition)
%  mfilename = unitCreate(name, definition, description)
%  mfilename = unitCreate(name, definition, description, folder)
%
% * name - A string that will become the name of the M file
% * definition - A string that will be the right-hand side of the value
% * description - A short description of the unit
% * folder - Optional folder to place the M file in (default is units lib)
%
% For example, unitCreate('hPa','hecto * Pa','hectopascals (100 Pa)') will
% create a function M file named hPa.m with the code:
%
%  %% Unit hPa : hectopascals (100 Pa)
%  % 
%  
%  function hPa = unit
%
%  hPa = hecto * Pa;
%
% If you give the description as blank or leave it off, the definition will
% be used in its place.
%
% Of course, the unit name needs to be both a valid variable name and a
% valid filename. Some checking is performed to try to prevent invalid
% names, and on error will be signaled if there is an existing function
% with that name on your path.
%
% The definition string can reference other units, and it should do so to
% avoid duplicating conversion constants. However, be careful to not cause
% a recursive reference.
%
% You can use the folder option to make local units, typically specifying
% it as just: '.'
%
% The filename of the new file is returned, so you could use this to delete
% the file later or to pass it to a version control command to add it:
%
%  mfile = unitCreate('hPa','hecto*Pa','Hectopascals (100 Pa)');
%  system(['svn add "' mfile '"']);
%
% See also: units

function mfile = unitCreate (name, definition, desc, folder)

if nargin < 4
    
    folder = fileparts(mfilename('fullpath'));
    
end

mfile = fullfile(folder, [name '.m']);
fn = [];
if isempty(desc)
    desc = definition;
end

if exist(mfile,'file')
    
    error('A unit with that name already exists.');
    
end

if exist(name,'file')
    
    fn = which(name);
    warning('There is already a function with that name at:\n  %s', fn)
    
end

if evalin('caller', ['exist(''' name ''',''var'');'])
    
    warning('There is already a variable in the workspace with that name.');
    
end

fid = fopen(mfile,'wt');

if fid == -1
    
    error('Can''t write the file %s', mfile);
    
end

fprintf(fid, '%%%% Unit %s : %s\n', name, desc);
fprintf(fid, '%%\n\n');
fprintf(fid, 'function %s = unit \n', name);
fprintf(fid, '\n%s = %s;\n', name, definition);

fclose(fid);

if ~isempty(fn)
    
    if strcmpi(fileparts(which(fn)), fileparts(which(name)))
        warning('It appears the existing function will mask this new unit');
    else
        warning('It appears this new unit will mask the existing function');
    end
    
end

% Check unit

try
    val1 = unit(name);
catch
    error('Error evaluationg unit "%s".', name);
end

try
    val2 = unit(definition);
catch
    error('Error evaluationg unit definition "%s".', definition);
end

if val1 ~= val2
    
    warning('Evaluating "%s" does not appear equal to that of "%s".', name, definition);
elseif ~isempty(fn)
    fprintf('Evaluating "%s" checks out equal to that of "%s".', name, definition);
end
