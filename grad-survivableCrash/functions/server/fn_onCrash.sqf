params ["_veh"];


// runs where vehicle is local
if (!local _veh) exitWith {};

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
	// private _smoke = createVehicle ["test_EmptyObjectForSmoke", position _veh, [], 0, "CAN_COLLIDE"];
	// _smoke attachTo [_veh,[0,0,0],"motor"];
	[_veh, false] remoteExec ["allowDamage"];

	// hide BFT
	{
	  	_x setVariable ["ace_map_hideBlueForceMarker", true, true];
	} forEach crew _veh;


	[{
		params ["_veh"];
		getPos _veh select 2 < 30
	},{	
		params ["_veh"];
		// trigger ejection and effects on crew
		{
			[_x, _veh] remoteExecCall ["GRAD_survivableCrash_fnc_onCrashLocal", _x];
		} forEach crew _veh;

	}, [_veh]] call CBA_fnc_waitUntilAndExecute;

	// waits till ground is hit, stores travel vector
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

		// lets vehicle slide a bit
		/*
		private _velocityVeh = velocity _veh;
		private _dir = (_velocityVeh select 0) atan2 (_velocityVeh select 1);
		private _speed = 4 + random 2;

		_velocityVeh = [(sin _dir) * _speed * sqrt abs(_velocityVeh select 0),
			(cos _dir) * _speed * sqrt abs(_velocityVeh select 1),
			(1 + random 4) * sqrt(abs(_velocityVehPrev)) + .4 ];
		_veh setVelocity _velocityVeh;
		*/

	}, [_veh]] call CBA_fnc_waitUntilAndExecute;

};