params ["_vehicle"];

if (!(player in _vehicle)) exitWith {};

addCamShake [10, 2, 9];

playSound "tingle";
playSound "wind";
player allowDamage false;

player setVariable ["GRAD_survivableCrash_crashed", true, true];

// [] call GRAD_survivableCrash_fnc_disableRadio;
[player] call GRAD_survivableCrash_fnc_disableBFT;

[{
    params ["_args", "_handle"];
    _args params ["_vehicle"];

    if (isNull _vehicle) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

     playSound "tingle";
     addCamShake [8, 9, 4];

}, 9, [_vehicle]] call CBA_fnc_addPerFrameHandler;

[{
    params ["_args", "_handle"];
    _args params ["_vehicle"];

    if (isNull _vehicle) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

     playSound "wind";

}, 26, [_vehicle]] call CBA_fnc_addPerFrameHandler;