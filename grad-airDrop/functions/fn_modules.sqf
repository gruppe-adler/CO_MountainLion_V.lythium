["BERGLOEWE PHASE II", "Airdrop here: Wiesel",
{
  // Get all the passed parameters
  params [["_positionASL", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  [_positionASL, ["I_LT_01_cannon_F", "I_LT_01_cannon_F"]] remoteExec ["GRAD_airdrop_fnc_dropOnLocation", 2];

}] call zen_custom_modules_fnc_register;


["BERGLOEWE PHASE II", "Airdrop here: Transport LKW",
{
  // Get all the passed parameters
  params [["_positionASL", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  [_positionASL, ["gm_ge_army_u1300l_cargo", "gm_ge_army_u1300l_cargo"]] remoteExec ["GRAD_airdrop_fnc_dropOnLocation", 2];

}] call zen_custom_modules_fnc_register;


["BERGLOEWE PHASE II", "Airdrop here: Iltis Transport",
{
  // Get all the passed parameters
  params [["_positionASL", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  [_positionASL, ["gm_ge_army_iltis_cargo", "gm_ge_army_iltis_cargo"]] remoteExec ["GRAD_airdrop_fnc_dropOnLocation", 2];

}] call zen_custom_modules_fnc_register;


["BERGLOEWE PHASE II", "Airdrop here: Iltis MG",
{
  // Get all the passed parameters
  params [["_positionASL", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  [_positionASL, ["gm_ge_army_iltis_mg3", "gm_ge_army_iltis_mg3"]] remoteExec ["GRAD_airdrop_fnc_dropOnLocation", 2];

}] call zen_custom_modules_fnc_register;


["BERGLOEWE PHASE II", "Airdrop here: Iltis Medical",
{
  // Get all the passed parameters
  params [["_positionASL", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  [_positionASL, ["gm_ge_army_iltis_cargo", "gm_ge_army_iltis_cargo"]] remoteExec ["GRAD_airdrop_fnc_dropOnLocation", 2];

}] call zen_custom_modules_fnc_register;


["BERGLOEWE PHASE II", "Airdrop here: Ammunition",
{
  // Get all the passed parameters
  params [["_positionASL", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  private _crate = call GRAD_airdrop_fnc_ammunitionCrate;
  [_positionASL, [], _crate] remoteExec ["GRAD_airdrop_fnc_dropOnLocation", 2];

}] call zen_custom_modules_fnc_register;