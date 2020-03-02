#include "script_component.hpp"

params ["_boat"];

private _fuel = _boat getVariable [QGVAR(fuel), -1];

if (_fuel <= -1) exitWith {};

_boat setFuel _fuel;
_boat setVariable [QGVAR(fuel), -1];