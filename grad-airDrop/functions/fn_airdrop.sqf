// AIR DROP BY KK

private ["_para","_paras","_p","_vehicle","_vel","_time"];
/*_class = format [
    "b_parachute_02_F", 
    toString [(toArray faction _this) select 0]
];*/
private _para = createVehicle ["b_parachute_02_F", [0,0,0], [], 0, "FLY"];
_para setDir getDir _this;
_para setPos getPos _this;
private _paras = [_para];
_this attachTo [_para, [0,2,0]];
{
    _p = createVehicle ["b_parachute_02_F", [0,0,0], [], 0, "FLY"];
    _paras set [count _paras, _p];
    _p attachTo [_para, [0,0,0]];
    _p setVectorUp _x;
} count [
    [0.5,0.4,0.6],[-0.5,0.4,0.6],[0.5,-0.4,0.6],[-0.5,-0.4,0.6]
];
0 = [_this, _paras] spawn {
    params ["_vehicle"];
    waitUntil {getPos _vehicle select 2 < 3};
    _vel = velocity _vehicle;
    detach _vehicle;
    _vehicle setVelocity _vel;
    _vehicle allowDamage false;

    missionNamespace setVariable ["#FX", [_vehicle, _vel select 2]];
    publicVariable "#FX";
    playSound3D [
        "a3\sounds_f\weapons\Flare_Gun\flaregun_1_shoot.wss",
        _vehicle
    ];
    {
        detach _x;
        _x disableCollisionWith _vehicle;   
    } count (_this select 1);
    _time = time + 5;
    waitUntil {time > _time};
    {
        if (!isNull _x) then {deleteVehicle _x};
    } count (_this select 1);

    _vehicle setDamage 0; // remove any damage that might have been received from touchdown    
    _vehicle allowDamage true;
};