#include "script_component.hpp"

params ["_target"];

systemChat "Creating Action";

private _name = "";
private _actionName = "";
private _statement = {};

 if (_target getVariable [QGVAR(rowingEngaed), false]) then {
    _actionName = QGVAR(engageEngine);
    _name = localize LSTRING(engageEngine);
    _statement = {[_target, false] call FUNC(changeEngineStatus);};
} else {
    _actionName = QGVAR(disengageEngine);
    _name = localize LSTRING(disengageEngine);
    _statement = {[_target, true] call FUNC(changeEngineStatus);};
};

private _action = [
    _actionName, _name, "", _statement, {true}, {}
] call ace_interact_menu_fnc_createAction;

true