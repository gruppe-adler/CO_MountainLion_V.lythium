// only server

grad_textures_fnc_clearCargo = {
    params ["_vehicle"];

    clearWeaponCargoGlobal _vehicle;
    clearMagazineCargoGlobal _vehicle;
    clearBackpackCargoGlobal _vehicle;
    clearItemCargoGlobal _vehicle;
};


["RHS_C130J", "init", {

    params ["_vehicle"];
    
    [{
        params ["_vehicle"];
        _vehicle setObjectTextureGlobal [0, "grad-textures\data\c130.paa"];
        _vehicle setObjectTextureGlobal [1, "grad-textures\data\c130_w.paa"];

        [_vehicle] call grad_textures_fnc_clearCargo;

    }, [_vehicle], 5] call CBA_fnc_waitAndExecute;

}, true, [], true] call CBA_fnc_addClassEventHandler;

