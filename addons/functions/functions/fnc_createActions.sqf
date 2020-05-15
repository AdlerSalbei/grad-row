#include "script_component.hpp"

/*
 * Author: Salbei
 * Create a action to handle the engine.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Player <OBJECT>
 * 3: Parameters <ARRAY>
 *
 * Return Value:
 * Children actions <ARRAY>
 *
 * Example:
 * [target, player, [params]] call ace_interaction_fnc_addPassengersActions
 *
 * Public: No
 */

params ["_target","_unit"];

private _name = "";
private _actionName = "";
private _statement = {};

 if (_target getVariable [QGVAR(rowingEngaed), false]) then {
    _actionName = QGVAR(engageEngine);
    _name = localize LSTRING(engageEngine);
    _statement = {
        params ["_target","_unit"];

        [_target] call FUNC(engageEngine);
    };
    _condition = {
        params ["_target","_unit"];

        private _return = [_target, _unit] call FUNC(engageEngine);

        _return
    };
} else {
    _actionName = QGVAR(disengageEngine);
    _name = localize LSTRING(disengageEngine);
    _statement = {
        params ["_target","_unit"];

        [_target] call FUNC(disengageEngine);
    };
    _condition = {
        params ["_target","_unit"];

       private _return = [_target, _unit] call FUNC(disengageEngine);

       _return
    };
};

private _actions = [[
    [
        _actionName, 
        _name, 
        "", 
        {}, 
        _condition, 
        _statement
    ] call ace_interact_menu_fnc_createAction,
    [],
    _unit
]];

_actions
