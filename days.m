%% Unit days (solar day)
%
% Also, days(month) will give the number of days in the month.
% Month is by an integer 1..12. To get the right number of days for
% February, you need to also provide the year: days(month,year)
%
% See also: day

function x = days(varargin)

if nargin == 0
    
    x = day; 
    
elseif varargin{1} == 1
    
    x = 31;
    
elseif varargin{1} == 2
    
    if nargin == 1
        
        x = 28;
        
    else
        
        year = varargin{2};
        
        if (mod(year,100) ~= 0 && mod(year,  4) == 0) || ...
           (mod(year,100) == 0 && mod(year,400) == 0)
       
            x = 29;
            
        else
            
            x = 28;
            
        end
        
    end
    
elseif varargin{1} == 3
    
    x = 31;
    
elseif varargin{1} == 4
    
    x = 30;
    
elseif varargin{1} == 5
    
    x = 31;
    
elseif varargin{1} == 6
    
    x = 30;
    
elseif varargin{1} == 7
    
    x = 31;
    
elseif varargin{1} == 8
    
    x = 31;
    
elseif varargin{1} == 9
    
    x = 30;
    
elseif varargin{1} == 10
    
    x = 31;
    
elseif varargin{1} == 11
    
    x = 30;
    
elseif varargin{1} == 12
    
    x = 31;
    
end
