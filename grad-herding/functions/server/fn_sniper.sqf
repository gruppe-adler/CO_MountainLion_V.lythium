params ["_unit"];

if (!isServer) exitWith {};

_unit disableAI "PATH";
_unit setUnitPos "DOWN";
_unit setSkill ["spotDistance", 1];
_unit setSkill ["spotTime",1];
_unit addPrimaryWeaponItem "rhs_acc_1pn34";
_unit setBehaviour "CARELESS";
_unit setCombatMode "BLUE";

[{
    missionNamespace getVariable ["GRAD_herding_targetFree", false]
},{
    params ["_unit"];

    [{
        private _currentIndex = (missionNamespace getVariable ["GRAD_herding_instanceCount", 0]);
        private _instanceString = format ["GRAD_herding_instance_%1", _currentIndex];
        private _herd = missionNamespace getVariable [_instanceString, []];
        _unit setBehaviour "AWARE";
        _unit setCombatMode "RED";

        _herd params ["_shepherd"];
        _unit reveal _shepherd;
        _unit doTarget _shepherd;
        _unit fireAtTarget [_shepherd];
    }, [_unit], 5] call CBA_fnc_waitAndExecute;

},[_unit]] call CBA_fnc_waitUntilAndExecute;