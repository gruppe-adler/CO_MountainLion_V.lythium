params ["_positionASL", ["_vehicles", []]];

private _plane = "RHS_C130J" createVehicle [0,0,0];
private _spawnPos = [20000, _positionASL#1, 1000];
private _despawnPos = [-5000, _positionASL#1, 1000];

createVehicleCrew _plane;
_plane setPos _spawnPos;
_plane setDir (_plane getDir _positionASL);
_plane engineOn true;
_plane setSpeedMode "LIMITED";
_plane setVelocityModelSpace [0, 300, 0]; // initial push


private _findTerrainHeight = {
    params ["_positionA", "_positionB"];

    private _height = (getTerrainHeightASL _positionA) max (getTerrainHeightASL _positionB);
    private _found = false;
    while { !_found } do {
        _positionA set [2, _height]; _positionB set [2, _height];
        private _intersects = terrainIntersectASL [_positionA, _positionB];
        if (_intersects) then {
            _height = _height + 50;
            ("raising height to " + str _height) call BIS_fnc_log;
        } else {
            _found = true;
            _height
        };
    };
};

private _flyHeightASL = [_spawnPos, _positionASL] call _findTerrainHeight;
_plane flyInHeight 10;
_plane flyInHeightASL [_flyHeightASL, _flyHeightASL, _flyHeightASL]; 
_positionASL set [2, _flyHeightASL];

{
  private _type = _x;

  private _vehicle = _type createVehicle [0,0,0];
  _vehicle attachTo [_plane, [0,0,-3000]];
} forEach _vehicles;

group _plane addWaypoint [_positionASL, 0];
group _plane addWaypoint [_despawnPos, 1];

[{
    params ["_plane", "_positionASL"];
    _plane distance2D _positionASL < 200
},
{
    params ["_plane", "_positionASL"];
    [_plane] spawn {
        params ["_plane"];
        {
            [_plane, _x] call grad_airdrop_fnc_drop;
            sleep 2;
        } forEach (attachedObjects _plane);
    };
},
[_plane, _positionASL]] call CBA_fnc_waitUntilAndExecute;

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