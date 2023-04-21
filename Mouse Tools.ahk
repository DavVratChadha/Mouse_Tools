#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Map Crtl+Shift+ESC to close all instances of AutoHotkey.exe
^+Esc::
   Process, Close, ahk_exe AutoHotkey.exe 
   ExitApp ; Exit the current script
Return

SetTitleMatchMode, 2 ;
SetBatchLines, -1
#Persistent
#InstallKeybdHook
#UseHook
#MaxHotkeysPerInterval 10000

; Map Right+Left mouse click to Ctrl+W to close active page.
RButton::
{
    if (GetKeyState("RButton", "P") && GetKeyState("LButton", "P"))
    {
        Send {Ctrl down}{w}{Ctrl up}
        Sleep 500
	  return
    }
    else
    {
        Send {RButton}
        return
    }
}

; Map Shift + scroll events to changing volume
~Shift & WheelUp::
    Send {Volume_Down}
    Return

~Shift & WheelDown::
    Send {Volume_Up}
    Return

; Map Shift + Backward/forward buttons on mouse to media next/previous
~Shift & XButton2::
    Send {Media_Next}
    Return

~Shift & XButton1::
    Send {Media_Prev}
    Return

; Map shift + middle mouse button to Media Play/Pause
~Shift & MButton::
    Send {Media_Play_Pause}
    Return

; Map shift + right-click to put the song on repeat in Spotify
~Shift & RButton::
IfWinExist, ahk_exe Spotify.exe
{
    WinGet, prevWin, ID, A
    WinActivate, ahk_exe Spotify.exe
    SendInput ^r
    WinActivate, ahk_id %prevWin%
    Return
}