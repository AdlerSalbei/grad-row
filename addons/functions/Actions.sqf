[
    localize LSTRING(category), 
    QGVAR(stop), 
    localize LSTRING(stop), 
    {
        [_this, []] call FUNC(row);
    }, 
    {

    }, 
    [DIK_X, [true, false, false]],
    true, 
    0.01, 
    false
] call CBA_fnc_addKeybind;

[
    localize LSTRING(category), 
    QGVAR(forward), 
    localize LSTRING(forward), 
    {
        [_this, [0,1,0]] call FUNC(row);
    }, 
    {}, 
    [DIK_W, [true, false, false]],
    true, 
    0.01, 
    false
] call CBA_fnc_addKeybind;

[
    localize LSTRING(category), 
    QGVAR(backword), 
    localize LSTRING(backword), 
    {
        [_this, [0,-1,0]] call FUNC(row);
    }, 
    {}, 
    [DIK_S, [true, false, false]],
    true, 
    0.01, 
    false
] call CBA_fnc_addKeybind;

[
    localize LSTRING(category), 
    QGVAR(rotateLeft), 
    localize LSTRING(rotateLeft), 
    {
        [_this, "left"] call FUNC(startRotate);
    }, 
    {
        [_this, "left"] call FUNC(stopRotate);
    }, 
    [DIK_A, [true, false, false]]
] call CBA_fnc_addKeybind;

[
    localize LSTRING(category), 
    QGVAR(rotateRight), 
    localize LSTRING(rotateRight), 
    {
        [_this, "right"] call FUNC(startRotate);
    }, 
    {
        [_this, "right"] call FUNC(stopRotate);
    },  
    [DIK_D, [true, false, false]]
] call CBA_fnc_addKeybind;