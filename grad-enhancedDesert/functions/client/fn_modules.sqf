["BERGLOEWE PHASECHANGE", "Toggle GRAD_enhancedDesert", {

    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    GRAD_enhancedDesert_ACTIVE = !GRAD_enhancedDesert_ACTIVE;
    publicVariable "GRAD_enhancedDesert_ACTIVE";

    private _state = ["ACTIVE", "INACTIVE"] select GRAD_enhancedDesert_ACTIVE;
    systemChat ("GRAD_enhancedDesert is now " + _state); 

}] call zen_custom_modules_fnc_register;