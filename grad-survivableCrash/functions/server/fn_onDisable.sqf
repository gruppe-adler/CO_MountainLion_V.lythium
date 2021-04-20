[_veh] spawn { 
    params ["_veh"];

    for "_i" from 0 to 20 do {
        private _damage = _veh getHitPointDamage "HitEngine";
        _veh setHitPointDamage ["HitEngine",_damage + 0.1];
        sleep 1;
    };
};