["BERGLOEWE MISSION", "Airdrop here: Wiesel",
{
  // Get all the passed parameters
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
  _position = ASLToAGL _position;

  [_position, ["I_LT_01_cannon_F", "I_LT_01_cannon_F"]] remoteExecCall ["GRAD_airdrop_fnc_dropOnLocation", 2];

}] call zen_custom_modules_fnc_register;


["BERGLOEWE MISSION", "Airdrop here: Transport LKW",
{
  // Get all the passed parameters
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
  _position = ASLToAGL _position;

  [_position, ["gm_ge_army_u1300l_cargo", "gm_ge_army_u1300l_cargo"]] remoteExecCall ["GRAD_airdrop_fnc_dropOnLocation", 2];

}] call zen_custom_modules_fnc_register;

["BERGLOEWE MISSION", "Airdrop here: Iltis Transport",
{
  // Get all the passed parameters
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
  _position = ASLToAGL _position;

  [_position, ["gm_ge_army_iltis_cargo", "gm_ge_army_iltis_cargo"]] remoteExecCall ["GRAD_airdrop_fnc_dropOnLocation", 2];

}] call zen_custom_modules_fnc_register;

["BERGLOEWE MISSION", "Airdrop here: Iltis MG",
{
  // Get all the passed parameters
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
  _position = ASLToAGL _position;

  [_position, ["gm_ge_army_iltis_mg3", "gm_ge_army_iltis_mg3"]] remoteExecCall ["GRAD_airdrop_fnc_dropOnLocation", 2];

}] call zen_custom_modules_fnc_register;