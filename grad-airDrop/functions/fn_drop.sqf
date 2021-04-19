//by Persian MO

_target = _this select 0;
_caller = _this select 1;
_id = _this select 2;
_classm = _this select 3;
_class = _classm select 0;

_pos = getPosATL _caller;



sleep 2;


_veh = _class createVehicle [0,0,0];
_veh setDir random 360;
_veh setPos _pos;
_veh call KK_fnc_paraDrop;

_target removeAction _id;