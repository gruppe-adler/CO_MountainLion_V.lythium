params ["_unit"];

if (!isNull objectParent _unit) exitWith { systemChat "works only for units on foot"; };

if (_unit getVariable ["GRAD_suicideBomber", false]) exitWith { systemChat "already is bomber"; };

private _explosives = [["Explosive",[0.0664063,0.123474,1.15262],[[-0.0383632,0.0932892,0.9949],[-0.989972,0.131913,-0.0505423]]],["Explosive",[0.0107422,0.132751,1.15182],[[-0.050483,0.0940509,0.994287],[-0.998722,-0.00697315,-0.0500486]]],["Explosive",[-0.0488281,0.136475,1.15055],[[-0.050483,0.0940509,0.994287],[-0.998722,-0.00697315,-0.0500486]]]];

{
  private _objectArray = _x;
  _objectArray params ["_type", "_offset", "_vectorDirAndUp"];

  private _explosive = _type createVehicle [0,0,0];
  _explosive attachTo [_unit, _offset];
  _explosive setVectorDirAndUp _vectorDirAndUp;

} forEach _explosives;


[_unit] remoteExecCall ["GRAD_suicideBomber_fnc_addAction", [0,-2] select isDedicated];

[{
    params ["_unit"];
    !alive _unit
},{
    params ["_unit"];
    private _position = position _unit;

    private _explosion = createVehicle ["ammo_ShipCannon_120mm_HE", _position, [], 0, "CAN_COLLIDE"];
    _explosion setDamage 1;
    _explosion setVelocity [0,0,-100];

    private _explosion2 = createVehicle ["Bo_Mk82", _position, [], 0, "CAN_COLLIDE"];
    _explosion2 setDamage 1;
    _explosion2 setVelocity [0,0,-100];

    [_position] remoteExec ["GRAD_missionControl_fnc_createBloodEffect", [0,-2] select isDedicated];
    
    // delete explosives
    {
      deleteVehicle _x;
    } forEach attachedObjects _unit;
    deleteVehicle _unit;

}, [_unit]] call CBA_fnc_waitUntilAndExecute;