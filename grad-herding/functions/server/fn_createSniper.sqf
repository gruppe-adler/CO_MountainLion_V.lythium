// [screenToWorld[0.5,0.5]] execVM "grad-herding\functions\server\fn_createSniper.sqf";

params ["_position"];

private _group = createGroup east;
private _unit = _group createUnit ["UK3CB_TKM_O_SNI", _position, [], 0, "NONE"];

removeAllWeapons _unit;
_unit disableAI "PATH";
_unit disableAI "AIMINGERROR";
_unit disableAI "AUTOTARGET";
_unit setUnitPos "DOWN";
_unit setSkill ["spotDistance", 1];
_unit setSkill ["spotTime",1];
_unit setSkill 1;
_unit addWeapon "srifle_LRR_F";
_unit addPrimaryWeaponItem "optic_KHS_blk";
_unit addMagazine "7Rnd_408_Mag";
_unit addMagazine "7Rnd_408_Mag";
_unit addMagazine "7Rnd_408_Mag";
_unit setBehaviour "CARELESS";
_unit setCombatMode "BLUE";
_group setVariable ["lambs_danger_disableAI", true, true];

missionNamespace setVariable ["GRAD_sniper", _unit, true];


["GRAD_shepherd_gesture", {
    params ["_shepherd"];

    private _unit = missionNamespace getVariable ["GRAD_sniper", objNull];
    _unit reveal _shepherd;
    _unit doTarget _shepherd;        
    _unit setBehaviour "AWARE";
    _unit setCombatMode "RED";
    _unit doTarget _shepherd;
    _unit doSuppressiveFire _shepherd;
    _unit fireAtTarget [_shepherd];

}] call CBA_fnc_addEventhandler;

["GRAD_shepherd_dead", {
    params ["_shepherd"];

    private _unit = missionNamespace getVariable ["GRAD_sniper", objNull];
    _unit enableAI "PATH";
    _unit enableAI "AIMINGERROR";
    _unit setBehaviour "CARELESS";
    _unit setSpeedMode "FULL";
    _unit doMove [0,0,0];

}] call CBA_fnc_addEventhandler;