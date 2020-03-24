class CfgVehicles {
    #define ROW_ACTIONS \
        class ACE_Actions { \
            class ACE_SelfActions { \
                class GVAR(engine) { \
                    displayName = "Engine"; \
                    condition = QUOTE([_target] call DFUNC(createActions)); \
                    statement = ""; \
                }; \
            }; \
        }	
    
    class Boat_F;
    class Rubber_duck_base_F: Boat_F {
        ROW_ACTIONS;
    };
};
