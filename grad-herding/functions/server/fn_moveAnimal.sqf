params ["_animal", "_distance", "_targetPos"];

if (_distance > 6) then {
	// _animal setAnimSpeedCoef 2;
	_animal forceSpeed 9;
	// diag_log format ["running..."];
	// _animal forceSpeed (_animal getSpeed "FAST");
} else {
	if (_distance > 3) then {
		// _animal setAnimSpeedCoef 1;
		_animal forceSpeed 6;
		// diag_log format ["walking..."];
		// _animal forceSpeed (_animal getSpeed "FAST");
	} else {
		// _animal setAnimSpeedCoef 1; // cmd is local only
		_animal forceSpeed 3;
	};
};


// _animal moveTo _targetPos;

_targetPos params ["_xP", "_yP"];
_targetPos set [0, (_xP + random 1 - random 2)];
_targetPos set [1, (_yP + random 1 - random 2)];

// _animal setFormDir (_animal getDir _targetPos);
// _animal setDestination [_targetPos, "LEADER DIRECT", true];
// _animal setDir (_animal getDir _targetPos);
_animal moveTo _targetPos;
// _targetDebug2 setPos _targetPos;