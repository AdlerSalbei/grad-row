#include "script_component.hpp"
params ["_boat"];

private _pfhId = _boat getVariable [QGVAR(handle), nil];
private _change = 0.02;
private _time = 0;

[_pfhID] call CBA_fnc_removePerFrameHandler;

for "_i" from 1 to 20 do {
    [
        {
            params ["_boat", "_change"];

            private _velocity = velocity _boat;
            private _dir = getDir _boat;

            private _newDir = _dir - _change;
            _boat setVectorDir  [sin(_newDir), cos(_newDir), 0];
            _boat setVelocity _velocity;
        }, 
        [_boat, _change], 
        _time
    ] call CBA_fnc_waitAndExcute;

    _change = _change + 0.02;
    _time = _time + 0.01;
};