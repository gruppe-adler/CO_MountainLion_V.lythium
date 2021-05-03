// "_campos1", "_campos2", "_target", "_duration", "_zoom1", "_zoom2", "_isAttached", ["_offset",[0,0,0]],  "_radius"


/*
	
	CAM TYPES:

	["FREE", pos1, pos2, target, duration, fov1, fov2, offset (optional)],
	["ATTACHED", pos1, pos2, target, duration, fov1, fov2, offset (optional)],
	["ROTATE", angleStart, angleEnd, target, duration, fov1, fov2, radius (int), cclockwise (bool)]

*/

if (!isServer) exitWith {};

private _vehicleDefinitions = [
    [
        ["RHSGREF_A29B_HIDF", "introPlane1"]
    ],
    [
        "introPlaneWaypoint1",
        "introPlaneWaypoint2",
        "introPlaneWaypoint3"
    ]
];

private _introVehicles = _vehicleDefinitions call GRAD_introCam_fnc_playRecord;


private _camDefinitions = [
    ["FREE", getPos intro_camPos1, getPos intro_camPos2, intro_camTarget1, intro_camTarget2, 38.4, 0, 0.4, 0.2, [0,0,0], [0,0,0]],
	["FREE", getPos intro_camPos2, getPos intro_camPos3, intro_camTarget2, _introVehicles select 0, 25, 0, 0.2, 0.1, [0,0,0], [0,0,5]],
	["FREE", getPos intro_camPos3, getPos intro_end, _introVehicles select 0, intro_end2, 63.4, 0, 0.1, 0.2, [0,0,5], [0,0,2]],
    ["FREE", getPos intro_end, getPos intro_end, intro_end2, intro_end2, 5, 0, 0.2, 0.3, [0,0,2], [0,0,2]]
];

/////// dont edit below

{
  	[_x] call GRAD_introCam_fnc_addShot;
} forEach _camDefinitions;

[{
    BRIEFING_DONE = true;
    introLogo setObjectTextureGlobal [0,""];
}, [], 63] call CBA_fnc_waitAndExecute;

[] remoteExec ["GRAD_introCam_fnc_preLoad", [0,-2] select isDedicated, false];