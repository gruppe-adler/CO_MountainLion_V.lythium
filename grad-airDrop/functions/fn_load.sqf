//by Persian MO
//add below code in vehicle init
//this addaction ["<t color=""#ff0000"">Load in airDroper</t>","tfi_load.sqf",[0],1,false,true,"","(_target distance _this) < 10"];


_target = _this select 0;
_caller = _this select 1;

_class = typeOf _target;

_name = getText (configFile >> "cfgVehicles" >> typeOf _target >> "displayName");

_rnum = str(round (random 999));
_id = "tfiID" + _rnum;

_display = ("<t color=""#66FFFF"">" + ("drop   ") +"</t>") + (str _name);

_nObject = nearestObject [_caller, "Air"];


_id = _nObject addAction [_display, {_this execVM "tfi_drop.sqf"}, [_class], 5, true, true, "", "((vehicle player) iskindof ""Air"") && (((position player) select 2) > 20) && (player == driver (vehicle player))"]; 

sleep 1;

deletevehicle _target;

