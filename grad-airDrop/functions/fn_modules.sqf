["BERGLOEWE MISSION", "Airdrop here: Wiesel",
{
  // Get all the passed parameters
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
  _position = ASLToAGL _position;

  [_position, ["I_LT_01_cannon_F", "I_LT_01_cannon_F"]] remoteExecCall ["GRAD_airdrop_fnc_dropOnLocation", 2];

}] call zen_custom_modules_fnc_register;