private _target = player getVariable ["GRAD_missionControl_pipScreen", objNull];

if (isNull _target) exitWith {};

private _currentFOV =  _target getVariable ["GRAD_missionControl_zoomLevel", 0.1];

if ((_this select 1) > 1) then {
    _currentFOV = _currentFOV - 0.05;
};

if ((_this select 1) < -1) then {
    private _currentFOV =  _target getVariable ["GRAD_missionControl_zoomLevel", 0.1];
    _currentFOV = _currentFOV + 0.05;
};

_target setVariable ["GRAD_missionControl_zoomLevel", _currentFOV, true];
["GRAD_droneFeed_fovChange", [_currentFOV, _target]] call CBA_fnc_globalEvent;
