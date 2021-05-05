params ["_unit"];

cutText [" ", "BLACK", 0.001];

// [_unit, 0.5] call ace_medical_fnc_adjustPainLevel;
[_unit, true] call ace_medical_fnc_setUnconscious;

0 fadeSpeech 2;
playSound ["vehicle_collision", true];
playSound ["vehicle_drag_end", true];
playSound ["vehicle_dragging", true];

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
	vehicle _unit distance2d crashSite < 10
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

		// [_unit, _unit] call ace_medical_fnc_treatmentAdvanced_fullHealLocal; // remove ace damage
		[player, player] call ace_medical_treatment_fnc_fullHeal;
		[_unit, true] call ace_medical_fnc_setUnconscious;

		private _injuredBodyPart = ["Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg"] selectRandomWeighted [0.3, 0.1, 0.2, 0.2, 0.3, 0.3];
        private _currentUnitDamage = _unit getHitpointDamage _injuredBodyPart;
        private _damageAmount = (_currentUnitDamage + random 1) max (_currentUnitDamage + 0.1);
		[_unit, _damageAmount, _injuredBodyPart, "shell", objNull] call ace_medical_fnc_addDamageToUnit;
		
		[_unit] execVM "grad-survivableCrash\functions\server\fn_throwOutInventoryUnit.sqf";

		[{
			params ["_unit"];

			_unit allowDamage true;
			[_unit, false] call ace_medical_fnc_setUnconscious;
			cutText [" ", "BLACK IN", 5];

			["DynamicBlur", 400, [10]] spawn 
			   { 
			    params ["_name", "_priority", "_effect", "_handle"]; 
			    private _handle = ppEffectCreate [_name, [10]]; 
			    _handle ppEffectEnable true; 
			    _handle ppEffectAdjust [10]; 
			    _handle ppEffectCommit 0; _handle ppEffectAdjust [0]; 
			    _handle ppEffectCommit 5; 

			    waitUntil {ppEffectCommitted _handle}; 
			    uiSleep 5; 
			    _handle ppEffectEnable false; 
			    ppEffectDestroy _handle; 
			   };

			[player, "Acts_UnconsciousStandUp_part1"] remoteExecCall ["switchMove", 0];

		}, [_unit], 5 + random 15] call CBA_fnc_waitAndExecute;

	}, [_unit]] call CBA_fnc_waitUntilAndExecute;

}, [_unit]] call CBA_fnc_waitUntilAndExecute;