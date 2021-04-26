params ["_position", ["_vehicles", []]];

private _plane = "RHS_C130J" createVehicle [0,0,0];
private _spawnPos = [20000, _position#1, 100];
private _despawnPos = [-5000, _position#1, 100];

createVehicleCrew _plane;
_plane setDir (_plane getDir _position);
_plane engineOn true;
_plane flyInHeight 100;
_plane setSpeedMode "LIMITED";
_plane setVelocityModelSpace [0, 300, 0]; // initial push

{
  private _type = _x;

  private _vehicle = _type createVehicle [0,0,0];
  _vehicle attachTo [_plane, [0,0,-3000]];
} forEach _vehicles;

group _plane addWaypoint [_position, 0];

[{
    params ["_plane", "_position"];
    _plane distance2D _position < 200
},
{
    params ["_plane", "_position"];
    [_plane] spawn {
        {
            [_plane, _x] call grad_airdrop_fnc_drop;
            sleep 2;
        } forEach attachedObjects _plane;
    };
},
[_plane, _position]] call CBA_fnc_waitUntilAndExecute;

[{
    params ["_plane", "_despawnPos"];
    _plane distance2D _despawnPos < 1000
},
{
    params ["_plane", "_despawnPos"];
    {_plane deleteVehicleCrew _x} forEach crew _plane;
    deleteVehicle _plane;
},
[_plane, _despawnPos]] call CBA_fnc_waitUntilAndExecute;