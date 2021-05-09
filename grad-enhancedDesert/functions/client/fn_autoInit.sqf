["LandVehicle", "init", {

    params ["_vehicle"];

    // every client
    [_vehicle] call GRAD_enhancedDesert_fnc_addEmitter;

}] call CBA_fnc_addClassEventHandler;

if (isServer) then {
	GRAD_enhancedDesert_ACTIVE = false; publicVariable "GRAD_enhancedDesert_ACTIVE";
};
