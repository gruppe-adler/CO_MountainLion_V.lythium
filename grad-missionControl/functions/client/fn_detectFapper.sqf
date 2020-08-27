["ace_interactMenuOpened", {
    
    private _target = cursorObject;

    if  (
                _target isKindOf "Man" && 
                { _target == missionNamespace getVariable ["ML_alShishani", objNull]} && 
                {!(missionNamespace getVariable ["ML_alShishani_loopEnd", false])}
        ) then {
            missionNamespace setVariable ["ML_alShishani_loopEnd", true, true];
    };

}] call CBA_fnc_addEventHandler;