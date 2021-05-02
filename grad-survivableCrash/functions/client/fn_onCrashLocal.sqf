params ["_unit"];


// [_unit, 0.5] call ace_medical_fnc_adjustPainLevel;
[_unit, true, 3 + random 30] call ace_medical_fnc_setUnconscious;
_unit allowDamage false;


playSound "vehicle_collision";
playSound "vehicle_drag_end";
playSound "vehicle_dragging";

_unit unassignItem "itemmap";_unit removeItem "itemmap";
_unit unassignItem "itemgps";_unit removeItem "itemgps";
_unit unlinkItem "itemRadio";

// [] call GRAD_survivableCrash_fnc_disableRadio;
[_unit] call GRAD_survivableCrash_fnc_disableBFT;
	
if (_unit == player) then {
	addCamShake [10, 2, 15];
};


[{
	params ["_unit"];
	_alt = getPosATL _unit select 2;
	_speed = vectorMagnitude velocity _unit;
	_alt < 2 or _speed < .5
},{
	params ["_unit"];

	_unit action ["eject", vehicle _unit];
	if (vehicle _unit != _unit) then {
		moveOut _unit;
	};
	private _position = (getPosATL _unit) findEmptyPosition [5,50,typeOf _unit];
	_unit setPos _position;
	_unit switchMove "";
	_unitVelocity = velocity _unit;
	_unit setVelocity [0,0,0];

	addCamShake [5, 1, 15];

	
	[{
		params ["_unit"];
		isTouchingGround _unit
	},
	{
		params ["_unit"];

		[_unit, _unit] call ace_medical_fnc_treatmentAdvanced_fullHealLocal; // remove ace damage

		private _cause = ["vehiclecrash", "explosive"] select (round random 1); // add own damage
		[_unit, random [.3, .7, 1], selectRandom ["head", "body", "hand_l", "hand_r", "leg_l", "leg_r"], _cause] call ace_medical_fnc_addDamageToUnit;
		
		[_unit] execVM "grad-survivableCrash\functions\server\fn_throwOutInventoryUnit.sqf";

		[{
			params ["_unit"];

			_unit allowDamage true;
			[_unit, false] call ace_medical_fnc_setUnconscious;
			cutText [" ", "BLACK IN", 5];
			[player, "Acts_UnconsciousStandUp_part1"] remoteExecCall ["switchMove", 0];

		}, [_unit], 2 + random 15] call CBA_fnc_waitAndExecute;

	}, [_unit]] call CBA_fnc_waitUntilAndExecute;

}, [_unit]] call CBA_fnc_waitUntilAndExecute;