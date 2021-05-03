params ["_fov", ["_droneCam", objNull]];

private _droneCamInternal = player getVariable ["GRAD_missionControl_droneCamInternal", objNull];

if (isNull _droneCamInternal) then {
    _droneCam camSetFov _fov;
    _droneCam camCommit 0;
} else {
    _droneCamInternal camSetFov _fov;
    _droneCamInternal camCommit 0;
    if (!isNull _droneCam) then {
        _droneCam camSetFov _fov;
        _droneCam camCommit 0;
    };
};