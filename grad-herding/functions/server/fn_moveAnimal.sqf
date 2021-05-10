params ["_animal", "_distance", "_targetPos"];

// _animal moveTo _targetPos;

_targetPos params ["_xP", "_yP"];
_targetPos set [0, (_xP + random 1 - random 2)];
_targetPos set [1, (_yP + random 1 - random 2)];

// _animal setDestination [_targetPos, "LEADER DIRECT", true];
// _animal setDir (_animal getDir _targetPos);
_animal moveTo _targetPos;
// _targetDebug2 setPos _targetPos;