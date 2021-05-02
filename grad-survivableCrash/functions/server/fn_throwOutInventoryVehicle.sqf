/*
	test with: [cursorTarget] execVM "grad-survivableCrash\functions\server\fn_throwOutInventory.sqf";
*/

params ["_veh"];

private _items = ItemCargo _veh;
private _magazines = MagazineCargo _veh;
private _weapons = WeaponCargo _veh;
private _backpacks = BackpackCargo _veh;

private _position = position _veh;
private _radius = 15;
private _chance = 2;


{
	if (random _chance > 1) then {
		private _holder = [_position, _radius] call GRAD_survivableCrash_fnc_spawnHolder;
	 	_holder addItemCargoGlobal [_x, 1];
	 	_veh removeItem _x;
	};
} forEach _items;

{
	if (random _chance > 1) then {
	 	private _holder = [_position, _radius] call GRAD_survivableCrash_fnc_spawnHolder;
	 	_holder addMagazineCargoGlobal [_x, 1];
	 	_veh removeItem _x;
	};
} forEach _magazines;

{
	if (random _chance > 1) then {
	 	private _holder = [_position, _radius] call GRAD_survivableCrash_fnc_spawnHolder;
	 	_holder addWeaponCargoGlobal [_x, 1];
	 	_veh removeItem _x;
	};
} forEach _weapons;

{
	if (random _chance > 1) then {
	 	private _holder = [_position, _radius] call GRAD_survivableCrash_fnc_spawnHolder;
	 	_holder addBackpackCargoGlobal [_x, 1];
	 	_veh removeItem _x;
	};
} forEach _backpacks;


deleteVehicle _veh;