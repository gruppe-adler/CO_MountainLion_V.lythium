["CBA_loadingScreenDone", {
    GRAD_SANDSTORM_DEBUG = if ((allCurators findIf {getAssignedCuratorUnit _x == player}) != -1) then { true } else { false };
}] call CBA_fnc_addEventHandler;