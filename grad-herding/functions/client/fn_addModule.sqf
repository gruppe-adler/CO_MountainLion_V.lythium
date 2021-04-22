["BERGLOEWE", "Create Shepherd", {
    
    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
    _position = ASLToAGL _position;
    [_position] remoteExec ["GRAD_herding_fnc_create", 2];

}] call zen_custom_modules_fnc_register;