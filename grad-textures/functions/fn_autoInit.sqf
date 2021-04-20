if (!isServer) exitWith {};

["I_LT_01_cannon_F", "init", {
    
    params ["_vehicle"]; 

    _vehicle setObjectTextureGlobal [0, "grad-textures\data\TBW_Wiesel3_Main_Tropen_CO.paa"];
    _vehicle setObjectTextureGlobal [1, "grad-textures\data\TBW_Wiesel3_Cannon_Tropen_CO.paa"];

}] call CBA_fnc_addClassEventHandler;

["RHS_C130J (c130)", "init", {
    
    params ["_vehicle"]; 

    _vehicle setObjectTextureGlobal [0, "grad-textures\data\c130.paa"];
    _vehicle setObjectTextureGlobal [1, "grad-textures\data\c130_w.paa"];

}] call CBA_fnc_addClassEventHandler;
