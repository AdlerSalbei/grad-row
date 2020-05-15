#include "script_component.hpp"

params ["_target", "_unit"];

systemChat format ["%1, %2", !((driver vehicle _unit) isEqualTo _unit), (_target getVariable [QGVAR(fuel), -1] <= -1)];

if !((driver vehicle _unit) isEqualTo _unit) exitWith { false };
if (_target getVariable [QGVAR(fuel), -1] <= -1) exitWith { false };

true