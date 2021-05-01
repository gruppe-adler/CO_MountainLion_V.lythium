["BERGLOEWE MISSION", "Create Shepherd with Killtrigger", {

    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
    _position = ASLToAGL _position;
    [_position, 15, objNull, "Goat_random_F", true] remoteExec ["GRAD_herding_fnc_create", 2];

}] call zen_custom_modules_fnc_register;


["BERGLOEWE MISSION", "Create normal Shepherd", {

    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
    _position = ASLToAGL _position;
    [_position, 15, objNull, "Goat_random_F", false] remoteExec ["GRAD_herding_fnc_create", 2];

}] call zen_custom_modules_fnc_register;
