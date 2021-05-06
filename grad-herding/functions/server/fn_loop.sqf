params ["_index"];

diag_log format ["starting loop for herd %1", _index];

/*private _targetDebug = "VR_3DSelector_01_incomplete_F" createVehicleLocal [0,0,0];
private _targetDebug2 = "VR_3DSelector_01_default_F" createVehicleLocal [0,0,0];*/

[{
	params ["_args", "_handle"];
    _args params ["_index"];

	// save herd index to make it globally und publicly accessible 
	private _instanceString = format ["GRAD_herding_instance_%1", _index];
	// diag_log format ["_instanceString is %1", _instanceString];

	private _herdArray = missionNamespace getVariable [_instanceString, createHashMap];
	if (count _herdArray == 0) exitWith {
		diag_log format["grad_herding: warning: herd %1 does not exist, removing loop", _index];
		[_handle] call CBA_fnc_removePerFrameHandler;
	};
	_herdArray params ["", "_leadanimal", "_animalArrayLiving"];

	// diag_log format ["reading herd %1 of index %2 in loop", _herdArray, _index];

	// stop loop if all animals are dead
	_animals = (_herdArray get "animals") select {alive _x};
	_herdArray set ["animals", _animals];
	if ((count _animals) isEqualTo 0) exitWith {
		diag_log format ["herd %1 is dead, ending loop", _index];
		[_handle] call CBA_fnc_removePerFrameHandler;
	};

	// change lead animal if necessary
	private _leader = _herdArray get "leader";
	if (!alive _leader) then {
			private _newLeader = selectRandom _animals;
			_herdArray set ["leader", _newLeader];
			missionNamespace setVariable [_instanceString, _herdArray, true];
	};

	private _shepherd = _herdArray get ["shepherd", objNull];
	if (alive _shepherd) then {
		_targetPos = [_shepherd] call GRAD_herding_fnc_getWaypointFromShepherd;
		// diag_log format ["getting waypoint from shepherd %1", _targetPos];
		
	} else {
		_targetPos = (getPos _leader) vectorAdd [(random 1) - 1, (random 1) - 1];
	};

	// animations and move command

	[_leader, _x distance _targetPos, _targetPos] call GRAD_herding_fnc_moveAnimal;
	{
		private _distance = _x distance _leader;
		[
			{_this call GRAD_herding_fnc_moveAnimal}, 
			[_x, _distance, getPos _leader], 
			random 2
		] call CBA_fnc_waitAndExecute;
	} forEach (_animals - [_leader]);

	{
		[_x] call GRAD_herding_fnc_makeSound;		
	} forEach _animals;

}, 3, [_index]] call CBA_fnc_addPerFrameHandler;