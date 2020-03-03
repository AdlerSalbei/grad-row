#include "script_component.hpp"

/*
 * Author: Salbei
 * Handle rowing Serverside, including multi row.
 *
 * Arguments:
 * 0: Boat <OBJECT>
 * 1: Unit <OBJECT>
 * 2: State <BOOLEAN>
 * 3: Initiator <BOOLEAN>
 *
 * Return Value:
 * None
 *
 * Example:
 * [BoatObj, ACE_player] call grad_row_functions_fnc_handleMultiRow;
 *
 * Public: No
 */

if !(isServer) exitWith {};

params ["_boat", "_unit", ["_state", false], ["_initiator", false]];

if (_initiator) then {
   if (_state) then {

      private _handle = [
         {
            params ["_args", "_handle"];
            _args params ["_boat"];

            private __rowingPlayers = _boat getVariable [QGVAR(_rowingPlayers), []];
            __rowingPlayers = __rowingPlayers - [objNull];

            if !(__rowingPlayers isEqualTo (_boat getVariable [QGVAR(_rowingPlayers), []])) then {
               _boat setVariable [QGVAR(_rowingPlayers), __rowingPlayers, true];
            };

            if (
               !(_boat getVariable [QGVAR(rowing), false])
               || ((count _rowingPlayers) < 1)
            ) exitWith {
               [_handle] call CBA_fnc_removePerFrameHandler;
            };

        },
        0.1,
        [
            _boat,
        ]
      ] call CBA_fnc_addPerFrameHandler;

      _boat setVariable [QGVAR(pfh), _handle];
   }else{
      [_boat getVariable QGVAR(pfh)] call CBA_fnc_removePerFrameHandler;
   };
} else {
   if (isNull (_boat getVariable [QGVAR(mainDigger), objNull])) exitWith {};

   [_boat, _unit, _boat getVariable [QGVAR(progress), 0]] remoteExecCall [FUNC(addDigger), _unit, false];
};
