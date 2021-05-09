call compile preprocessfile "node_modules\shk_pos\functions\shk_pos_init.sqf";

enableSentences false;
["BLU_F", "BwTrop"] call GRAD_Loadout_fnc_FactionSetLoadout;
["BLU_T_F", "KSK"] call GRAD_Loadout_fnc_FactionSetLoadout;