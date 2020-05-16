class CfgVehicles { 
    class Boat_F;
    class Rubber_duck_base_F: Boat_F {
        class ACE_SelfActions { 
            class GVAR(engine) { 
                displayName = CSTRING(engine); 
                condition = QUOTE(alive _target);
                statement = "";
                exceptions[] = {"isNotSwimming"};
                insertChildren = QUOTE(_this call DFUNC(createActions)); 
            }; 
        };	
    };
};


