params [["_createNew", false]];

if (isNil "stage1_drone") exitWith {};

private _screen = player getVariable ["GRAD_missionControl_pipScreen", objNull];
_screen setObjectTexture [0, "#(argb,512,512,1)r2t(uavrtt,1)"];

/*
if (missionNamespace getVariable ["droneFeedOnBillboard", false]) then {
    if (!isNull (missionNamespace getVariable ["intro_billboard", objNull])) then {
        intro_billboard setObjectTexture [0, "#(argb,512,512,1)r2t(uavrtt,1)"];
    };
};
*/

/* create camera and stream to render surface */

private _droneCam = player getVariable ["GRAD_missionControl_droneCam", objNull];

if (isNull _droneCam || _createNew) then {
  _droneCam = "camera" camCreate [0,0,0];
  _droneCam cameraEffect ["Internal", "Back", "uavrtt"];
};


/* attach cam to gunner cam position */
if (!isNull (missionNameSpace getVariable ["stage1_drone", objNull])) then {
    _droneCam camSetTarget uav_target;
    _droneCam camCommit 0;
};

/* make it zoom in a little */
_droneCam camSetFov (_screen getVariable ["GRAD_missionControl_zoomLevel", 0.1]);
_droneCam camCommit 0;

/* switch cam to thermal */
private _effect = _screen getVariable ["GRAD_missionControl_pipEffect", 1];
"uavrtt" setPiPEffect [if (_effect < 1) then { 0 } else { 2 }];

player setVariable ["GRAD_missionControl_droneCam", _droneCam];
