params ["_unit"];

if (_unit getVariable ["hasGestureHandler", false]) exitWith {
	diag_log "has alreayd gesture handler locally";
};

_unit setVariable ["hasGestureHandler", true];

["ace_common_playActionNow", {
	params ["_unit", "_anim"];

	if (_anim isEqualTo "ace_gestures_point") then {
		private _target = screenToWorld [0.5, 0.5];
		_unit setVariable ["GRAD_HERDING_TARGET", _target, true];
        systemChat "directing herd to position";

        missionNamespace setVariable ["GRAD_herding_targetFree", true, true];
	};

	if (_anim isEqualTo "ace_gestures_regroup") then {
		private _target = position _unit;
		_unit setVariable ["GRAD_HERDING_TARGET", _target, true];
        systemChat "directing herd to me";

        missionNamespace setVariable ["GRAD_herding_targetFree", true, true];
	};

	if (_anim isEqualTo "ace_gestures_hold") then {
		private _target = position _unit;
		_unit setVariable ["GRAD_HERDING_TARGET", _target, true];
        systemChat "directing herd to me";

        missionNamespace setVariable ["GRAD_herding_targetFree", true, true];
	};

}] call CBA_fnc_addEventHandler;