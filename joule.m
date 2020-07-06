%% Unit joule (J), SI unit of radiant energy
% joule = kg * (m/s)^2 = newton * meter
% From: E = mc^2
%
% Note: unit('J') is supported.
%
% See also: watt

function J = joule

J = unit_MAKE(newton * meter, 'joule', 'J'); % = kg*(m/s)^2
