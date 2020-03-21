#include "script_component.hpp"

params ["_boat", "_bool"];

if (_bool) then {
	_boat setVariable [QGVAR(engineState), true];
	_boat setVariable [QGVAR(fuel), fuel boat];

	_boat setFuel 0;
} else {
	_boat setVariable [QGVAR(engineState), false];

	private _fuel = _boat getVariable [QGVAR(fuel), 0];
	_boat setVariable [QGVAR(fuel), nil];

	_boat setFuel _fuel;
};