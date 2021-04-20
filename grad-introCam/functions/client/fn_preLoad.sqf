private _camShots = missionNamespace getVariable ["GRAD_INTROCAM_SHOTS", []];

{
    _x params [
        "_type",
        "_start",
        "_end",
        "_target1",
        "_target2",
        "_duration",
        "_transition",
        "_zoom1",
        "_zoom2",
        ["_offset1",[0,0,0]],
        ["_offset2",[0,0,0]],
        ["_angle",1],
        ["_radius",100],
        ["_cclockwise", false]
    ];

    private _cam = "camera" camCreate _start;
    _cam camPreparePos _start;
    _cam camPrepareTarget _target1;
    _cam camPrepareFov _zoom1;
    _cam camPreload 0;
    waitUntil { camPreloaded _cam };

    diag_log format ["cam preloading %1 - %2", _forEachIndex, time];

    _cam camPreparePos _end;
    _cam camPrepareTarget _target2;
    _cam camPrepareFov _zoom2;
    _cam camPreload 0;
    waitUntil { camPreloaded _cam };

    diag_log format ["cam preloading %1 - %2", _forEachIndex, time];

} forEach _camShots;