params ["_animal", "_distance", "_targetPos"];

if (_distance > 6) then {
	_animal setAnimSpeedCoef 2;
	_animal setVariable ["GRAD_HERDING_ANIM", GRAD_HERDING_ANIM_RUN];
	// diag_log format ["running..."];
	_animal forceSpeed (_animal getSpeed "FAST");
} else {
	if (_distance > 3) then {
		_animal setAnimSpeedCoef 1;
		_animal setVariable ["GRAD_HERDING_ANIM", GRAD_HERDING_ANIM_WALK];
		// diag_log format ["walking..."];
		_animal forceSpeed (_animal getSpeed "FAST");
	} else {
		_animal setAnimSpeedCoef 1;
		_animal setVariable ["GRAD_HERDING_ANIM", GRAD_HERDING_ANIM_STOP];
		// diag_log format ["stopping..."];
		_animal forceSpeed (_animal getSpeed "SLOW");
	};
};


// _animal moveTo _targetPos;

_targetPos params ["_xP", "_yP"];
_targetPos set [0, (_xP + random 1 - random 2)];
_targetPos set [1, (_yP + random 1 - random 2)];

_animal setDestination [_targetPos, "LEADER DIRECT", true];
// _targetDebug2 setPos _targetPos;