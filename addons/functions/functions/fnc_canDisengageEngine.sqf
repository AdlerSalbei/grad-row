#include "script_component.hpp"

params ["_target", "_unit"];

systemChat format ["T: %1, U: %2", _target, _unit];
systemChat format ["Driver: %1, GVAR: %2, Fuel: %3", !((driver _target) isEqualTo _unit), (_target getVariable [QGVAR(fuel), -1] > -1), !(fuel _target > 0)];

if !((driver _target) isEqualTo _unit) exitWith { false };
if (_target getVariable [QGVAR(fuel), -1] > -1) exitWith { false };
if !(fuel _target > 0) exitWith { false };

true