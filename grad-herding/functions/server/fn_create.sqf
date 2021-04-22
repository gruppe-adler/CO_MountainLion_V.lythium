/*

	by nomisum for gruppe adler 2018


	[_position] remoteExec ["GRAD_herding_fnc_create", 2];
*/

if (!isServer) exitWith {};

params ["_spawnPosition", ["_count",10], ["_shepherd", objNull], ["_animalType", "Goat_random_F"]];

private _herdArray = [_shepherd, objNull, [], []];
private _herdAnimals = [];

// get amount of herds created and add to counter
private _currentIndex = (missionNamespace getVariable ["GRAD_herding_instanceCount", 0]) + 1;
missionNamespace setVariable ["GRAD_herding_instanceCount", _currentIndex, true];

private _shepherd = (createGroup civilian) createUnit ["UK3CB_TKC_C_WORKER", _spawnPosition, [], 0, "NONE"];

private _pole = "Land_Net_Fence_pole_F" createVehicle [0,0,0];
_pole attachTo [_shepherd, [0,0,0], "RightHandMiddle1", true];
_pole setVectorDirAndUp [[0,0.66,-0.33],[0,0.33,0.66]];
_shepherd setVariable ["shepherdPole", _pole, true];
[] remoteExec ["GRAD_herding_fnc_addGestureHandler", _shepherd];


_shepherd addMPEventHandler ["MPkilled", {
	params ["_unit"];

	if (!local _unit) exitWith {};
	detach (_unit getVariable ["shepherdPole", objNull]);
}];

_herdArray set [0, _shepherd];

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
				_herdArray set [1, _animal];
		} else {
				_animal setDir (_animal getRelDir (_herdArray select 1));
						
				// Add animal to animal list
				_herdAnimals pushBack _animal;
		};

		_animal addEventHandler ["AnimDone", {
			params ["_unit", "_anim"];
			diag_log format ["_animDone done %1", _anim];
			private _anim = _unit getVariable ["GRAD_HERDING_ANIM", GRAD_HERDING_ANIM_STOP];
			// [_unit, _anim] remoteExec ["switchMove", 0];
			_unit playMoveNow _anim;
			diag_log format ["_animDone exec %1", _anim];
		}];
};

// fill herd with animal array
_herdArray set [2, _herdAnimals];

// save herd index to make it globally und publicly accessible 
private _instanceString = format ["GRAD_herding_instance_%1", _currentIndex];
missionNamespace setVariable [_instanceString, _herdArray, true];

[_currentIndex] spawn GRAD_herding_fnc_loop;
