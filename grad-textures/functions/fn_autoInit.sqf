// only server

if (!isServer) exitWith {};

grad_textures_fnc_clearCargo = {
    params ["_vehicle"];

    clearWeaponCargoGlobal _vehicle;
    clearMagazineCargoGlobal _vehicle;
    clearBackpackCargoGlobal _vehicle;
    clearItemCargoGlobal _vehicle;
};

["I_LT_01_cannon_F", "init", {

    params ["_vehicle"];

    _vehicle setObjectTextureGlobal [0, "grad-textures\data\TBW_Wiesel3_Main_Tropen_CO.paa"];
    _vehicle setObjectTextureGlobal [1, "grad-textures\data\TBW_Wiesel3_Cannon_Tropen_CO.paa"];

    [_vehicle] call grad_textures_fnc_clearCargo;

}, true, [], true] call CBA_fnc_addClassEventHandler;

["RHS_C130J", "init", {

    params ["_vehicle"];

    _vehicle setObjectTextureGlobal [0, "grad-textures\data\c130.paa"];
    _vehicle setObjectTextureGlobal [1, "grad-textures\data\c130_w.paa"];

    [_vehicle] call grad_textures_fnc_clearCargo;

}, true, [], true] call CBA_fnc_addClassEventHandler;


["gm_ge_army_iltis_mg3", "init", {

    params ["_vehicle"];

    [_vehicle] call grad_textures_fnc_clearCargo;

    [
        _vehicle,
        ["gm_ge_trp",1], 
        ["windshield",1,"doorBag_unhide",0,"beacon_01_org_unhide",0,"beacon_01_blu_unhide",0,"coldWeatherKit_unhide",0]
    ] call BIS_fnc_initVehicle;

}, true, [], true] call CBA_fnc_addClassEventHandler;

["gm_ge_army_iltis_cargo", "init", {

    params ["_vehicle"];

    [_vehicle] call grad_textures_fnc_clearCargo;

    [
        _vehicle,
        ["gm_ge_trp",1], 
        ["radio_01_unhide",1,"radio_02_unhide",0,"cover_hoops_unhide",0,"cover_doors_unhide",0,"windshield",1,"doorBag_unhide",0,"beacon_01_org_unhide",0,"beacon_01_blu_unhide",0,"coldWeatherKit_unhide",0]
    ] call BIS_fnc_initVehicle;

}, true, [], true] call CBA_fnc_addClassEventHandler;

["gm_ge_army_u1300l_cargo", "init", {

    params ["_vehicle"];
    
    [_vehicle] call grad_textures_fnc_clearCargo;

    [
        _vehicle,
        ["gm_ge_trp",1], 
        ["BoardWall_2_1_unhide",1,"cover_hoops_unhide",0,"cover_down_unhide",0,"cover_up_unhide",0,"BoardWall_1_1_extension_unhide",0,"camonetpoles_1_1_unhide",0,"camonetrack_unhide",0,"generator_unhide",0,"sign_mlc_unhide",0,"sign_medic_unhide",0]
    ] call BIS_fnc_initVehicle;

}, true, [], true] call CBA_fnc_addClassEventHandler;


["gm_ge_army_iltis_cargo", "init", {

    params ["_vehicle"];
    
    [_vehicle] call grad_textures_fnc_clearCargo;

    [
        _vehicle,
        ["gm_ge_trp_rc",1], 
        ["radio_01_unhide",1,"radio_02_unhide",0,"cover_hoops_unhide",0,"cover_doors_unhide",0,"windshield",1,"doorBag_unhide",0,"beacon_01_org_unhide",0,"beacon_01_blu_unhide",0,"coldWeatherKit_unhide",0]
    ] call BIS_fnc_initVehicle;

    private _crate = "ACE_medicalSupplyCrate_advanced" createVehicle [0,0,0];
    [_crate, _vehicle] call ace_cargo_fnc_loadItem;

}, true, [], true] call CBA_fnc_addClassEventHandler;