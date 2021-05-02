params ["_vehicle"];

if (!isServer) exitWith {};

 { _vehicle setObjectTextureGlobal [_x, '#(rgb,8,8,3)color(0.25,0.2,0.1,1)']; } forEach [0,1,2,3,4]; 
 
_vehicle setHitPointDamage ["HitHull",.88];
_vehicle setHitPointDamage ["HitFuel",.88];

_vehicle engineOn false;
_vehicle setVehicleLock "LOCKED";
_vehicle allowDamage true;
{ _vehicle setHitPointDamage [_x,.7]; } forEach [
    "hithydraulics",
    "hittransmission",
    "glass1",
    "glass2",
    "glass3",
    "glass4",
    "glass5",
    "glass6"
];
_vehicle allowDamage false;