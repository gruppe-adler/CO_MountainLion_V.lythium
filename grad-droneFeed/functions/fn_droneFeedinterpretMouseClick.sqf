private _droneCamInternal = player getVariable ["GRAD_missionControl_droneCamInternal", objNull];

if (isNull _droneCamInternal) exitWith {
    [true] call GRAD_droneFeed_fnc_droneFeedReset;
};

if ((_this select 1) == 1) then {
    private _camera = "camera" camCreate (getpos player);
    _camera cameraeffect ["terminate", "back"];
    camDestroy _camera;
    camDestroy _droneCamInternal;

    [true] call GRAD_droneFeed_fnc_droneFeedReset;

    player setVariable ["GRAD_missionControl_droneCamInternal", objNull];
    diwako_dui_main_toggled_off = false;

    ("BIS_layerStatic" call BIS_fnc_rscLayer) cutRsc ["RscStatic", "PLAIN"];
    {
        private ["_layer"];
        _layer = _x call BIS_fnc_rscLayer;
        _layer cutText ["", "PLAIN"];
    } forEach ["BIS_layerEstShot", "BIS_layerStatic"];

    private _ppGrain = player getVariable ["GRAD_missionControl_dronePPEffect", -1];
    if (_ppGrain != -1) then {
        ppEffectDestroy _ppGrain;
    };
};
