params ["_unit", ["_chair", objNull]];

if (!isServer) exitWith {};
_unit setVariable ["BIS_enableRandomization", false];
_unit disableAI "ALL";
_unit enableAI "ANIM";

[_unit, "HubSittingChairC_idle1"] remoteExec ["switchMove", 0]; 
[_unit, "AlShishani"] remoteExec ["setIdentity", 0, true];

missionNamespace setVariable ["ML_alShishani", _unit, true];

_unit addEventHandler ["AnimDone", {
    params ["_unit"];

    if (!alive _unit) exitWith {
        _unit removeEventHandler ["AnimDone", _thisEventHandler];
    };

    [_unit, "HubSittingChairC_idle1"] remoteExec ["switchMove", 0]; 
}];

_unit addMPEventHandler ["MPHit", {
    params ["_unit"];

    if (local _unit) then {
        _unit removeAllEventHandlers "AnimDone";    
        _unit removeAllMPEventHandlers "MPHit";
        _unit setDamage 1;
    };
}];


["GRAD_missionControl_fapperTouched", {
    params ["_fapper"];

    if (_fapper getVariable ["fapperTouched", false]) exitWith {};
    _fapper setVariable ["fapperTouched", true];

    [_fapper, "Acts_CivilHiding_1"] remoteExec ["switchMove", 0];
    _fapper enableAI "ALL";
    _fapper removeAllEventHandlers "AnimDone";    
}] call CBA_fnc_addEventhandler;

// if (isServer) then { _unit attachTo [_chair] };