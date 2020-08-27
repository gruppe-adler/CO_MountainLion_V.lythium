private _path = [];
private _car = suicideCar;

for "_i" from 1 to 57 do {
    private _mrkName = format ["mrk_suicideCar_%1", _i];
    private _position = getMarkerPos _mrkName;
    _position set [3, _i * 2];
    _path pushBackUnique _position;
};

_car setDriveOnPath _path;

[{
    params ["_car"];
    !canMove _car || damage _car > 0.1
},{
    params ["_car"];

    [_car] execVM "grad-missionControl\functions\server\fn_suicideCarExplode.sqf";
},[_car]] call CBA_fnc_waitUntilAndExecute;