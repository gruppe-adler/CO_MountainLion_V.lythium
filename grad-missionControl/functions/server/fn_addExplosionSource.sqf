params ["_explosionSource"];

private _sources = missionNamespace getVariable ["grad_missioncontrol_explosionsources", []];
_sources pushBackUnique _explosionSource;
missionNamespace setVariable ["grad_missioncontrol_explosionsources", _sources, true];