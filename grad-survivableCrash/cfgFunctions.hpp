class grad_survivableCrash {

    class client {
          file = grad-survivableCrash\functions\client;

          class addModule { postInit = 1; };
          class enableBFT;
          class disableBFT;
          class disableRadio;
          class falling;
          class onCrashLocal;
  };

    class server {
          file = grad-survivableCrash\functions\server;

          class addHandler;
          class autoInit { postInit = 1; };
          class crashedHelo;
          class onCrash;
          class onDisable;
          class spawnHolder;
          class throwOutInventoryUnit;
          class throwOutInventoryVehicle;
  };
};