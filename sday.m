% Unit sday (sidereal day)
% Converts number to internal units by multplying by it 
% Converts number into day by dividing value in internal units by it. 

function sday = unit 

% Aoki, S., B. Guinot, G. H. Kaplan, H. Kinoshita, D. D. McCarthy and P. K. Seidelmann:
% "The new definition of Universal Time". Astronomy and Astrophysics 105(2), 359-361, 1982.
% For J2000 epoch, = 86400 seconds / 1.002737909350795 exact

sday = day / 1.002737909350795;
