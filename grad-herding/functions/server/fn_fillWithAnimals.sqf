params ["_vehicle"];

if (!(_vehicle isKindOf "Car")) exitWith { "not a car" call BIS_fnc_log; };

if (!local _vehicle) exitWith {
    [_vehicle] remoteExec ["GRAD_herding_fnc_fillWithAnimals", _vehicle];
};

private _animalClassName = "Sheep_Random_F";

private _spaces = [_vehicle, _animalClassName] call grad_animalTransport_common_fnc_findSuitableSpaces;

if (count _spaces == 0) exitWith {};

    for "_i" from 0 to ((floor random count _spaces) + 1) do {
    private _a = createAgent [_animalClassName, [0, 0, 0], [], 5, "CAN_COLLIDE"];
    [_vehicle, _a] call grad_animalTransport_common_fnc_vehicle_loadAnimal;
    [
        {
            _this setVariable ["ace_dragging_canCarry", false, true];
        },
        _a,
        5
    ] call CBA_fnc_waitAndExecute;
};