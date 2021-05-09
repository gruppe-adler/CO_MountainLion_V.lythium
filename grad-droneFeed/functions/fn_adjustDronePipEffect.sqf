params ["_effect", ["_screen", objNull]];

private _droneCamInternal = player getVariable ["GRAD_missionControl_droneCamInternal", objNull];
private _droneCam = player getVariable ["GRAD_missionControl_droneCam", objNull];

if (isNull _droneCamInternal) then {
    "uavrtt" setPiPEffect [if (_effect < 1) then { 0 } else { 2 }];
    [false] call GRAD_droneFeed_fnc_droneFeedReset;
} else {
    if (!isNull _droneCam) then {
        switch (_effect) do { 
            case 1 : {  true setCamUseTI 1; }; 
            default {  camUseNVG false; false SetCamUseTi 0; }; 
        };
    };
    "uavrtt" setPiPEffect [if (_effect < 1) then { 0 } else { 2 }];
};