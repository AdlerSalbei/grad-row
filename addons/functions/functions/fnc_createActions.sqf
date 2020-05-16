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

switch (true) do {
    case ([_target, _unit] call FUNC(canEngageEngine)) : {
        _actionName = QGVAR(engageEngine);
        _name = localize LSTRING(engageEngine);
        _statement = {
            params ["_target","_unit"];

            [_target] call FUNC(engageEngine);
        };
    };
    case ([_target, _unit] call FUNC(canDisengageEngine)) : {
        _actionName = QGVAR(disengageEngine);
        _name = localize LSTRING(disengageEngine);
        _statement = {
            params ["_target","_unit"];

            [_target] call FUNC(disengageEngine);
        };
    };
};

if (_statement isEqualTo {}) exitWith {};

private _actions = [[
    [
        _actionName, 
        _name, 
        "", 
        _statement, 
        {true}
    ] call ace_interact_menu_fnc_createAction,
    [],
    _unit
]];

_actions
