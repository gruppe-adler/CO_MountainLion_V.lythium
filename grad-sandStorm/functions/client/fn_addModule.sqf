/*

module for ZEN

0: Values that can be returned <ARRAY>
1: Corresponding pretty names (see below) <ARRAY>
2: Default index <NUMBER>

*/

["BERGLOEWE PHASECHANGE", "Edit Sandstorm", {

private _existingSandstormsCount = missionNamespace getVariable ["GRAD_sandstorm_existingSandstormCount", 0];
private _sandStormIds = [];
private _sandStormIdentifier = [];

if (_existingSandstormsCount < 1) exitWith { hint "no sandstorms active"; };

for [{_i = 1}, {_i < 2}, {_i = _i + 1}] do
{
	diag_log format ["i %1", _i];
	_sandStormIds pushBackUnique _i;
	_sandStormIdentifier pushBackUnique [str _i, "sandstorm " + str _i];
};

diag_log format ["sandstormIds: %1", _sandStormIds];
diag_log format ["_sandStormIdentifier: %1", _sandStormIdentifier];


		["GRAD Sandstorm", [
		    [
		    	"COMBO",
		    	["Sandstorm ID", "Which sandstorm values below are attributed to"], [
		    	_sandStormIds, _sandStormIdentifier, 0],
		    	true
		    ],
		    [
		        "SLIDER",
		        ["0 - 120 kmh (def 50)"],
		        [0, 120, 50, 1],
		        true
		    ],
		    [
		        "SLIDER",
		        ["Sandstorm Direction", "0-360° (def current winddir)"],
		        [0, 360, windDir, 1],
		        true
		    ]
		], {
		    params ["_dialogValues"];

		    _dialogValues params [
		        "_id",
		        "_speed",
		        "_windDirection"
		    ];

		    ["GRAD_sandstorm_parametersEdited", [_id, _speed, _windDirection]] call CBA_fnc_globalEvent;
		}] call zen_dialog_fnc_create;

}] call zen_custom_modules_fnc_register;



["BERGLOEWE PHASECHANGE", "Start Sandstorm", {

	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
	_position = ASLToAGL _position;

		["GRAD Sandstorm", [
			[
		        "SLIDER",
		        ["Sandstorm Radius", "4 - 12km (def 4km)"],
		        [4000, 12000, 4000, 1],
		        true
		    ],
		    [
		        "SLIDER",
		        ["Sandstorm Speed", "0 - 120 kmh (def 50)"],
		        [0, 120, 50, 1],
		        true
		    ],
		    [
		        "SLIDER",
		        ["Sandstorm Direction", "0-360° (def 180)"],
		        [0, 360, 180, 1],
		        true
		    ]
		], {
		    params ["_dialogValues", "_args"];
		    _args params ["_position"];

		    _dialogValues params [
		    	"_radius",
		        "_speed",
		        "_windDirection"
		    ];

		    diag_log format ["creating sandstorm with %1, %2, %3, %4", _position, _radius, _speed, _windDirection];

		    [_position, _radius, _speed, _windDirection] remoteExec ["GRAD_sandstorm_fnc_createSandWall", 2];
		}, {}, [_position]] call zen_dialog_fnc_create;

		missionNamespace setVariable ["GRAD_sandstorm_target", crashheli, true];

}] call zen_custom_modules_fnc_register;



["BERGLOEWE PHASECHANGE", "Nudge Heli to Sandstorm", {

private _existingSandstormsCount = missionNamespace getVariable ["GRAD_sandstorm_existingSandstormCount", 0];
private _sandStormIds = [];
private _sandStormIdentifier = [];

if (_existingSandstormsCount < 1) exitWith { hint "no sandstorms active"; };

for [{_i = 1}, {_i < 2}, {_i = _i + 1}] do
{
	diag_log format ["i %1", _i];
	_sandStormIds pushBackUnique _i;
	_sandStormIdentifier pushBackUnique [str _i, "sandstorm " + str _i];
};

diag_log format ["sandstormIds: %1", _sandStormIds];
diag_log format ["_sandStormIdentifier: %1", _sandStormIdentifier];


		["GRAD Sandstorm", [
		    [
		    	"COMBO",
		    	["Sandstorm ID", "Which sandstorm values to nudge to"], [
		    	_sandStormIds, _sandStormIdentifier, 0],
		    	true
		    ],
		    [
		        "SLIDER",
		        ["Speed", "0 - 120 kmh (def 50)"],
		        [0, 120, 50, 1],
		        true
		    ]
		], {
		    params ["_dialogValues", "_args"];
		    _args params ["_position"];

		    _dialogValues params [
		    	"_id",
		    	"_speed"
		    ];

		    [crashheli, _speed, _id] remoteExecCall ["GRAD_standstorm_fnc_nudgeToSandstorm", crashheli];

		}, {}, []] call zen_dialog_fnc_create;
	

}] call zen_custom_modules_fnc_register;
