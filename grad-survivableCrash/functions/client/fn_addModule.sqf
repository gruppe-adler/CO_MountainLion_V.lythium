["BERGLOEWE PHASECHANGE", "Crash closest Helicopter/Air Vehicle", {

    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    [crashheli] remoteExec ["GRAD_survivableCrash_fnc_onCrash", crashheli];

    missionNamespace setVariable ["GRAD_sandstorm_target", objNull, true];

}] call zen_custom_modules_fnc_register;

["BERGLOEWE PHASECHANGE", "Disable Engine of Object", {

    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    [_objectUnderCursor] remoteExec ["GRAD_survivableCrash_fnc_onDisable", 2];

}] call zen_custom_modules_fnc_register;


{
  [ _x, ["\A3\ui_f\data\map\markers\handdrawn\warning_CA.paa", [1,1,1,1], position crashSite, 1, 1, 0, "Crash Site", 1, 0.05, "TahomaB"], false ] call BIS_fnc_addCuratorIcon;
} forEach allCurators;