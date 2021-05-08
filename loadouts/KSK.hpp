class KSK {
	class AllUnits {
		uniform[] = {"SMM_Uniform_BW_MC", "SMM_Uniform_BW_MC_RS", "SMM_Uniform_BW_MC_TS"};
        vest[] = {"rhsusf_spcs_ocp_rifleman_alt", "rhsusf_spcs_ocp_rifleman"};
		goggles[] = {"rhsusf_shemagh2_tan", "rhsusf_shemagh2_gogg_tan", "rhsusf_shemagh_gogg_tan", "rhsusf_shemagh_tan", "G_Bandanna_khk", "G_Bandanna_tan"};
		backpack = "";
		headgear[] = {"rhsusf_opscore_ut_pelt_nsw_cam", "rhsusf_opscore_ut_pelt_nsw", "rhsusf_opscore_ut_pelt_cam", "rhsusf_opscore_ut_pelt", "rhsusf_opscore_paint_pelt_nsw_cam", "rhsusf_opscore_paint_pelt_nsw", "rhsusf_opscore_paint_pelt"};
		primaryWeapon[] = {"rhs_weap_hk416d10", "rhs_weap_hk416d10_LMT", "rhs_weap_hk416d10_LMT_d", "rhs_weap_hk416d145", "rhs_weap_hk416d145_d"};
        primaryWeaponMagazine = "rhs_mag_30Rnd_556x45_Mk318_PMAG_Tan";
		primaryWeaponOptics[] = {"rhsusf_acc_g33_xps3_tan", "rhsusf_acc_g33_xps3", "rhsusf_acc_ACOG3", "rhsusf_acc_eotech_552", "rhsusf_acc_eotech_552_d", "rhsusf_acc_compm4", "rhsusf_acc_su230_c", "rhsusf_acc_su230_mrds_c", "rhsusf_acc_su230a_c", "rhsusf_acc_su230a_mrds_c", "rhsusf_acc_T1_high", "rhsusf_acc_T1_low", "rhsusf_acc_ACOG_RMR", "rhsusf_acc_ACOG_d", "rhsusf_acc_eotech_xps3"};
		primaryWeaponPointer = "rhsusf_acc_anpeq15side";
		primaryWeaponMuzzle[] = {"rhsusf_acc_nt4_tan", "rhsusf_acc_nt4_black"};
        primaryWeaponUnderbarrel = "";
		primaryWeaponUnderbarrelMagazine = "";
        secondaryWeapon = "";
        secondaryWeaponMagazine = "";
		handgunWeapon = "hgun_Pistol_heavy_01_F";
        handgunWeaponMagazine = "11Rnd_45ACP_Mag";
        handgunWeaponOptics = "optic_MRD";
        handgunWeaponMuzzle = "muzzle_snds_acp";
		binoculars = "ACE_Vector";
		map = "ItemMap";
		compass = "ItemCompass";
		watch = "ItemWatch";
		gps = "ItemGPS";
		radio = "tfar_anprc152";
		nvgoggles = "rhsusf_ANPVS_15";
	};


    class Type {
       //Rifleman
        class Soldier_F {
            addItemsToUniform[] = {
                LIST_1("ACE_MapTools"),
                LIST_1("ACE_DefusalKit"),
                LIST_2("ACE_CableTie"),
                LIST_1("ACE_Flashlight_MX991"),

                GRAD_FACTIONS_MEDICITEMS_INF_LIST
            };
    		vest[] = {"rhsusf_spcs_ocp_rifleman_alt", "rhsusf_spcs_ocp_rifleman"};
            addItemsToVest[] = {
                LIST_2("HandGrenade"),
                LIST_4("SmokeShell"),
                LIST_2("ACE_M84"),
                LIST_1("11Rnd_45ACP_Mag"),
                LIST_7("rhs_mag_30Rnd_556x45_Mk318_PMAG_Tan")
            };
            backpack =  "SMM_AssaultPack_BW_MC";
            addItemsToBackpack[] = {
                LIST_4("rhs_mag_30Rnd_556x45_Mk318_PMAG_Tan"),
                LIST_2("SmokeShell"),
                LIST_2("HandGrenade"),
                LIST_2("ACE_salineIV_500")
            };
        };

        //Combat Life Saver
        class medic_F: Soldier_F {
            backpack = "SMM_Kitbag_BW_MC";
            addItemsToVest[] = {
                LIST_2("SmokeShellPurple"),
                LIST_8("SmokeShell"),
                LIST_1("11Rnd_45ACP_Mag"),
                LIST_8("rhs_mag_30Rnd_556x45_Mk318_PMAG_Tan")
            };
            addItemsToBackpack[] = {
                LIST_2("ACE_bodyBag")
            };
    		vest = "rhsusf_spcs_ocp_medic";
            class Rank {
                class PRIVATE {
                    GRAD_FACTIONS_MEDICITEMS_CFR
                };
                class CORPORAL {
                    GRAD_FACTIONS_MEDICITEMS_SQ
                };
                class SERGEANT {
                    GRAD_FACTIONS_MEDICITEMS_PT
                };
                class LIEUTENANT: SERGEANT {};
                class CAPTAIN: SERGEANT {};
                class MAJOR: SERGEANT {};
                class COLONEL: SERGEANT {};
            };
        };

        //Explosive Specialist
        class soldier_exp_F: Soldier_F {
            backpack = "SMM_AssaultPack_BW_MC";
            addItemsToBackpack[] = {
                LIST_1("ACE_M26_Clacker"),
                LIST_7("DemoCharge_Remote_Mag")
            };
        };

        //Rifleman (AT)
        class soldier_LAT2_F: Soldier_F {
            secondaryWeapon = "rhs_weap_M136";
            backpack = "";
            addItemsToBackpack[] = {};
        };

        //Squad Leader
        class Soldier_SL_F: Soldier_F {
    		vest[] = {"rhsusf_spcs_ocp_squadleader", "rhsusf_spcs_ocp_teamleader_alt", "rhsusf_spcs_ocp_teamleader"};
            backpack = "TFAR_rt1523g";
            addItemsToBackpack[] = {
                LIST_4("SmokeShellPurple"),
                LIST_2("SmokeShellRed"),
                LIST_2("SmokeShellGreen"),
                LIST_1("B_IR_Grenade"),
                LIST_1("ACE_IR_Strobe_Item")
            };
        };

        class Helipilot_F: Soldier_F {
            vest[] = {"rhsusf_spcs_ocp_crewman", "rhsusf_spcs_ocp"};
            headgear = "rhsusf_hgu56p_tan";
            primaryWeapon = "rhsusf_weap_MP7A2";
            primaryWeaponMagazine = "rhsusf_mag_40Rnd_46x30_FMJ";
            addItemsToVest[] = {
                LIST_2("HandGrenade"),
                LIST_4("SmokeShell"),
                LIST_2("ACE_M84"),
                LIST_1("11Rnd_45ACP_Mag"),
                LIST_7("rhsusf_mag_40Rnd_46x30_FMJ")
            };
            backpack = "";
            addItemsToBackpack[] = {};
        };
    };

    class Rank {
        class LIEUTENANT {
            headgear = "SMM_MilCap_BW_TT";
            vest = "";
            uniform = "";
        };
    };
};