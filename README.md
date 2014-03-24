matlab_units
============


A units library for MATLAB with multiple bases and double or unit object data types.


Introduction
------------

A units library based on a my style of having separate files for unit definitions, 
calling them as functions and they return multiplicative conversion factors from the 
unit give to the base units (SI by default) rather than a cluttered collection of 
separate unitXtoUnitY converters. For example, rather than something like `3*ft2m`, 
you would just use `3*ft`. If you then wanted to print a value in inches, rather 
than using something like `x*m2inch`, you would use `x/inch`. 

It has a function to support evaluating unit strings and handling temperatures. 
The default system generates double class values, but there is an option to use the 
included unitval class as the base type which carries unit dimensionality and gives 
you the ability to units check your code with explicit and automatic dimension 
checking. This mode is notably slower, but it is designed to be swapped in and out 
without having to change your code so you can just use it when testing new code.

This is a system I created long ago as a cleaner and more explicit units system 
that would scale better. I have since seen others using the same concept but I 
hope you find this implementation to be better than most. It is intended to be 
easy to use, succinct and extensible. You can easily add your own unit definition 
files to add any additional units that you need.


Installing
----------

Put the units library contents into some folder and put that folder on your MATLAB path. 
The library doesn't support being in a MATLAB package folder (folder name beginning 
with a `+`). 


Quick Start
-----------

Each unit is defined in a simple MATLAB `.m` file. Many have aliases that are defined 
in other `.m` files that refer to the first one. Each returns a value that is the 
value to convert a quantity in that unit to the base units (which are SI by default) 
by multiplying the quantity by the value. 

For example, to convert feet to meters, there are 0.3048 feet per meter, so we would 
multiply a quantity in feet by 0.3048 to convert it to meters. If we wanted to give a 
value as 2 feet but have it become a value in meters for the other code to use, we 
would simply declare it as:

    x = 2 * feet;

The function feet.m returns the quantity 0.3048 and thus converts it to a value of 
0.6096 which is the value in meters. We can use this to declare several quantities 
in a mixture of units even within the same quantity:

    x = 2 * feet;
    y = 3 * furlongs;
    z = 3 * lbf / meter^2;

It is then perfectly correct to make an expression such as:

    p = 10133 * pascals + 0.8 * atm + 76 * torr;
    
You would then use `p` in your code as if it were in consistent base units with any 
other variables without really thinking about that it "has to be" in SI units. 

    L = 12 * inches;
    W = 1 * foot;
    H = 1/2 * meter;
    m = 10 * kg;
    
    V = L * W * H;
    rho = m / V;
    disp(['Density is ', unit2str(rho, 'grams/cm^3')])

The unit conversions don't look like conversions, they look like simple, clear 
declarations of the quantities without the distraction of conversion. Similarly, 
when values are needed to be displayed, the value is converted explicitly there.

In general, you can convert a value to some units by dividing by those units, 
being careful with compound units to use parens:

    rho / (grams/cm^3)
    
You can also use the convert() function:

    convert(rho, grams/cm^3)
    
or

    convert(rho, 'grams/cm^3')

The latter form using a string also allows for any aliases in `unit_ALIASES.m` 
to be used that can't normally be used in a MATLAB expression (like 'sec'), so 
`convert(rho, 'g/cm^3')` would work just as well. Additionally, if the unit is 
a temperature string, a correct conversion will be made whereas the other forms
would not do this.

The compliment to the convert() function is the unit() function which can also 
use a string but converts the value given from the units given to the base units:

    m = unit(10,'kg');

For most things, this is the same as multiplying the number by the value of 
the expression, but like convert() it allows for using unit aliases you can't 
use in code as well as correctly converting temperature values.


Temperature Units
-----------------

Base temperature units are Kelvin, but a base definition can be made for any 
absolute scale such as Rankine in the `english` base. In the past, bases for 
Celcius and Fahrenheit were supported, but it was really confusing and 
complicated, so those were dropped, and only absolute scales with absolute zero 
is equal to 0 are supported as base temperatures. This obsoletes the deg0.m 
function, but it is still included for now, producing a warning.

There are the functions: `degF`, `degC`, `degK`, and `degR`. Used normally, these 
will return the scale factor to convert their degrees to the base degrees but not 
the shift. This is fine for quantities of temperature difference:

    DeltaT = 10 * degC;
    
Here, `degC` and `degK` are the same, and `degF` and `degR` are the same. However, 
there are the equivalents with reversed order for this purpose to differentiate:
`Cdeg`, `Kdeg`, `Fdeg`, and `Rdeg`, which are "Celcius degrees", "Kelvin degrees", 
etc., representing a temperature difference.

To express a temperature measurement, you pass the numeric value to the unit as 
an argument which will do any shift needed:

    T = degC(10);
    
This example declares the temperature to be 10 degrees Celcius. The convert() 
function can correctly handle temperatures, so to convert this to degF:

    convert(T,'degF')

This is equivalent to calling the extended form of the degF() function as:

    degF(T,'to')
    
Which converts a temperature (in base units) to degF. The other deg* functions work 
in the same way.

You can get the absolute zero value for any of the temperature scales by calling 
their unit with the string '0' or 'absolutezero'. So, `degC('0')` gives `-273.15`. 
This will be a double value even when using the unitval class. This is because, in 
general, converting a quantity with units to another creates a unitless value that 
when combined with the units gives a unit value. This is only of practical concern 
when using the unitval class for the units (`units class unitval`) versus the 
double class (`units class double`).

Note that convert() and unit() apply the shift for conversion only when the unit 
is a string and a simple temperature. It does not do any conversion when a 
temperature is mixed with other units as those are "per degree" units.


Unit names
----------

The unit names are case-sensitive as MATLAB is now for M-file functions.
Many units have short forms ("Pa" for example), and those appear in the 
library with their proper letter case which makes them less likely to be a problem 
or be confusing to use in your code. They will all have a word name that these 
are simply aliases for, so you can often use one or the other to avoid conflicts.

The library doesn't come with single-letter unit functions but the functions that 
use units strings can use them since they translate them. You can create single-
letter unit functions, but it can be confusing and error-prone using them in your 
code. The strings have a context of units and often come from user input, so 
convert() and unit() translate them to their word names for evaluation.

Since a call to a units function can call several others, in tight loops this 
might be a performance problem. You can simply assign a units value to a local 
variable in this case:

    km = km;
    
Just be careful (as with any MATLAB variable) to not re-use that variable for 
other purposes as you might with `pi`, for example.


Adding your own units
---------------------

The units included are by no means complete. You can easily add your own; just 
look at a few .m files to see how easy it is. Most are defined in terms of other 
units and don't have to be always defined in base units. For example, in `yard.m`, 
it is defined with:

    yard = 3 * feet;
    
It could be defined in terms of the meter, but this is the natural definition, 
and it avoids duplicating the conversion factor to meters so that there aren't 
inconsitencies. Ultimately, the conversion expression leads to the base units, 
so `feet` in the `yard` definition leads to `feet.m` which is an alias for 
`foot` and `foot.m` contains the definition: `foot = 0.3048 * meter`. 
Just don't create recursive definitions.

You may also want to add support for your unit to the functions `unitsSymbols.m` 
and `unit_ALIASES.m`. 

`unit_ALIASES()` is for when strings contain names for a unit that can't be a 
MATLAB function name (like "sec" for seconds) or for single-letter unit names 
to translate them to the word name. 

`unitsSymbols()` is more or less the reverse of unit_ALIASES() in that it 
translates many unit "word" names to their symbol. This is useful for pretty 
printing units that were given as string input, especially since it supports 
using tex and latex notation to make them look good using those interpreters.


Some constant values
--------------------

This system defines a few constants with the functions g0() and c0(). These 
produce standard Earth gravity and the speed of light in a vacuum, respectively. 
These are used in a few places, so they are available to use for consistency 
and be in the correct units.


English units and 'g'
---------------------

The unit `lbm` (pound-mass) is defined in terms of the kilogram since it is 
indeed a mass. The `lbf` unit (pound-force) is defined similarly to the `kgf` 
(kilogram-force) as a mass times standard earth gravity acceleration, g0. 
For `lbf`, this is one pound-mass times g0.

The upshot of this is that this allows you to input masses in lbm units and 
not have to change the equations from the absolute type where $F=ma$ with no 
proportionality constant to ones that do: $F = 1/g_c * m * a$.

I will probably offer multiple english system bases in the future to address 
this where one would give consistency for the English Engineering system (lbm) 
and one for the gravitational FPS system (slug).

Unitless aliases
----------------

There are several units that are just defined as aliases for `unitless`, such 
as "electrons" and "waves". These are for convenience but are by no means a 
complete set. You may use many others, like "cars" for example. You can 
certainly define these for yourself as needed.

This works fine for double class units, but in a dimension sense, cycles or any 
of the others, like electrons, are actually a dimension. The object units could 
be extended to have an "other" dimension category that is a cell array, and 
unit_MAKE could assign things into it, like "cycles", which the operators would 
check to tally along with the standard unit dimensions. This could be a nice 
place to park radians and steradians as these "other" dimensions would be 
considered unitless or at least not part of the normal physical ones. They 
typically only have powers of +1, -1 or 0 rather than 2 or odd values.
