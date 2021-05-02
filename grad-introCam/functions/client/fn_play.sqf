// dont display for JIP
if (didJIP) exitWith {
    diag_log "did jip exiting intro";
};

titleText ["","BLACK FADED",999];
0 fadeSound 0;

sleep 5;
waitUntil {!isNull player};
waitUntil {time > 0};
player setVariable ["tf_voiceVolume", 0, true];
diwako_dui_main_toggled_off = true;
showChat false;

if (typeOf player isEqualTo "B_officer_F") then {
    player action ["SwitchWeapon", player, player, 100];
};

private _viewDistanceCache = viewDistance;
private _objectViewDistanceCache = getObjectViewDistance;

setViewDistance 8000;
setObjectViewDistance [4000,200];

[] spawn GRAD_introCam_fnc_textEffects;
// [] spawn GRAD_introCam_fnc_playRecord;

private _shots = missionNamespace getVariable ["GRAD_INTROCAM_SHOTS", []];

private _count = count _shots;
{
  	[_x, _forEachIndex] call GRAD_introCam_fnc_camCommands;
} forEach _shots;


cutText [" ", "BLACK IN", 3];
private _camera = "camera" camCreate (getpos player);
_camera cameraeffect ["terminate", "back"];
camDestroy _camera;

setViewDistance _viewDistanceCache;
setObjectViewDistance _objectViewDistanceCache;
10 fadeSound 1;
titleText ["", "BLACK IN", 0];
player setVariable ["tf_voiceVolume", 1, true];
diwako_dui_main_toggled_off = false;
showChat true;