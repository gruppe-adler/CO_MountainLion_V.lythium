/*

	by nomisum for gruppe adler 2018


	[_position] remoteExec ["GRAD_herding_fnc_create", 2];
*/

if (!isServer) exitWith {};

params [
	"_spawnPosition", 
	["_count",10], 
	["_shepherd", objNull], 
	["_animalType", "Goat_random_F"], 
	["_killTrigger", false]
];

// get amount of herds created and add to counter
private _currentIndex = (missionNamespace getVariable ["GRAD_herding_instanceCount", 0]) + 1;
missionNamespace setVariable ["GRAD_herding_instanceCount", _currentIndex, true];

private _group = createGroup west;
if (isNull _shepherd) then {
	private _shepherd = _group createUnit ["UK3CB_TKC_B_WORKER", _spawnPosition, [], 0, "NONE"];
	_shepherd setVariable ["BIS_enableRandomization", false];
};


private _pole = "Land_Net_Fence_pole_F" createVehicle [0,0,0];
_pole attachTo [_shepherd, [0,0,0], "RightHandMiddle1", true];
_pole setVectorDirAndUp [[0,0.66,-0.33],[0,0.33,0.66]];
_shepherd setVariable ["shepherdPole", _pole, true];

_shepherd setVariable ["GRAD_isShepherd", true, true];

if (_killTrigger) then {
	_shepherd setVariable ["GRAD_isShepherd_killTrigger", true, true];
	missionNamespace setVariable ["GRAD_shepherd", _shepherd, true];
};

_shepherd addMPEventHandler ["MPkilled", {
	params ["_unit"];

	if (!local _unit) exitWith {};
	detach (_unit getVariable ["shepherdPole", objNull]);

	["GRAD_shepherd_dead", [_unit]] call CBA_fnc_globalEvent;
}];

private _herdArray = createHashMapFromArray [
	["shepherd", _shepherd]
	["leader", objNull]
	["animals", []]
];
_herdArray set ["shepherd", _shepherd];

private _herdAnimals = [];

for "_i" from 1 to _count do {

		// Spawn animal
		private _animal = createAgent [_animalType, _spawnPosition, [], 3, "NONE"];

		// Disable animal behaviour
		_animal setVariable ["BIS_fnc_animalBehaviour_disable", true];
		_animal disableAI "FSM";
		// _animal disableAI "MOVE";
		// _animal disableAI "ANIM";
		_animal setBehaviour "CARELESS";
		_animal setCombatMode "RED";
		// _animal setSkill 0;

		// Declare first animal to leader of flock
		if (_i isEqualTo 1) then {
				_animal setDir (random 360);
				_herdArray set ["leader", _animal];
		} else {
				_animal setDir (_animal getRelDir (_herdArray get "leader"));

				// Add animal to animal list
				_herdAnimals pushBack _animal;
		};

		_animal addEventHandler ["AnimChanged", {
			params ["_unit", "_anim"];

			// only force every second animation sequence to allow for turning
			if (!(_unit getVariable ["GRAD_HERDING_ANIM_SKIP", false])) exitWith {
					_unit setVariable ["GRAD_HERDING_ANIM_SKIP", true]
			};
			_unit setVariable ["GRAD_HERDING_ANIM_SKIP", false];

			if (!alive _unit) exitWith {_unit removeEventHandler ["AnimChanged", _thisEventhandler]; };
			// diag_log format ["_animDone done %1", _anim];
			private _anim = _unit getVariable ["GRAD_HERDING_ANIM", GRAD_HERDING_ANIM_STOP];
			// [_unit, _anim] remoteExec ["switchMove", 0];
			_unit playMoveNow _anim; // playmoveNow prevents turning
			// diag_log format ["_animDone exec %1", _anim];
		}];
};

// fill herd with animal array
_herdArray set ["animals", _herdAnimals];

// save herd index to make it globally und publicly accessible
private _instanceString = format ["GRAD_herding_instance_%1", _currentIndex];
missionNamespace setVariable [_instanceString, _herdArray, true];

[_currentIndex] spawn GRAD_herding_fnc_loop;
