params ["_position"];

private _sheep = createAgent ["Goat_random_F", _position, [], 3, "NONE"];
_sheep setVariable ["BIS_fnc_animalBehaviour_disable", true];



[{
    params ["_args", "_handle"];
    _args params ["_sheeps"];


}, 1, [_sheeps]] call CBA_fnc_addPerFrameHandler;