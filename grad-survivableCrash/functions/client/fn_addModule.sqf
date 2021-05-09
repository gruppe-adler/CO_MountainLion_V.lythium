["BERGLOEWE PHASECHANGE", "Crash closest Helicopter/Air Vehicle", {

    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    [crashheli] remoteExec ["GRAD_survivableCrash_fnc_onCrash", 2];

    missionNamespace setVariable ["GRAD_sandstorm_target", objNull, true];

}] call zen_custom_modules_fnc_register;

["BERGLOEWE PHASECHANGE", "Disable Engine of Object", {

    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    [_objectUnderCursor] remoteExec ["GRAD_survivableCrash_fnc_onDisable", 2];

}] call zen_custom_modules_fnc_register;



["BERGLOEWE PHASE I", "Disallow Damage", {

    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    [_objectUnderCursor, false] remoteExec ["allowDamage", _objectUnderCursor];

}] call zen_custom_modules_fnc_register;

["BERGLOEWE PHASE I", "Allow Damage", {

    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    [_objectUnderCursor, true] remoteExec ["allowDamage", _objectUnderCursor];

}] call zen_custom_modules_fnc_register;
