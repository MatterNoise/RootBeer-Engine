' RootBeer Game Engine (For FreeBASIC)
' Keyboard handling library

function RB_IsKeyPressed(PressedKey as integer) as bool
    if RB_KeyHolds(PressedKey) = 255 then
        return true
    end if
    
    return false
end function

function RB_IsKeyReleased(PressedKey as integer) as bool
    if RB_KeyHolds(PressedKey) = 255 then
        return true
    end if
    
    return false
end function

function RB_IsKeyHold(PressedKey as integer) as bool
    if RB_KeyHolds(PressedKey) = 255 then
        return true
    end if
    
    return false
end function
