/*
    test with: [cursorTarget] execVM "grad-survivableCrash\functions\server\fn_throwOutInventoryUnit.sqf";
*/

params ["_unit"];

private _items = items _unit;
private _primaryWeaponItems = primaryWeaponItems _unit;
private _primaryWeapon = primaryWeapon _unit;
private _magazines = magazines _unit;
private _backpack = backpack _unit;

private _position = position _unit;
private _radius = 4;
private _chance = 100;


{
    if (random _chance > 1) then {
        private _holder = [_position, _radius] call GRAD_survivableCrash_fnc_spawnHolder;
        _holder addItemCargoGlobal [_x, 1];
        _unit removeItem _x;
        diag_log "dropping item";
    };
} forEach _items;

{
    if (random _chance > 1) then {
        private _holder = [_position, _radius] call GRAD_survivableCrash_fnc_spawnHolder;
        _unit action ["dropMagazine", _holder, _x];
        diag_log "dropping mag";
    };
} forEach _magazines;


if (random _chance > 1) then {
    private _holder = [_position, _radius] call GRAD_survivableCrash_fnc_spawnHolder;
    _unit action ["DropWeapon", _holder, currentWeapon player];
    diag_log "dropping wep";
};


if (random _chance > 1) then {
    private _holder = [_position, _radius] call GRAD_survivableCrash_fnc_spawnHolder;
    _unit action ["DropBag", _holder, typeOf unitBackpack player];
    diag_log "dropping bag";
};