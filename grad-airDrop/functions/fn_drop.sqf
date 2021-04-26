//by Persian MO

params ["_plane", "_vehicle"];

private _pos = _plane modelToWorld [.5,-20,0];

detach _vehicle;
_vehicle setDir random 360;
_vehicle setPos _pos;

_vehicle call grad_airdrop_fnc_airDrop;

private _vehicleCount = _plane getVariable ["vehicleCount", 1];
_plane setVariable ["vehicleCount", _vehicleCount - 1, true];