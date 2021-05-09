params ["_veh"];

[_veh, true] remoteExec ["allowDamage"];

[_veh] spawn { 
	params ["_veh"];

	for "_i" from 0 to 20 do {
		private _damage = _veh getHitPointDamage "HitEngine";
		[_veh, ["HitEngine",_damage + 0.1]] remoteExec ["setHitPointDamage", _veh];
		sleep 1;
	};

	{
		[_veh] remoteExecCall ["GRAD_survivableCrash_fnc_falling", _x];
	} forEach crew _veh;

	[_veh, ["hitavionics",1]] remoteExec ["setHitPointDamage", _veh];
	[_veh, ["HitVRotor",.88]] remoteExec ["setHitPointDamage", _veh];
	
	[_veh, false] remoteExec ["allowDamage"];

	// hide BFT
	{
	  	_x setVariable ["ace_map_hideBlueForceMarker", true, true];
	} forEach crew _veh;


	[{
		params ["_veh"];
		getPos _veh select 2 < 5
	},{	
		params ["_veh"];
		// trigger ejection and effects on crew
		{
			[_x, _veh] remoteExecCall ["GRAD_survivableCrash_fnc_onCrashLocal", _x];
		} forEach crew _veh;

	}, [_veh]] call CBA_fnc_waitUntilAndExecute;

	// waits till ground is hit
	[{
		params ["_veh"];
		isTouchingGround _veh
	},
	{
		params ["_veh"];

		_veh setPos (getMarkerPos "mrk_crashSite");
		_veh attachTo [crashSite, [0,0,0]];

		[{
			params ["_veh"];
			count (crew _veh) < 1
		},{
			params ["_veh"];

			[_veh] call GRAD_survivableCrash_fnc_throwOutInventoryVehicle;

		}, [_veh]] call CBA_fnc_waitUntilAndExecute;

	}, [_veh]] call CBA_fnc_waitUntilAndExecute;

};