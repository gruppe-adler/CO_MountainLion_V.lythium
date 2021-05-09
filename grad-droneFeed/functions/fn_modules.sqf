
["zen_curatorDisplayLoaded", {
    params ["_display"];

    [] call GRAD_droneFeed_fnc_droneFeedReset;

    // execute once only
    if (missionNamespace getVariable ["IconsAdded", false]) exitWith { "done before" call BIS_fnc_log; };
    missionNamespace setVariable ["IconsAdded", true];

    private _allIcons = missionNamespace getVariable ["GRAD_CURATORICONS", []];

    {
        private _icon = _x;
        _icon set [0, getAssignedCuratorLogic player];
        _icon call BIS_fnc_addCuratorIcon;
    } forEach _allIcons;

}] call CBA_fnc_addEventhandler;

["GRAD_droneFeed_pipChange", {
    params ["_effect", "_screen"];

    [_effect, _screen] call GRAD_droneFeed_fnc_adjustDronePipEffect;

}] call CBA_fnc_addEventhandler;

["GRAD_droneFeed_fovChange", {
    params ["_fov", "_screen"];

    [_fov, _screen] call GRAD_droneFeed_fnc_adjustDroneFOV;

}] call CBA_fnc_addEventhandler;



["BERGLOEWE PHASECHANGE", "Change Briefing Slide to II",
{
  intro_billboard setObjectTextureGlobal [0, "pic\briefing2.paa"];
  missionNamespace setVariable ["droneFeedOnBillboard", false, true];
  [] remoteExec ["GRAD_droneFeed_fnc_droneFeedReset", 0];

}] call zen_custom_modules_fnc_register;

["BERGLOEWE PHASECHANGE", "Set Drone Feed on Billboard",
{
  missionNamespace setVariable ["droneFeedOnBillboard", true, true];
  [] remoteExec ["GRAD_droneFeed_fnc_droneFeedReset", 0];

}] call zen_custom_modules_fnc_register;




["BERGLOEWE PHASE I", "Change Briefing Slide to I",
{
  intro_billboard setObjectTextureGlobal [0, "pic\briefing.paa"];
  missionNamespace setVariable ["droneFeedOnBillboard", false, true];
  [] remoteExec ["GRAD_droneFeed_fnc_droneFeedReset", 0];

}] call zen_custom_modules_fnc_register;
