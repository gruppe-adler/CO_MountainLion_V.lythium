params ["_params"];


private _allIcons = missionNamespace getVariable ["GRAD_CURATORICONS", []];
_allIcons pushBackUnique _params;
missionNamespace setVariable ["GRAD_CURATORICONS", _allIcons];