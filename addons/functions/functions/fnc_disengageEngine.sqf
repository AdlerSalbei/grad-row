#include "script_component.hpp"

params ["_boat"];

systemChat format ["Boat: %1, Fuel: %2, GVAR: %3", _boat, fuel _boat,_boat getVariable [QGVAR(fuel), -1]];

private _fuel = _boat getVariable [QGVAR(fuel), -1];

if (_fuel > -1) exitWith {systemChat "exit";};

_fuel = fuel _boat;
_boat setFuel 0;
_boat setVariable [QGVAR(fuel), _fuel];