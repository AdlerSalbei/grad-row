#define BOAT_ACTIONS class ACE_Actions { \
        class ACE_MainActions { \
            class GVAR(disengageEngine) { \
				displayName = CSTRING(disengageEngine); \
                exceptions[] = {}; \
                showDisabled = 0; \
                priority = 4; \
                statement = QUOTE([_target] call FUNC(disengageEngine);); \
				condition = QUOTE(GVAR(allowRowing) && {[ARR_2(_target,_player)] call FUNC(canDisengageEngine)}); \
            }; \
			class GVAR(engageEngine) { \
				displayName = CSTRING(engageEngine); \
                exceptions[] = {}; \
                showDisabled = 0; \
                priority = 4; \
                statement = QUOTE([_target] call FUNC(engageEngine);); \
				condition = QUOTE(GVAR(allowRowing) && {[ARR_2(_target,_player)] call FUNC(canEngageEngine)}); \
            }; \
        }; \
    }

class cfgVehicles {

};