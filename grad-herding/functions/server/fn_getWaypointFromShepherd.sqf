params ["_shepherd"];

// diag_log format ["getting new wp from shepherd %1, %2", _shepherd, GRAD_HERDING_DISTANCE_TO_SHEPHERD];


// get new wp in 20° angle in front of shepherd
private _wp = _shepherd getVariable ["GRAD_HERDING_TARGET", []];

if (count _wp isEqualTo 0)  then {
	_wp = _shepherd getRelPos [GRAD_HERDING_DISTANCE_TO_SHEPHERD, (random 10 - random 20)];
};

_wp