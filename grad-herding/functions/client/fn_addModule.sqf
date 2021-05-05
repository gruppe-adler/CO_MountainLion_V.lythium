["BERGLOEWE SHEPHERD", "Create Shepherd with Killtrigger", {

    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
    _position = ASLToAGL _position;
    [_position, 15, objNull, "Goat_random_F", true] remoteExec ["GRAD_herding_fnc_create", 2];

}] call zen_custom_modules_fnc_register;


["BERGLOEWE SHEPHERD", "Create normal Shepherd", {

    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
    _position = ASLToAGL _position;
    [_position, 15, objNull, "Goat_random_F", false] remoteExec ["GRAD_herding_fnc_create", 2];

}] call zen_custom_modules_fnc_register;


["BERGLOEWE SHEPHERD", "Create Sniper", {

    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
    _position = ASLToAGL _position;
    [_position] remoteExec ["GRAD_herding_fnc_createSniper", 2];

}] call zen_custom_modules_fnc_register;


["BERGLOEWE SHEPHERD", "Fill vehicle with Animals", {

    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
    [_objectUnderCursor] remoteExec ["GRAD_herding_fnc_fillWithAnimals", 2];

}] call zen_custom_modules_fnc_register;



["zen_remoteControlStarted", {
    params ["_unit"];

    if (!(_unit getVariable ["GRAD_isShepherd", false])) exitWith {};

    [_unit] call GRAD_herding_fnc_addGestureHandler;
}] call CBA_fnc_addEventhandler;


["ace_common_playActionNow", {
    params ["_unit", "_anim"];

    // dont do anything if not a shepherd
    if (!(_unit getVariable ["GRAD_isShepherd", false])) exitWith {};

    if (_anim isEqualTo "ace_gestures_point") then {
        private _target = screenToWorld [0.5, 0.5];
        _unit setVariable ["GRAD_HERDING_TARGET", _target, true];
        hint "directing herd to position";

        if (_unit getVariable ["GRAD_isShepherd_killTrigger", false]) then {
            ["GRAD_shepherd_gesture", [_unit]] call CBA_fnc_globalEvent;
        };
    };

    if (_anim isEqualTo "ace_gestures_regroup") then {
        private _target = position _unit;
        _unit setVariable ["GRAD_HERDING_TARGET", _target, true];
        hint "directing herd to me";

        if (_unit getVariable ["GRAD_isShepherd_killTrigger", false]) then {
            ["GRAD_shepherd_gesture", [_unit]] call CBA_fnc_globalEvent;
        };
    };

    if (_anim isEqualTo "ace_gestures_hold") then {
        private _target = position _unit;
        _unit setVariable ["GRAD_HERDING_TARGET", _target, true];
        hint "directing herd to me";

        if (_unit getVariable ["GRAD_isShepherd_killTrigger", false]) then {
            ["GRAD_shepherd_gesture", [_unit]] call CBA_fnc_globalEvent;
        };
    };

}] call CBA_fnc_addEventHandler;