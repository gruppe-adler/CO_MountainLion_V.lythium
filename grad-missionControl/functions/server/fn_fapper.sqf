params ["_unit", ["_chair", objNull]];

if (!isServer) exitWith {};
    
_unit disableAI "ALL";
_unit enableAI "ANIM";

[_unit, "HubSittingChairC_idle1"] remoteExec ["switchMove", 0]; 
[_unit, "AlShishani"] remoteExec ["setIdentity", 0, true];

missionNamespace setVariable ["ML_alShishani", _unit, true];

_unit addEventHandler ["AnimDone", {
    params ["_unit"];

    if (missionNamespace getVariable ["ML_alShishani_loopEnd", false]) exitWith {
        if (!(_unit getVariable ["ACE_captives_isHandcuffed",false])) then {
            _unit playMoveNow "AmovPercMstpSnonWnonDnon_Scared2";
        };
    };

    if (!alive _unit) exitWith {
        _unit removeEventHandler ["AnimDone", _thisEventHandler];
        //hint "removed";
    };

    [_unit, "HubSittingChairC_idle1"] remoteExec ["switchMove", 0]; 
}];

_unit addMPEventHandler ["MPHit", {
    params ["_unit"];

    _unit removeAllEventHandlers "AnimDone";    
    _unit removeAllMPEventHandlers "MPHit";
    _unit setDamage 1;
}];

// if (isServer) then { _unit attachTo [_chair] };