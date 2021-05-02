setDate [2015, 10, 06, 5.5, 0];


["Initialize", [true]] call BIS_fnc_dynamicGroups;


if (isMultiplayer) then {
	// [] spawn GRAD_introCam_fnc_init;
} else {
    [] spawn GRAD_introCam_fnc_init;
};


// [["mrk_ied_1", "mrk_ied_2", "mrk_ied_3"], 3, true] call GRAD_ambient_fnc_ied;

{
    _x setSkill ["aimingShake", 0.2];
    _x setSkill ["aimingSpeed", 0.9];
    _x setSkill ["endurance", 0.6];
    _x setSkill ["spotDistance", 1];
    _x setSkill ["spotTime", 0.9];
    _x setSkill ["courage", 1];
    _x setSkill ["reloadSpeed", 1];
    _x setSkill ["commanding", 1];
    _x setSkill ["general", 1];

    // [_x] call GRAD_missionControl_fnc_addApacheDestruction;

} forEach (allUnits - switchableUnits - playableUnits);




private _chairs = [
    chair_1,chair_2,chair_3,chair_4,chair_5,chair_6,chair_7,chair_8,chair_9,chair_10,chair_11,chair_12,chair_13,chair_14,chair_15,chair_16,chair_17,chair_18,chair_19,chair_20,chair_21,chair_22,chair_23,chair_24,chair_25,chair_26,chair_27,chair_28,chair_29,chair_30,chair_31,chair_32,chair_33,chair_34,chair_35,chair_36
];

private _counter = 0;
{
    if (_counter < ((count _chairs) - 1)) then {

        private _unit = _x;
        private _chair = _chairs select _counter;

        if (!((typeOf _unit) isEqualTo "B_Officer_F") && 
            !((typeOf _unit) isEqualTo "VirtualCurator_F") &&
            !((typeOf _unit) isEqualTo "ace_spectator_virtual") &&
            (!((side _unit) isEqualTo civilian))) then {
            _unit setVariable ["ml_id", _counter, true];
            _counter = _counter + 1;

            [{
            params ["_chair", "_unit"];
                if (!isPlayer _unit) then {
                    // _unit disableAI "MOVE";
                    [_chair, _unit] call acex_sitting_fnc_sit;
                };
            }, [_chair, _unit], random 3] call CBA_fnc_waitAndExecute;
        };        
    };
} forEach (playableUnits + switchableUnits);




// klamotten in 3cb fuzzi - trying to to fix with exclusion in description.ext

// suicide auto fährt nicht - trying to fix with server execution

// attach uav dings - disabled simulation

// build/remove wind slowly - should work now

// crash site tag remove on map -- no idea why this appears, maybe only zeus

// delete sandstorm marker
// removing local sandwall
// deleting sandstorm id

// kampfbrillen vs. sandsturm - aufsetzen zum wegmachen - testen + brillen hinzufügen

// connect detect fapper - should work
