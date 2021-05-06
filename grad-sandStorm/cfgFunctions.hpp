class GRAD_sandstorm {

    class client {
          file = grad-sandstorm\functions\client;

          class addLeaves;
          class addLODTrigger;
          class addModule { postInit = 1; };
          class addPostProcessing;
          class addSandWallLocal;

          class addToEmitterArray;
          class adjustEffects;
          class adjustEmitter;
          class adjustFog;

          class autoInit { preInit = 1; };

          class clearEmitterArray;

          class createEmitter;
          class createParticleBorder;
          class createParticleClose;

          class getEmitterArray;
          class getEmitterParams;
          class getEmitterParamsCircle;
          class getEmitterParamsRandom;

          class inBuilding;
          class nudgeToSandstorm;

          class removePostProcessing;

          class setEmitterLOD;
  };

    class server {
          file = grad-sandstorm\functions\server;

          class addDamage;
          class createSandWall;
  };
};

