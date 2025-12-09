' RootBeer Game Engine (For FreeBASIC)
' Made by SR_MatterNoise
'
' -- Versions:
' Version 0.2a (11/16/2025)
' - Font support now included
' - Text can now be printed in the main window
'
' Version 0.1b (11/16/2025)
' - Sound files can be loaded
' 
' Version 0.1a (08/05/2025)
' - Initial tests

#include "SDL2/SDL.bi"
#include "SDL2/SDL_mixer.bi"
#include "SDL2/SDL_image.bi"
#include "SDL2/SDL_ttf.bi"

dim shared RB_MainWindow as SDL_Window ptr
dim shared RB_MainRenderer as SDL_Renderer ptr

#define KEYBOARD_NUM_KEYS 512

dim shared RB_KeyPresseds(KEYBOARD_NUM_KEYS) as ubyte
dim shared RB_KeyHolds(KEYBOARD_NUM_KEYS) as ubyte

dim shared RB_ExitTryed as bool

#include "Source/RB_Utils.bi"
#include "Source/RB_Vector.bi"
#include "Source/RB_Draw.bi"
#include "Source/RB_Keyboard.bi"
#include "Source/RB_Audio.bi"
#include "Source/RB_TextRenderer.bi"

sub RB_InitInstance(byref NewWindowTitle as String, byref NewWindowResolution as Vector2)
    SDL_Init(SDL_INIT_VIDEO)
    TTF_Init()
    IMG_Init(0)
    
    RB_MainWindow = SDL_CreateWindow(NewWindowTitle, SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, NewWindowResolution.X, NewWindowResolution.Y, 0)
    RB_MainRenderer = SDL_CreateRenderer(RB_MainWindow, -1, 0)
    
    print "[RootBeer]: RootBeer instance initialized!"
end sub

sub RB_CloseInstance()
    SDL_DestroyRenderer(RB_MainRenderer)
    SDL_DestroyWindow(RB_MainWindow)
    
    TTF_Quit()
    SDL_Quit()
    
    print "[RootBeer]: RootBeer instance closed!"
end sub

sub RB_PollEvents()
    dim NewEvent as SDL_Event
    
    RB_ExitTryed = false
    
    dim IKeyPress as uinteger
    while IKeyPress <= KEYBOARD_NUM_KEYS
        RB_KeyPresseds(IKeyPress) = 0
        
        IKeyPress = IKeyPress + 1
    wend
    
    while SDL_PollEvent(@NewEvent)
        select case NewEvent.type
        case SDL_QUIT_
            RB_ExitTryed = true
        case SDL_KEYDOWN
            RB_KeyHolds(NewEvent.key.keysym.scancode) = 255
            
            RB_KeyPresseds(NewEvent.key.keysym.scancode) = 255
        case SDL_KEYUP
            RB_KeyHolds(NewEvent.key.keysym.scancode) = 0
            
            RB_KeyPresseds(NewEvent.key.keysym.scancode) = 128
        end select
    wend
end sub

function RB_WindowCloseAttempt() as bool
    if RB_ExitTryed = true then
        return true
    end if
    
    return false
end function
