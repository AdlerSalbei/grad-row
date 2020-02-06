#include "script_component.hpp"

if (isServer) then {
    addMissionEventHandler ["HandleDisconnect", {call FUNC(handleDisconnect)}];
};

if (!hasInterface) exitWith {};

