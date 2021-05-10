params ["_vehicle"];


if (_vehicle isKindOf "I_LT_01_cannon_F") then { 

    _vehicle setObjectTextureGlobal [0, "grad-textures\data\TBW_Wiesel3_Main_Tropen_CO.paa"];
    _vehicle setObjectTextureGlobal [1, "grad-textures\data\TBW_Wiesel3_Cannon_Tropen_CO.paa"];       
}; 

if (_vehicle isKindOf "gm_ge_army_iltis_mg3") then { 
     [
        _vehicle,
        ["gm_ge_trp",1], 
        ["windshield",1,"doorBag_unhide",0,"beacon_01_org_unhide",0,"beacon_01_blu_unhide",0,"coldWeatherKit_unhide",0]
    ] call BIS_fnc_initVehicle;
}; 

if (_vehicle isKindOf "gm_ge_army_iltis_cargo") then { 
      [
        _vehicle,
        ["gm_ge_trp",1], 
        ["radio_01_unhide",1,"radio_02_unhide",0,"cover_hoops_unhide",0,"cover_doors_unhide",0,"windshield",1,"doorBag_unhide",0,"beacon_01_org_unhide",0,"beacon_01_blu_unhide",0,"coldWeatherKit_unhide",0]
    ] call BIS_fnc_initVehicle;
}; 

if (_vehicle isKindOf "gm_ge_army_u1300l_cargo") then { 
      [
        _vehicle,
        ["gm_ge_trp",1], 
        ["BoardWall_2_1_unhide",1,"cover_hoops_unhide",0,"cover_down_unhide",0,"cover_up_unhide",0,"BoardWall_1_1_extension_unhide",0,"camonetpoles_1_1_unhide",0,"camonetrack_unhide",0,"generator_unhide",0,"sign_mlc_unhide",0,"sign_medic_unhide",0]
    ] call BIS_fnc_initVehicle;
}; 

if (_vehicle isKindOf "gm_ge_army_iltis_cargo_des_rc") then { 
      [
        _vehicle,
        ["gm_ge_trp_rc",1], 
        ["radio_01_unhide",1,"radio_02_unhide",0,"cover_hoops_unhide",0,"cover_doors_unhide",0,"windshield",1,"doorBag_unhide",0,"beacon_01_org_unhide",0,"beacon_01_blu_unhide",0,"coldWeatherKit_unhide",0]
    ] call BIS_fnc_initVehicle;

     ["ACE_medicalSupplyCrate_advanced", _vehicle] call ace_cargo_fnc_loadItem;
}; 


[_vehicle] call grad_textures_fnc_clearCargo;
