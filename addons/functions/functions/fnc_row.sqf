#include "script_component.hpp"

params ["_boat"];

if ([_boat] call FUNC(canRow) && {speed _boat < (10 + 2 * _boat getVariable [QGVAR(rowers), 1])}) then
{
	//Play Sound
	//_boat say3D "Sound";

	private _velocityChange = [
		(_boat getVariable [QGVAR(rowingSideways), 0]),
		(_boat getVariable [QGVAR(rowingForwards), 0]),
		0
	];

	private _currentVelocity = velocityModelSpace _boat;
	_boat setVelocityModelSpace (_currentVelocity vectorAdd _velocityChange);
};