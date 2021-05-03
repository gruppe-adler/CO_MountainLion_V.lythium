params ["_source", "_positionOrObject", ["_createDummy", true]];

private _posFinal = _positionOrObject;

if (!_createDummy) then {
    _posFinal = getPos _positionOrObject;
    // systemChat "isObject";
};

private _helper = _positionOrObject;

if (_createDummy) then {
    _helper = "Sign_Sphere25cm_Geometry_F" createVehicle [0,0,0];
    _helper setPos _posFinal;
    _helper setObjectTextureGlobal [0,"#(argb,8,8,3)color(0,0,0,0,ca)"];
    _helper setVariable ["soundSource", _source, true];
} else {
    _helper setVariable ["soundSource", _source, true];
};

{
    _x addCuratorEditableObjects [[_helper], false];
} forEach allCurators;

_helper addEventHandler ["Deleted", {
  params ["_entity"];
  deleteVehicle (_entity getVariable ["soundSource", objNull]);
}];

_helper addMPEventHandler ["MPHit", {
  (_this select 0) params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect"];
  
  private _pos = getPos _target;
  deleteVehicle (_target getVariable ["soundSource", objNull]);

  [_target] remoteExecCall ["homecoming_fnc_brokenRadio", 0, true];

}];

if (!_createDummy) then {
    _helper addMPEventHandler ["MPKilled", {
        params ["_entity"];
        deleteVehicle (_entity getVariable ["soundSource", objNull]);
    }];

    [{
        params ["_args", "_handle"];
        _args params ["_positionOrObject", "_source"];

        if (isNull _source || isNull _positionOrObject) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
        };

        // systemChat ("move sound pos to " + str _positionOrObject);

        _source setPos getPos _positionOrObject;

    },0.5,[_positionOrObject, _source]] call CBA_fnc_addPerFrameHandler;
};

_helper