params ["_animal"];

if (random 2 > 1.7) then {
    private _sound = selectRandom GRAD_SAY_SOUNDS;
    private _path = getMissionPath "grad-herding\sounds\" + _sound + ".ogg";
    playSound3D [_path, _animal, false, getPosASL _animal, 1, 1, 70]; 
} else {
    private _sound = selectRandom GRAD_BELL_SOUNDS;
    private _path = getMissionPath "grad-herding\sounds\" + _sound + ".ogg";
    playSound3D [_path, _animal, false, getPosASL _animal, 1, 1, 350]; 
};