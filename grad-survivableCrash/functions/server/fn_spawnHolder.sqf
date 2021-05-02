params ["_position", "_radius"];

private _pos = [[[_position, _radius]], ["water"]] call BIS_fnc_randomPos;
private _holder = "GroundWeaponHolder" createVehicle _pos;
_holder setDir (random 360);

_holder