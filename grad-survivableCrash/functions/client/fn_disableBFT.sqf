params ["_unit"];

_unit setVariable ["ace_map_hideBlueForceMarker﻿", true, true];

[{
    params ["_unit"];
    !(_unit getVariable ["ace_map_hideBlueForceMarker﻿", false])
},{
    params ["_unit"];
    [_unit] call GRAD_survivableCrash_fnc_disableBFT;
},
[_unit]] call CBA_fnc_waitUntilAndExecute;