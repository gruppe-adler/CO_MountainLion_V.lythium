private _crate = "B_supplyCrate_F" createVehicle [0,0,0];

clearWeaponCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
clearBackpackCargoGlobal _crate;

_crate addMagazineCargoGlobal ["gm_1Rnd_44x537mm_heat_dm32_pzf44_2", 20];
_crate addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_Mk318_PMAG_Tan", 50];
_crate addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_Mk318_Stanag", 50];

_crate