params ["_duration", "_switchOff"];

private _fog = missionNamespace getVariable ["GRAD_sandstorm_fogValue", [0,0,0]];
private _inHeli = player getVariable ["GRAD_survivableCrash_crashed", false];
// systemChat ("fog1 " + str _fog);

if (_inHeli) then {
    _fog = [(0.5 + random 0.2), 0.003, 0];
};

if (!_switchOff) then {
    _fog = [0.01,0.003,00];
};


// systemChat ("fog2 " + str _fog);

_duration setFog _fog;