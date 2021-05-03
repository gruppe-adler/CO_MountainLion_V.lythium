["ace_interactMenuOpened", {
    
    private _target = cursorObject;

    if  (
                _target isKindOf "Man" && 
                { _target == missionNamespace getVariable ["ML_alShishani", objNull]}
        ) then {
            ["GRAD_missionControl_fapperTouched", [_target]] call CBA_fnc_serverEvent;
    };

}] call CBA_fnc_addEventHandler;