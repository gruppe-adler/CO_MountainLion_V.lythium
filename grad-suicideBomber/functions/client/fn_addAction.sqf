params ["_unit"];

_unit addaction ["<t color=""#66ff66"">ALLAHU AKHBAR!</t>",{ 
        params ["_target", "_caller", "_actionId", "_arguments"];

        [_target, selectRandom ["suicide_bomber1","suicide_bomber2"]] remoteExec ["say3D", [0,-2] select isDedicated];

},[0],1,false,true,"","local _target"];