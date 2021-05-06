// NOT USED ANYMORE

/*
grad_airDrop_fnc_canLoad = {
    params ["_unit"];

    private _C130isCloseAndEmpty = objNull;
    private _nearestObject = nearestObject [_unit, "Air"];
    if (_nearestObject isKindOf "RHS_C130J" && _nearestObject getVariable ["vehicleCount", 0] < 2) then {
        _C130isCloseAndEmpty = _nearestObject;
    };

    _C130isCloseAndEmpty
};


["Car", "init", {
    
    params ["_vehicle"];

    _vehicle enableVehicleCargo false; 

    _vehicle addaction ["<t color=""#66ff66"">Load in C130</t>",{ 
        params ["_target", "_caller", "_actionId", "_arguments"];
        [_target] call grad_airDrop_fnc_load;
    },[0],1,false,true,"","!isNull ([_target] call grad_airDrop_fnc_canLoad); (_target distance _this) < 10"];    

}] call CBA_fnc_addClassEventHandler;

// disable native ViV
["Air", "init", {
    
    params ["_vehicle"];

    _vehicle enableVehicleCargo false;  

}] call CBA_fnc_addClassEventHandler;

*/

["gm_ge_airforce_do28d2", "init", {
    
    params ["_vehicle"];

    _vehicle addaction ["<t color=""#66ff66"">Eject</t>",{ 
        params ["_target", "_caller", "_actionId", "_arguments"];

        player action ["Eject", vehicle player];

    },[0],1,false,true,"","_this in crew _target && _this != driver _target"];  

}, true, [], true] call CBA_fnc_addClassEventHandler;