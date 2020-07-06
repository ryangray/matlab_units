%% Unit days (mean solar day)
%
% Also, days(month) will give the number of days in the month.
% Month is by an integer 1..12. To get the right number of days for
% February, you need to also provide the year: days(month,year)
%
% See also: day

function x = days (varargin)

if nargin == 0
    
    x = day; 
    
else
    
    switch varargin{1}
        
        case {1,3,5,7,8,10,12}
    
            x = 31;
    
        case {4,6,9,11}
    
            x = 30;
    
        case 2
    
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
    end
end
