private _path = [];
private _car = suicideCar;

_car setPilotLight false;

_car setVehicleLock "LOCKED";
_car allowCrewInImmobile true;
(driver _car) setBehaviour "CARELESS";

{
    if (typeOf _x == "MetalBarrel_burning_F") then {
        _x inflame true;
    };
} forEach attachedObjects _car;

for "_i" from 1 to 57 do {
    private _mrkName = format ["mrk_suicideCar_%1", _i];
    private _position = getMarkerPos _mrkName;
    _position set [3, _i * 2];
    _path pushBackUnique _position;
};

_car setDriveOnPath _path;

_car addEventHandler ["HitPart", {
    (_this select 0) params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect"];

    private _count = _target getVariable ["ML_hitCount", 0];
    _target setVariable ["ML_hitCount", _count + 1, true];

    if (_count > 15 || !canMove _target) then {
        _target removeEventHandler ["HitPart", _thisEventhandler];
        [_target] execVM "grad-missionControl\functions\server\fn_suicideCarExplode.sqf";
    };
}];
