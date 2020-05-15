class CfgVehicles { 
    class Boat_F;
    class Rubber_duck_base_F: Boat_F {
        class ACE_SelfActions { 
            class GVAR(engine) { 
                displayName = "Engine"; 
                    /*
                    condition = QUOTE([ARR_2(_target,_player)] call FUNC(canDeactivateEngine)); 
                    statement = QUOTE([_target] call FUNC(disengageEngine)); 
                    */
                condition = QUOTE(alive _target);
                statement = "";
                exceptions[] = {"isNotSwimming"};
                insertChildren = QUOTE(_this call DFUNC(createActions)); 
            }; 
        };	
    };
};


