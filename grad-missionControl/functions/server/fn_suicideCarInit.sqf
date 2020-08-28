params ["_car"];

if (!isServer) exitWith {};

_car setPilotLight false;
(driver _car) setBehaviour "CARELESS";
(driver _car) disableAI "LIGHTS" ;

{
  if (typeOf _x == "MetalBarrel_burning_F") then {
        _x inflame false;
    };
} forEach attachedObjects _car;