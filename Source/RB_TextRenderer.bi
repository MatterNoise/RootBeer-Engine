' RootBeer Game Engine (For FreeBASIC)
' Text printing library

declare function RB_GetTextTexture(byref TextFont as TTF_Font ptr, byref TextString as string, byref DrawColor as SDL_Color) as SDL_Texture ptr
declare sub RB_PrintText(byref TextFont as TTF_Font ptr, byref TextString as string, byref TextPosition as Vector2, byref TextScale as integer, byref DrawColor as SDL_Color)

sub RB_PrintText(byref TextFont as TTF_Font ptr, byref TextString as string, byref TextPosition as Vector2, byref TextScale as integer, byref DrawColor as SDL_Color)
    dim TemporalTextTexture as SDL_Texture ptr
    dim TemporalTextRect as SDL_Rect = (TextPosition.x, TextPosition.y, 32, 32)
    
    TemporalTextTexture = RB_GetTextTexture(TextFont, TextString, DrawColor)
    
    TTF_SizeUTF8(TextFont, TextString, @TemporalTextRect.w, @TemporalTextRect.h)
    TemporalTextRect.w = TemporalTextRect.w * TextScale
    TemporalTextRect.h = TemporalTextRect.h * TextScale
    
    SDL_RenderCopy(RB_MainRenderer, TemporalTextTexture, NULL, @TemporalTextRect)
    
    SDL_DestroyTexture(TemporalTextTexture)
end sub

function RB_GetTextTexture(byref TextFont as TTF_Font ptr, byref TextString as string, byref DrawColor as SDL_Color) as SDL_Texture ptr
    dim TemporalTextSurface as SDL_Surface ptr
    dim TemporalTextTexture as SDL_Texture ptr
    
    TemporalTextSurface = TTF_RenderUTF8_Blended(TextFont, TextString, DrawColor)
    TemporalTextTexture = SDL_CreateTextureFromSurface(RB_MainRenderer, TemporalTextSurface)
    
    SDL_FreeSurface(TemporalTextSurface)
    
    return TemporalTextTexture
end function