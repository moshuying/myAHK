#SingleInstance force
 #NoEnv
 SetBatchLines, -1

transN := 200 ; 透明度

; #################################
 ; GUI
 ; #################################
 ;
 Gui, +AlwaysOnTop +ToolWindow -SysMenu -Caption +LastFound
 Gui, Margin, 0, 0
 WinSet, ExStyle, +0x20 ; 鼠标穿透
WinSet, Transparent, %transN%
 Gui, Color, Black
 Gui, Font, cWhite s50 bold, Arial
 Gui, Add, Text, vHotkeyText Center y20

; #################################
 ; 绑定按键
; #################################
 ;
Loop, 95
 Hotkey, % "~*" Chr(A_Index + 31), Display

Loop, 24 ; F1-F24
 Hotkey, % "~*F" A_Index, Display

Loop, 10 ; Numpad0 - Numpad9
 Hotkey, % "~*Numpad" A_Index - 1, Display

Otherkeys := "NumpadDiv|NumpadMult|NumpadAdd|NumpadSub|NumpadEnter|Tab|Enter|Esc|BackSpace|Del|Insert|Home|End|PgUp|PgDn|Up|Down|Left|Right|ScrollLock|CapsLock|NumLock|Pause"
 Loop, parse, Otherkeys, |
 Hotkey, % "~*" A_LoopField, Display

return

; #################################
 ; 显示按键
; #################################
 ;
Display:
 If A_ThisHotkey =
 Return

mods := "Ctrl|Shift|Alt|LWin|RWin"
 prefix =

Loop, Parse, mods, |
 if GetKeyState(A_LoopField)
 prefix := prefix A_LoopField " + "

if !prefix ; 如果没有组合键则不显示
return

key := SubStr(A_ThisHotkey, 3)
 if (key = " ")
 key := "Space"

ShowHotkey(prefix key)
 FadeOut()
 Return

; ===================================================================================
 ShowHotkey(Hotkey)
 {
 GuiControl,, HotkeyText, %Hotkey%

WinGetPos, ActWin_X, ActWin_Y, ActWin_W, ActWin_H, A
 text_w := ActWin_W, gui_y := (ActWin_Y+ActWin_H) - 115 - 50
 GuiControl, Move, HotkeyText, w%text_w% center

Gui, Show, NoActivate x%ActWin_X% y%gui_y% h115 w%text_w%
 }

FadeOut(sleep = 1000)
 {
 global transN

Sleep, %Sleep%
 Gui, +LastFound

Loop, % transN
 WinSet, Transparent, % (A_Index - transN - 1) * -1

Gui, Hide
 WinSet, Transparent, % transN
 } 