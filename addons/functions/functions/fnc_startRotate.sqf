
#include "script_component.hpp"

params ["_boat"];

private _change = 0.02;
private _time = 0;

for "_i" from 1 to 20 do {
	[
		{
			params ["_boat", "_change"];

			private _velocity = velocity _boat;
			private _dir = getDir _boat;

			_newDir = _dir - _change;
			_boat setVectorDir  [sin(_newDir), cos(_newDir), 0];
			_boat setVelocity _vel;
		}, 
		[_boat, _change], 
		_time
	] call CBA_fnc_waitAndExcute;

	_change = _change + 0.02;
	_time = _time + 0.01;
};

_time = _time + 0.01;

[
	{
		params ["_boat"];

		private _handle = [
			{
				params ["_boat", "_handle"];

				if (isNull _boat) exitWith {
					[_handle] call CBA_fnc_removePerFramHandler;
				};

				private _velocity = velocity _boat;
				private _dir = getDir _boat;

				_newDir = _dir - 0.2;
				_boat setVectorDir  [sin(_newDir), cos(_newDir), 0];
				_boat setVelocity _vel;
			},
			0.01,
			_boat
		] call CBA_fnc_addPerFrameHandler;

		_boat setVariable [QGVAR(handle), _handle];
	},
	_boat, 
	_time
] call CBA_fnc_waitAndExcute;


