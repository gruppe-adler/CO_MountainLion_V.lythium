[] call GRAD_missionControl_fnc_setMyFrequency;
[] call GRAD_missionControl_fnc_addModules;

["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;
player addEventHandler ["HandleRating", {0}];

["CBA_loadingScreenDone", {
    if (!(typeOf player isEqualTo "B_officer_F") && (!(side player isEqualTo civilian))) then {
        private _myID = player getVariable ["ml_id", 0];
        private _chairsLocal = [
            chair_1,chair_2,chair_3,chair_4,chair_5,chair_6,chair_7,chair_8,chair_9,chair_10,chair_11,chair_12,chair_13,chair_14,chair_15,chair_16,chair_17,chair_18,chair_19,chair_20,chair_21,chair_22,chair_23,chair_24,chair_25,chair_26,chair_27,chair_28,chair_29,chair_30,chair_31,chair_32,chair_33,chair_34,chair_35,chair_36
        ];
        private _chair = _chairsLocal#_myID;
        [_chair, player] call acex_sitting_fnc_sit;
    };

    if (typeOf player isEqualTo "B_officer_F") then {
        player action ["SwitchWeapon", player, player, 100];
    };
}] call CBA_fnc_addEventHandler;