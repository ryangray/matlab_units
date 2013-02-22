% Units kilogram in terms of the base mass

function kilogram = unit_MASS

kilogram = unit_MAKE(0.3048 / (0.45359237 * 9.80665), 'slug','slug','mass');
