//by Persian MO
//add below code in vehicle init
//this addaction ["<t color=""#ff0000"">Load in airDroper</t>","tfi_load.sqf",[0],1,false,true,"","(_target distance _this) < 10"];

/*
    this addaction ["<t color=""#ff0000"">Load in airDroper</t>",{ [(_this select 0)] call grad_airDrop_fnc_load },[0],1,false,true,"","(_target distance _this) < 10"];
*/

params ["_vehicle"];
private _plane = nearestObject [_vehicle, "Air"];

if (isNull _plane) exitWith { hint "no Plane found or full"; };

private _name = getText (configFile >> "cfgVehicles" >> typeOf _vehicle >> "displayName");
private _display = format ["<t color=""#FF6666"">" + "Drop %1" +"</t>", _name];

_plane addAction [_display, {
    params ["_target", "_caller", "_actionId", "_arguments"];
    _arguments params ["_vehicle"];

    [_target, _vehicle, _actionId] call grad_airDrop_fnc_drop;

}, [_vehicle], 5, true, true, "driver vehicle _this isEqualTo _this && (getPos (vehicle _this) select 2) > 20", "true"]; 


private _vehicleCount = _plane getVariable ["vehicleCount", 0];
_plane setVariable ["vehicleCount", _vehicleCount + 1, true];

private _attachPosition = if (_vehicleCount < 1) then { [0.0727539,5.8125,-2.32447] } else { [-0.0366211,0.517578,-2.32434] };
_vehicle attachTo [_plane, _attachPosition];

