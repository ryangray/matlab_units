This folder is for uning the units library in the SI system.

The units library is esentially a set of definitions to a base of SI. 
The base unit folder for SI just says those base values are all = 1.
Other base unit folders define them in terms of SI. Thus, in the
english base, unit_LENGTH.m returns 1/0.3048 so that foot.m returns
0.3048 * 1/0.3048 = 1.

The other bases only define what base units are differnet than SI.
So, you need to always put units and units/si on your Matlab path,
but you can put units/english above units/si if you want to work in
english units, which only redefine some of the base values. The ones
it does not re-define, will be served by the ones in units/si.

You could also create your own custom system by making a folder with
just the unit_*.m base definitions in it that you need. For example,
you could make yours define unit_ANGLE_PLANE as 180/pi to have a 
base of degrees. You would, however, need to convert all your angles
to radians before passing them to trig functions, which all work in 
radians (e.g., chteta = cos(theta/radians)). You should always re-define
the units_SYSTEM.m to return the name of your system.