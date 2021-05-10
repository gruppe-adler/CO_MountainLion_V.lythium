params ["_animal", "_indexOfHerd"];

private _string = format ["GRAD_herding_instance_%1", _indexOfHerd];
private _herd = missionNamespace getVariable [_instanceString, []];
_herd params ["_shepherd", "_animalArrayLiving"];

_animalArrayLiving deleteAt (_animalArrayLiving find _animal);

_herd set [1, _animalArrayLiving];

missionNamespace setVariable [_instanceString, _herd, true];

diag_log format ["GRAD HERDING: removing %1 from array living", _animal];


_animal removeAllEventHandlers "AnimDone";