params ["_fov", ["_screen", objNull]];

private _droneCamInternal = player getVariable ["GRAD_missionControl_droneCamInternal", objNull];
private _droneCam = player getVariable ["GRAD_missionControl_droneCam", objNull];

if (isNull _droneCamInternal) then {
    _droneCam camSetFov _fov;
    _droneCam camCommit 0;
    [] call GRAD_droneFeed_fnc_droneFeedReset;
} else {
    _droneCamInternal camSetFov _fov;
    _droneCamInternal camCommit 0;
    if (!isNull _droneCam) then {
        _droneCam camSetFov _fov;
        _droneCam camCommit 0;
        [] call GRAD_droneFeed_fnc_droneFeedReset;
    };
};
