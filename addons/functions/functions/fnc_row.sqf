#include "script_component.hpp"

params ["_boat", "_velocityChange"];

if !([_boat] call FUNC(canRow)) exitWith {};

private _currentVelocity = velocityModelSpace _boat;

if (_velocityChange isEqualTo []) then {
	_currentVelocity params ["_x", "_y"];

	private _newX = if (_x >= 0) then {(_x -1) max 0} else {(_x -1) min 0};
	private _newY = if (_y >= 0) then {(_y -1) max 0} else {(_y -1) min 0};

	_boat setVelocityModelSpace [_newX, _newY, 0];
} else {

	if ([_boat] call FUNC(canRow) && {speed _boat < (10 + 2 * _boat getVariable [QGVAR(rowers), 1])}) then
	{
		//Play Sound
		//_boat say3D "Sound";

		_boat setVelocityModelSpace (_currentVelocity vectorAdd _velocityChange);
	};
};