% Unit days (solar day)
% Converts number to internal units by multplying by it 
% Converts number into days by dividing value in internal units by it. 
% Also, days(month) will give the number of days in the month.
% Month is by an integer 1..12.

function x = days(varargin)

if nargin == 0
    
    x = day; 
    
elseif varargin{1} == 1
    
    x = 31;
    
elseif varargin{1} == 2
    
    x = 28;
    
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