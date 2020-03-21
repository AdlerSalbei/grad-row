class CfgVehicles {
    #define ROW_ACTIONS \
        class ACE_Actions { \
            class ACE_MainActions { \
                class GVAR(activateEngine) { \
                    displayName = "Activate Engine"; \
                    condition = QUOTE([_target] call FUNC(canActivateEngine)); \
                    statement = QUOTE(ARR_2(_target,false) call FUNC(changeEngineStatus)); \
                    exceptions[] = {"isNotSwimming"}; \
                }; \
            }; \
        };	\
		class ACE_Actions { \
            class ACE_MainActions { \
                class GVAR(deactivateEngine) { \
                    displayName = "Deactivate Engine"; \
                    condition = QUOTE([_target] call FUNC(canDeactivateEngine)); \
                    statement = QUOTE(ARR_2(_target,true) call FUNC(changeEngineStatus)); \
                    exceptions[] = {"isNotSwimming"}; \
                }; \
            }; \
        }
    
    class Boat_F;
    class Rubber_duck_base_F: Boat_F {
        ROW_ACTIONS;
    };
};