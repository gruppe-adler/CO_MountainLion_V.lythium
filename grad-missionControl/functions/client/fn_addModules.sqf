
waitUntil {!isNull player};
waitUntil {  time > 3 };

{


    _x addEventHandler ["CuratorGroupPlaced", {
        params ["", "_group"];
        ["GRAD_missionControl_setServerAsOwner", [_group]] call CBA_fnc_serverEvent;

        {
            _x setSkill ["aimingShake", 0.2];
            _x setSkill ["aimingSpeed", 0.9];
            _x setSkill ["endurance", 0.6];
            _x setSkill ["spotDistance", 1];
            _x setSkill ["spotTime", 0.9];
            _x setSkill ["courage", 1];
            _x setSkill ["reloadSpeed", 1];
            _x setSkill ["commanding", 1];
            _x setSkill ["general", 1];

            [_x] call GRAD_missionControl_fnc_addApacheDestruction;

        } forEach units _group;
    }];

    _x addEventHandler ["CuratorObjectPlaced", {
        params ["", "_object"];


        _object setSkill ["aimingShake", 0.2];
        _object setSkill ["aimingSpeed", 0.9];
        _object setSkill ["endurance", 0.6];
        _object setSkill ["spotDistance", 1];
        _object setSkill ["spotTime", 0.9];
        _object setSkill ["courage", 1];
        _object setSkill ["reloadSpeed", 1];
        _object setSkill ["commanding", 1];
        _object setSkill ["general", 1];



        if (_object isKindOf "CAManBase") then {
            if (count units _object == 1) then {
                ["GRAD_missionControl_setServerAsOwner", [group _object]] call CBA_fnc_serverEvent;
                [_object] call GRAD_missionControl_fnc_addApacheDestruction;
            };
        } else {
            if (count crew _object > 1) then {
                ["GRAD_missionControl_setServerAsOwner", [group (crew _object select 0)]] call CBA_fnc_serverEvent;
            };
        };
    }];



  _x addEventHandler ["CuratorWaypointPlaced", {
      params ["_curator", "_group", "_waypointID"];

  if (missionNamespace getVariable ["GRAD_MISSIONCONTROL_ZEUS_AI_CHARGE", false]) then {

        [_group, _waypointID] remoteExec ["GRAD_missionControl_fnc_enableChargeMode", 2];
  };

  }];
} forEach allCurators;




["BERGLOEWE MISSION", "Start Kaffeefahrt",
{
  remoteExec ["grad_missionControl_fnc_startKaffeefahrt", 2];

}] call zen_custom_modules_fnc_register;

["BERGLOEWE MISSION", "Start SuicideCar",
{
  remoteExec ["grad_missionControl_fnc_suicideCar", 2];

}] call zen_custom_modules_fnc_register;



["BERGLOEWE HELPERS", "Alert enemy AI around here",
{
  // Get all the passed parameters
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  _position = ASLToAGL _position;

  [_position] spawn GRAD_missionControl_fnc_alertUnits;

}] call zen_custom_modules_fnc_register;


["BERGLOEWE HELPERS", "Toggle AI Charging",
{
  private _current = missionNamespace getVariable ["GRAD_MISSIONCONTROL_ZEUS_AI_CHARGE", false];
  missionNamespace setVariable ["GRAD_MISSIONCONTROL_ZEUS_AI_CHARGE", !_current, true];

  hint format ["AI CHARGE: %1", !_current];

}] call zen_custom_modules_fnc_register;


["BERGLOEWE MUSIC", "Outro Music",
{
  [5, 1] remoteExec ["fadeMusic"];
  ["outro"] remoteExec ["playMusic"];
}] call zen_custom_modules_fnc_register;



["BERGLOEWE HELPERS", "Weaponize Civ Vehicle Crew",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];


  if (isNull _objectUnderCursor) exitWith {
      hint "no vehicle selected";
  };

  [_objectUnderCursor] call GRAD_missionControl_fnc_weaponizeVehicle;

}] call zen_custom_modules_fnc_register;
