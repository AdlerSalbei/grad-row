#include "script_component.hpp"

params ["_boat"];

private _fuel = _boat getVariable [QGVAR(fuel), -1];

if (_fuel > -1) exitWith {};

_fuel = fuel _boat;
_boat setFuel 0;
_boat setVariable [QGVAR(fuel), _fuel];