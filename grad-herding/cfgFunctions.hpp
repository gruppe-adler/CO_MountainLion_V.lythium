class GRAD_herding {

    class client {
        file = grad-herding\functions\client;
        
        class addModule { postInit = 1; };
    };

    class server {
        file = grad-herding\functions\server;

        class create;
        class createSniper;
        class fillWithAnimals;
        class getWaypointFromShepherd;
        class init {preInit = 1;};
        class loop;
        class makeSound;
        class moveAnimal;
        class removeAnimalFromHerd;
    };  
};