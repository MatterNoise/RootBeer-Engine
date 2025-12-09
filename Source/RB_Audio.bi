' RootBeer Game Engine (For FreeBASIC)
' Audio driver library

dim shared _AUDIO_MAX_CHANNELS as integer

dim shared _AUDIO_FREQUENCY_DEFAULT as integer
dim shared _AUDIO_CHUNKSIZE_DEFAULT as integer

dim shared _AUDIO_CHANNELTYPE_STEREO as integer

_AUDIO_MAX_CHANNELS = 16

_AUDIO_FREQUENCY_DEFAULT = 44100
_AUDIO_CHUNKSIZE_DEFAULT = 1028

_AUDIO_CHANNELTYPE_STEREO = 2

sub RB_InitAudio()
    if Mix_OpenAudio(_AUDIO_FREQUENCY_DEFAULT, MIX_DEFAULT_FORMAT, _AUDIO_CHANNELTYPE_STEREO, _AUDIO_CHUNKSIZE_DEFAULT) = -1 then
        print "[RB_Audio]: Error while opening the RootBeer Audio driver..."
        
        exit sub
    else
        print "[RB_Audio]: RootBeer Audio driver initialized!"
    end if
    
    Mix_AllocateChannels(_AUDIO_MAX_CHANNELS)
end sub

sub RB_CloseAudio()
    Mix_CloseAudio()
    
    print "[RB_Audio]: RootBeer Audio driver closed!"
end sub

function RB_LoadSoundFile(byref Filename as string) as Mix_Chunk ptr
    dim NewSound as Mix_Chunk ptr
    
    NewSound = Mix_LoadWAV(Filename)
    
    if NewSound = NULL then
        print "[RB_Audio]: Error while loading: '"; Filename; "'!"
    else
        print "[RB_Audio]: Soundfile '"; Filename; "' successfuly loaded!"
    end if
    
    return NewSound
end function
