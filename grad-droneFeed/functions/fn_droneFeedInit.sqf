params ["_screen"];

if (isServer) then {
    _screen setVariable ["GRAD_missionControl_pipEffect", 1, true];
    _screen setVariable ["GRAD_missionControl_zoomLevel", 0.1, true];
    // _screen enableSimulationGlobal false;
    // _screen attachTo [screen_base];
    // [_screen, 0, 0, 180] call ace_common_fnc_setPitchBankYaw;
};

BRIEFING_DONE = false;

if (hasInterface) then {

    [{
        BRIEFING_DONE
    },{
        params ["_screen"];
        player setVariable ["GRAD_missionControl_pipScreen", _screen];
        [] call GRAD_droneFeed_fnc_droneFeedReset;

        if (!(player getVariable ["GRAD_missionControl_droneInit", false])) then {

            player setVariable ["GRAD_missionControl_droneInit", true];

             addMissionEventHandler ["Draw3D", {
                private _droneCam = player getVariable ["GRAD_missionControl_droneCam", objNull];
                private _droneCamInternal = player getVariable ["GRAD_missionControl_droneCamInternal", objNull];
                if (isNull (missionNameSpace getVariable ["stage1_drone", objNull])) exitWith {};
                private _dir =
                    (stage1_drone selectionPosition "laserstart")
                        vectorFromTo
                    (stage1_drone selectionPosition "commanderview");

                if (!isNull _droneCamInternal)  then {
                    _droneCamInternal setVectorDirAndUp [
                        _dir,
                        _dir vectorCrossProduct [-(_dir select 1), _dir select 0, 0]
                    ];
                };
                if (!isNull _droneCam) then {
                    _droneCam setPos (stage1_drone modelToWorldVisual (stage1_drone selectionPosition "commanderview"));
                };
            }];



            private _action = ["ZoomIn", "Zoom In", "\A3\ui_f\data\igui\cfg\actions\arrow_down_gs.paa", {
                params ["_target", "_player", "_args"];
                _args params ["_droneCam"];

                 private _currentFOV =  _target getVariable ["GRAD_missionControl_zoomLevel", 0.1];
                _currentFOV = _currentFOV - 0.05;
                _target setVariable ["GRAD_missionControl_zoomLevel", _currentFOV, true];
                ["GRAD_droneFeed_fovChange", [_currentFOV, _target]] call CBA_fnc_globalEvent;
            }, {
                 true
            }, nil, [_droneCam]] call ace_interact_menu_fnc_createAction;
            [_screen, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

            private _action = ["ZoomOut", "Zoom Out", "\A3\ui_f\data\igui\cfg\actions\arrow_up_gs.paa", {
                params ["_target", "_player", "_args"];
                _args params ["_droneCam"];

                private _currentFOV =  _target getVariable ["GRAD_missionControl_zoomLevel", 0.1];
                _currentFOV = _currentFOV + 0.05;
                _target setVariable ["GRAD_missionControl_zoomLevel", _currentFOV, true];
                ["GRAD_droneFeed_fovChange", [_currentFOV, _target]] call CBA_fnc_globalEvent;
            }, {
                 true
            }, nil, [_droneCam]] call ace_interact_menu_fnc_createAction;
            [_screen, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

            private _action = ["CycleCamModes","Cycle Cam Modes", "\A3\ui_f\data\igui\cfg\actions\RadarOn_ca.paa", {
                params ["_target", "_player", "_args"];

                private _currentEffect = _target getVariable ["GRAD_missionControl_pipEffect", 1];
                _currentEffect = if (_currentEffect < 1) then { 1 } else { 0 };
                _target setVariable ["GRAD_missionControl_pipEffect", _currentEffect, true];
                ["GRAD_droneFeed_pipChange", [_currentEffect, _target]] call CBA_fnc_globalEvent;
            }, {
                 true
            }, nil, []] call ace_interact_menu_fnc_createAction;
            [_screen, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

            private _action = ["InspectFeed","Inspect Drone Feed", "\A3\ui_f\data\igui\cfg\actions\RadarOff_ca.paa", {
                params ["_target", "_player", "_args"];

                [_target] call GRAD_droneFeed_fnc_inspectDroneFeed;
            }, {
                 true
            }, nil, []] call ace_interact_menu_fnc_createAction;
            [_screen, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
        };
    }, [_screen]] call CBA_fnc_waitUntilAndExecute;
};
