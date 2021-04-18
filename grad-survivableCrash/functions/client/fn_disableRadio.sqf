/*

    test with execVM "grad-survivableCrash\functions\client\fn_disableRadio.sqf";

*/

player setVariable ["tf_sendingDistanceMultiplicator", 10000];
player setVariable ["tf_receivingDistanceMultiplicator", 0.0001];

["BreakRadio", "onBeforeTangent", {
    _unit = _this select 0;
    _button = _this select 4;


    if (_button) then {
        hint "Your radio is broken";    
    };
    
}] call TFAR_fnc_addEventHandler;