private _sources = missionNamespace getVariable ["grad_missioncontrol_explosionsources", []];

{
    private _position = getPos _x;

    private _explosion = "Bo_GBU12_LGB" createVehicle _position;
    _explosion setDamage 1;

    // create ruins
    private _housesNearBy = (
        (_position nearObjects ["House", 50]) + 
        (_position nearObjects ["BUILDING", 50]) + 
        (_position nearObjects ["Thing", 50])
        );
    private _terrainObjectsNearBy = nearestTerrainObjects [_position, ["House"], 50];
    {
        private _house = _x;

        if (_house isKindOf "Land_fortified_nest_small_EP1" || _house isKindOf "Thing") then {
            deleteVehicle _house;
        } else {
            private _position = getPos _house;
            _position set [2,0];
            _house setDamage [1, false];
            _house setPos _position;
            _house setVectorUp surfaceNormal _position;
        };
        
    } forEach (_housesNearBy + _terrainObjectsNearBy);

    // units
    {
        _x setDamage [1, false];
    } forEach (_position nearObjects ["Man", 50]);

    // vehicles
    {
        _x setDamage [1, false];
    } forEach (_position nearObjects ["LandVehicle", 50]);


    // simple objects
    {
        if (_x distance2D _position < 50) then {
            deleteVehicle _x;
        };
    } forEach allSimpleObjects [];
} forEach _sources;