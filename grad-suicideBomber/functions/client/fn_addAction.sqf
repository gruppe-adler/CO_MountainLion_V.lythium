params ["_unit"];

private _scream = selectRandom ["suicide_bomber1","suicide_bomber2"];
_unit setVariable ["GRAD_suicideBomber_scream", _scream, true];

_unit addaction ["<t color=""#66ff66"">ALLAHU AKHBAR!</t>",{ 
        params ["_target", "_caller", "_actionId", "_arguments"];

        private _scream = _target getVariable ["GRAD_suicideBomber_scream", ""];
        [_target, _scream] remoteExec ["say3D", [0,-2] select isDedicated];

},[0],1,false,true,"","local _originalTarget"];


_unit addaction ["<t color=""#ff6666"">EXPLODE</t>",{ 
        params ["_target", "_caller", "_actionId", "_arguments"];

        _target setDamage 1;

},[0],1,false,true,"","local _originalTarget"];