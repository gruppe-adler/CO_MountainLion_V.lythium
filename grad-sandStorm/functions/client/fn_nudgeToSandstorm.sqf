params ["_vehicle", "_speed", "_id"];

if (!local _vehicle) exitWith {};

private _markerPos = getMarkerPos "grad-sandstorm_debugmarker_GRAD_sandstorm_id1";
private _vector = _markerPos vectorFromTo (position _vehicle);
_vector params ["_vectorX", "_vectorY"];

// private _speedMultiplier = speed _vehicle;
_vehicle setvelocitymodelspace [_vectorX*_speed, _vectorY*_speed, 0];