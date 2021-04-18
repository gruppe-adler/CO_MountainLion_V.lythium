/*

    test with execVM "grad-survivableCrash\functions\client\fn_disableRadio.sqf";

*/



["BreakRadio", "onBeforeTangent", {
    _unit = _this select 0;
    _button = _this select 4;

    hint "Your radio is broken";

    if (_button) then {
        player setVariable ["tf_unable_to_use_radio", true];
    } else {
        player setVariable ["tf_unable_to_use_radio", false];
    };
    
}] call TFAR_fnc_addEventHandler;