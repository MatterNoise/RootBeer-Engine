' RootBeer Game Engine (For FreeBASIC)
' Primitives drawing library

dim shared _COLOR_RED as SDL_Color
dim shared _COLOR_ORANGE as SDL_Color
dim shared _COLOR_YELLOW as SDL_Color
dim shared _COLOR_GREEN as SDL_Color
dim shared _COLOR_CYAN as SDL_Color
dim shared _COLOR_BLUE as SDL_Color
dim shared _COLOR_PURPLE as SDL_Color
dim shared _COLOR_PINK as SDL_Color

dim shared _COLOR_BLACK as SDL_Color
dim shared _COLOR_GRAY as SDL_Color
dim shared _COLOR_WHITE as SDL_Color

_COLOR_RED = type<SDL_Color>(255, 0, 0)
_COLOR_ORANGE = type<SDL_Color>(255, 128, 0)
_COLOR_YELLOW = type<SDL_Color>(255, 255, 0)
_COLOR_GREEN = type<SDL_Color>(0, 255, 0)
_COLOR_CYAN = type<SDL_Color>(0, 128, 255)
_COLOR_BLUE = type<SDL_Color>(0, 0, 255)
_COLOR_PURPLE = type<SDL_Color>(128, 0, 255)
_COLOR_PINK = type<SDL_Color>(255, 0, 255)

_COLOR_BLACK = type<SDL_Color>(0, 0, 0)
_COLOR_GRAY = type<SDL_Color>(128, 128, 128)
_COLOR_WHITE = type<SDL_Color>(255, 255, 255)

'sub DrawFilledCircle(Position as Vector2, Radius as integer, ExteriorColor as integer, InteriorColor as integer)
'    Circle (Position.X, Position.Y), Radius, InteriorColor, , , , F
'    
'    Circle (Position.X, Position.Y), Radius, ExteriorColor
'end sub

sub RB_ClearScreen(byref DrawColor as SDL_Color)
    SDL_SetRenderDrawColor(RB_MainRenderer, DrawColor.r, DrawColor.g, DrawColor.b, DrawColor.a)
    SDL_RenderClear(RB_MainRenderer)
end sub

sub RB_DrawFilledRectangle(byref Position as Vector2, byref Scale as Vector2, byref DrawColor as SDL_Color)
    dim TemporalRect as SDL_Rect = (0, 0, 0, 0)
    
    TemporalRect.x = Position.X
    TemporalRect.y = Position.Y
    TemporalRect.w = Scale.X
    TemporalRect.h = Scale.Y
    
    SDL_SetRenderDrawColor(RB_MainRenderer, DrawColor.r, DrawColor.g, DrawColor.b, DrawColor.a)
    SDL_RenderFillRect(RB_MainRenderer, @TemporalRect)
end sub

sub RB_DrawScreen()
    SDL_RenderPresent(RB_MainRenderer)
end sub
