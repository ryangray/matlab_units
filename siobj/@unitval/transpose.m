% transpose  Implement p.' for unitvals.

function r = transpose (p)

r = unitval(double(p).', p);
