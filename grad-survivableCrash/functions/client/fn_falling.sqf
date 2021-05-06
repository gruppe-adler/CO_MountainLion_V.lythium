params ["_vehicle"];

if (!(player in _vehicle)) exitWith {};

addCamShake [10, 2, 9];

playSound "tingle";
playSound "wind";
player allowDamage false;

player setVariable ["GRAD_survivableCrash_crashed", true, true];

// [] call GRAD_survivableCrash_fnc_disableRadio;
[player] call GRAD_survivableCrash_fnc_disableBFT;


// make view blurry
private _handle = ppEffectCreate ["DynamicBlur", 2]; 
_handle ppEffectEnable true; 
_handle ppEffectAdjust [0]; 
_handle ppEffectCommit 0; 
_handle ppEffectAdjust [5]; 
_handle ppEffectCommit 15;

[{  
   params ["_vehicle", "_handle"]; 
   isNull _vehicle 
},{
    params ["_vehicle", "_handle"]; 
    _handle ppEffectEnable false; 
    ppEffectDestroy _handle; 

    // reset wind sound
    private _soundeffect = player getVariable ["sandStormSoundEH", -1];
    if (_soundeffect > -1) then {
       removeMusicEventHandler ["MusicStop", _soundeffect];
    };
    playMusic "";
    0 fadeMusic 1;
}, [_vehicle]] call CBA_fnc_waitUntilAndExecute;


[{
    params ["_args", "_handle"];
    _args params ["_vehicle"];

    if (isNull _vehicle) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

     playSound "tingle";
     addCamShake [8, 9, 4];

}, 9, [_vehicle]] call CBA_fnc_addPerFrameHandler;

[{
    params ["_args", "_handle"];
    _args params ["_vehicle"];

    if (isNull _vehicle) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

     playSound "wind";

}, 26, [_vehicle]] call CBA_fnc_addPerFrameHandler;