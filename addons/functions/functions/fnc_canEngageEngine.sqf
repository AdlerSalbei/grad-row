#include "script_component.hpp"

params ["_target", "_unit"];

if !((driver vehicle _unit) isEqualTo _unit) exitWith { false };
if (_target getVariable [QGVAR(fuel), -1] <= -1) exitWith { false };

true