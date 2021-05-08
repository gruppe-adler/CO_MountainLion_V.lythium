["BERGLOEWE PHASE II", "Make Unit Suicide Bomber",
{
    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
    [_objectUnderCursor] remoteExec ["grad_suicideBomber_fnc_makeBomber", 2];
}] call zen_custom_modules_fnc_register;