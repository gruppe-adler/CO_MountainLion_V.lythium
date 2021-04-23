// execVM "grad-missionControl\functions\server\fn_startKaffeefahrt.sqf";


private _car = kaffeefahrtBus;
private _path = [];

_car setBehaviour "CARELESS";

for "_i" from 1 to 54 do {
    private _mrkName = format ["mrk_kaffeefahrt_%1", _i];
    private _position = getMarkerPos _mrkName;
    _position set [3, _i * 2];
    _path pushBackUnique _position;
};

kaffeefahrt_building animateSource ["Door_3_sound_source", 1];
kaffeefahrt_building animateSource ["Door_4_sound_source", 1];


private _types = [
    "UK3CB_TKM_O_IED",
    "UK3CB_TKM_O_MD",
    "UK3CB_TKM_O_RIF_1",
    "UK3CB_TKM_O_SNI",
    "UK3CB_TKM_O_WAR",
    "UK3CB_TKM_O_GL",
    "UK3CB_TKM_O_DEM"
];

private _group = createGroup east;

for "_i" from 1 to 12 do {
    private _unit = _group createUnit [selectRandom _types, position _car, [], 0, "CAN_COLLIDE"];
    _unit moveInAny _car;
};


_car setDriveOnPath _path;

[{
    params ["_args", "_handle"];
    _args params ["_car"];

    if ((position _car) distance (getMarkerPos "mrk_kaffeefahrt_54") < 10) then {
        _car setBehaviour "AWARE";
        doStop _car;

        [_car] spawn {
            params ["_car"];

            {
                [_x] allowGetIn false;
                doGetOut _x;
            } forEach crew _car;
        };

        [_handle] call CBA_fnc_removePerFrameHandler;
    };    
}, 0.5, [_car]] call CBA_fnc_addPerFrameHandler;