/*
	[this] call GRAD_enhancedDesert_fnc_addEmitter;
*/

params [["_vehicle",objNull]];

if (isNull _vehicle) exitWith {};

// dont add twice
if (_vehicle getVariable ["GRAD_enchancedDesert_lingerEmitter", false]) exitWith {};
_vehicle setVariable ["GRAD_enchancedDesert_lingerEmitter", true];

diag_log format ["adding emitter to %1", _vehicle];

private _colorR = 0.3;
private _colorG = 0.25;
private _colorB = 0.2;
private _lifetime = 20;
private _multi = 0.05;

[{
	params ["_args", "_handle"];
	_args params ["_vehicle", "_colorR", "_colorG", "_colorB", "_lifetime", "_multi"];

	if (isNull _vehicle) exitWith {
		[_handle] call CBA_fnc_removePerFrameHandler;
	};

	if (!alive _vehicle) exitWith {
		[_handle] call CBA_fnc_removePerFrameHandler;
	};

	private _speed = speed _vehicle;

	if (GRAD_enhancedDesert_ACTIVE && {(_speed > 15)} && {isEngineOn _vehicle}) then {
		drop [
		"\A3\data_f\cl_basic",
		 "", "Billboard", 1, _lifetime,
		 [0, 0, 0],
		 [0, 0, 0], 0.3,
		 1,
		 1,
		 0.0001,
		 [8, 12, 14, 16, 19, 23, 25, 27, 29, 31, 32, 36, 40, 45],
		 [

		 	[_colorR, _colorG, _colorB, 0],
		 	[_colorR, _colorG, _colorB, 0.55*_multi],
		 	[_colorR, _colorG, _colorB, 0.43*_multi],
		 	[_colorR, _colorG, _colorB, 0.37*_multi],
		 	[_colorR, _colorG, _colorB, 0.34*_multi],
		 	[_colorR, _colorG, _colorB, 0.30*_multi],
		 	[_colorR, _colorG, _colorB, 0.28*_multi],
		 	[_colorR, _colorG, _colorB, 0.25*_multi],
		 	[_colorR, _colorG, _colorB, 0.23*_multi],
		 	[_colorR, _colorG, _colorB, 0.2*_multi],
		 	[_colorR, _colorG, _colorB, 0.17*_multi],
		 	[_colorR, _colorG, _colorB, 0.15*_multi],
		 	[_colorR, _colorG, _colorB, 0.1*_multi],
		 	[_colorR, _colorG, _colorB, 0]
		 ],
		 [0,1,0,1,0,1], 0, 0, "", "", _vehicle];
	};

}, 0.1, [_vehicle, _colorR, _colorG, _colorB, _lifetime, _multi]] call CBA_fnc_addPerFrameHandler;

/*
drop ["\A3\data_f\cl_basic","", "Billboard", 1, 60, [0,0,0], [0, 0, 10], 0.3, 1, 1,50, [0.3,3], [[0.5,0.5,0.5,0],[0.7,0.7,0.7,0.5],[0.9,0.9,0.9,0]], [0,1,0,1,0,1], 0, 0, "", "", player];

*/
