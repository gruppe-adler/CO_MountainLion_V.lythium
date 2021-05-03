class grad_missionControl {

	class client {
		  file = grad-missionControl\functions\client;

      class addCuratorIcon;
      class addModules;
      class addVehicleMarker;
      class adjustDroneFOV;
      class adjustDronePipEffect;
      class createBloodEffect;
      class detectFapper  { postInit = 1; };
      class droneFeedInit;
      class droneFeedinterpretMouseWheel;
      class droneFeedinterpretMouseClick;
      class droneFeedReset;
      class dropZeusEars;
      class inspectDroneFeed;
      class setMyFrequency;
      class setGroupFrequencies;
      class stopMusic;
  };

	class server {
		  file = grad-missionControl\functions\server;

      class addApacheDestruction;
      class addExplosionSource;
      class addFortifications;
      class addIntel;
      class alertUnits;
      class createChairCircle;
      class createTruckReinforcements;
      class despawn;
      class destroyTires;
      class disableChargeMode;
      class enableChargeMode;
      class fapper;
      class fillSupplyBox;
      class getPosInCircle;   
      class isInsideHouse;
      class ownerShipHandler { postInit = 1; };
      class readIntel;
      class secondaryExplosions;
      class sitDown;
      class startKaffeefahrt;
      class suicideCar;
      class suicideCarExplode;
      class suicideCarInit;
      class weaponizeCivilian;
      class weaponizeVehicle;
  };
};