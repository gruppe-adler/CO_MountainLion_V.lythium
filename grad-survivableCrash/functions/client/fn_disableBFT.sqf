params ["_unit"];

_unit setVariable ["ace_map_hideBlueForceMarker﻿", true, true]; // hide marker for others
ace_map_bft_enabled = false; // hide marker for self

[{
    params ["_unit"];
    !(_unit getVariable ["ace_map_hideBlueForceMarker﻿", false])
},{
    params ["_unit"];
    [_unit] call GRAD_survivableCrash_fnc_disableBFT;
},
[_unit]] call CBA_fnc_waitUntilAndExecute;