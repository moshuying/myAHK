SetCapsLockState, AlwaysOff
;***************************模拟鼠标控制*****************************
    ;|+=======================================================+|
    ;||                                                       ||
    ;|+-------------------------+-----------------------------+|
    ;||      CapsLock+d         |    开启                     ||
    ;||      CapsLock+f         |    关闭                     ||
    ;||                         |                             ||
    ;|+-------------------------+-----------------------------+|
    ;||        d                |        左键                 ||
    ;||        f                |        右键                 ||
    ;||        ikjl             |      鼠标移动               ||
    ;|+=======================================================+|
    #SingleInstance
    count = 0
    JoyMultiplier = 0.20
    JoyThreshold = 3
    JoyThresholdUpper := 50 + JoyThreshold
    JoyThresholdLower := 50 - JoyThreshold
    YAxisMultiplier = -1
    SetTimer, WatchKeyboard, off ;启动时关闭模拟鼠标
    Hotkey, d, Off
    Hotkey, f, Off
    Hotkey, i, Off
    Hotkey, k, Off
    Hotkey, j, Off
    Hotkey, l, Off
    Return

    CapsLock & f::
        SetTimer, WatchKeyboard, Off
        Hotkey, d, Off
        Hotkey, f, Off
        Hotkey, i, Off
        Hotkey, k, Off
        Hotkey, j, Off
        Hotkey, l, Off
    Return

    CapsLock & d::
        SetTimer, WatchKeyboard,10
        Hotkey, d, On
        Hotkey, f, On
        Hotkey, i, On
        Hotkey, k, On
        Hotkey, j, On
        Hotkey, l, On
    Return

    empty:
    Return
    WatchKeyboard:
    MouseNeedsToBeMoved := false  ; Set default.
    JoyMultiplier+=0.01
    SetFormat, float, 03
    i:=GetKeyState("i","p")
    k:=GetKeyState("k","p")
    j:=GetKeyState("j","p")
    l:=GetKeyState("l","p")
    if(l)
    {
        MouseNeedsToBeMoved := true
        DeltaX := 10
    }
    else if(j)
    {
        MouseNeedsToBeMoved := true
        DeltaX := -10
    }
    else
        DeltaX = 0
    if (i)
    {
        MouseNeedsToBeMoved := true
        DeltaY := 10
    }
    else if (k)
    {
        MouseNeedsToBeMoved := true
        DeltaY := -10
    }
    else
        DeltaY = 0
    if MouseNeedsToBeMoved
    {
        SetMouseDelay, -1  ; Makes movement smoother.
        MouseMove, DeltaX * JoyMultiplier, DeltaY * JoyMultiplier * YAxisMultiplier, 0, R
    }
    Else
    count++
    If(count>20){
    JoyMultiplier = 0.30
    count=0
    }
    return

    ButtonLeft:
    SetMouseDelay, -1  ; Makes movement smoother.
    MouseClick, left,,, 1, 0, D  ; Hold down the left mouse button.
    SetTimer, WaitForLeftButtonUp, 10
    return

    ButtonRight:
    SetMouseDelay, -1  ; Makes movement smoother.
    MouseClick, right,,, 1, 0, D  ; Hold down the right mouse button.
    SetTimer, WaitForRightButtonUp, 10
    return


    WaitForLeftButtonUp:
    if GetKeyState("d")
        return  ; The button is still, down, so keep waiting.
    ; Otherwise, the button has been released.
    SetTimer, WaitForLeftButtonUp, off
    SetMouseDelay, -1  ; Makes movement smoother.
    MouseClick, left,,, 1, 0, U  ; Release the mouse button.
    return

    WaitForRightButtonUp:
    if GetKeyState("f")
        return  ; The button is still, down, so keep waiting.
    ; Otherwise, the button has been released.
    SetTimer, WaitForRightButtonUp, off
    MouseClick, right,,, 1, 0, U  ; Release the mouse button.
    return

;/****************滚动当前鼠标下的窗口的滚动条********************/
    GroupAdd,canNotWheel,ahk_class Windows.UI.Core.CoreWindow ;开始菜单
    GroupAdd,canNotWheel,ahk_class ApplicationFrameWindow ;uwp应用
    GroupAdd,canNotWheel,ahk_class HH Parent
    #IfwinNotActive,ahk_group canNotWheel
    #IfWinActive,ahk_group canNotWheel
    coordmode,Mouse,screen
    WheelUp::
    WheelDown::
       MouseWheelSetp:=(A_ThisHotkey="WheelUp") ? 120 : -120
       MouseGetPos, MWAW_x, MWAW_y
       MWAW_Hwnd := DllCall( "WindowFromPoint", "int", MWAW_x, "int", MWAW_y )
       SendMessage, 0x20A, MouseWheelSetp << 16, ( MWAW_y << 16 )|MWAW_x,, ahk_id %MWAW_Hwnd%
       return
    #If
;/*****************在非代码编辑器内实现括号补全*****************************/
    ;|+=======================================================+|
    ;||                热键 caps + 9                          ||
    ;|+=======================================================+|
        #if
            CapsLock & 6::
                bracketAutoCpOn := !bracketAutoCpOn
        Return
        #if bracketAutoCpOn
        {
            $(::
                send,{(}
                send,{)}
                send,{left}
            return
            $[::
                send,{[}
                send,{]}
                send,{left}
            return
            ${::
                send,{{}
                send,{}}
                send,{left}
            return
            $"::
                send,{"}
                send,{"}
                send,{left}
            return
            $'::
                send,{'}
                send,{'}
                send,{left}
            return
        }
        #if

;/**************************系统按键修改*****************************/
    ;|+=======================================================+|
    ;||       CapsLock & a      |       Caps                  ||
    ;|+=======================================================+|

    CapsLock & a::
    GetKeyState, CapsLockState, CapsLock, T
    if CapsLockState = D
        SetCapsLockState, AlwaysOff
    else
        SetCapsLockState, AlwaysOn
    KeyWait, a


;/***********************键盘编辑用的热键*****************************/
    ;|+=======================================================+|
    ;||      CapsLock & [       |      WheelUp                ||
    ;||      CapsLock & ]       |      WheelDown              ||
    ;||      CapsLock & 1       |        `                    ||
    ;||      CapsLock & 2       |        ~                    ||
    ;|+-------------------------+-----------------------------+|
    ;||      CapsLock & ijkl    |        上下左右             ||
    ;||  CapsLock & alt & ik    |        sublime 内光标       ||
    ;||  CapsLock & alt & jl    |        单词移动             ||
    ;||  CapsLock & ctl & + jl  |        选中单词             ||
    ;||  CapsLock & ctr & jk    |        sublime 内 行移动    ||
    ;|+-------------------------+-----------------------------+|
    ;||    CapsLock & g         |         AppsKey             ||
    ;||    CapsLock & o         |         delete              ||
    ;||    CapsLock & p         |         BackSpace           ||
    ;||    CapsLock & h         |         Home                ||
    ;||    CapsLock & n         |         End                 ||
    ;|| CapsLock & shift & h    |         shift+home          ||
    ;|| CapsLock & shift & n    |         shift+end           ||
    ;|| CapsLock & alt & h      |         ctrl+home           ||
    ;|| CapsLock & alt & n      |         ctrl+end            ||
    ;||  win & ctrl & tab       |      ctrl+win+{right}       ||
    ;||  win & ctrl & shift+tab |      ctrl+win+{left}        ||
    ;||    CapsLock & ;         |            =                ||
    ;||    CapsLock & '         |            +                ||
    ;|+-------------------------------------------------------+|
    ;||                      音量控制                         ||
    ;|+-------------------------+-----------------------------+|
    ;||         XButton1        |         Volume_Up           ||
    ;||         XButton2        |         Volume_Down         ||
    ;|| XButton2 &  WheelDown   |         Volume_Down         ||
    ;|| XButton2 &  WheelUp     |         Volume_Up           ||
    ;|| CapsLock & PgUp         |         Volume_Up           ||
    ;|| CapsLock & PgDn         |         Volume_Down         ||
    ;|+=======================================================+|
    ;滑动
    CapsLock & [::send,{WheelUp}
    CapsLock & ]::send,{WheelDown}
    ;`&&~
    CapsLock & 1::send,``
    CapsLock & 2::send,{~}
    ; move left
    CapsLock & j::
    if GetKeyState("LShift", "P")
        send, +{Left}
    else if GetKeyState("LAlt", "P")
        send,^{left}
    else if GetKeyState("LControl", "P")
        send,^+{left}
    else
        send, {Left}
    Return
    ; move right
    CapsLock & l::
    if GetKeyState("LShift", "P")
        send, +{right}
    else if GetKeyState("LAlt", "P")
        send,^{right}
    else if GetKeyState("LControl", "P")
        send,^+{right}
    else
        send, {right}
    Return
    ; move up
    CapsLock & i::
    if GetKeyState("LShift", "P")
        send, +{up}
    else if GetKeyState("LAlt", "P")
        send,^!{up}
    else if GetKeyState("LControl", "P")
        send,^+{up}
    else
        send, {up}
    Return
    ; move down
    CapsLock & k::
    if GetKeyState("LShift", "P")
        send, +{down}
    else if GetKeyState("LAlt", "P")
        send,^!{down}
    else if GetKeyState("LControl", "P")
        send,^+{down}
    else
        send, {down}
    Return
    ;home
    CapsLock & h::
    if GetKeyState("LShift", "P")
        send, +{home}
    else if GetKeyState("LAlt", "P")
        send, ^{home}
    else
        send, {home}
    Return
    ; end
    CapsLock & n::
        if GetKeyState("LShift", "P")
            send, +{end}
        else if GetKeyState("LAlt", "P")
            send, ^{end}
        else
            send, {end}
    Return
    ;ctrl win {left/right}
    Lwin & tab::
        if GetKeyState("LCtrl","P")
            if GetKeyState("Lshift","P")
                send,^#{left}
            else
                send,^#{right}
        Else
            send,#{tab}
    Return
    ;AppsKey
    CapsLock & g:: Send, {AppsKey}
    ;delelte
    CapsLock & o::send,{delete} 
    CapsLock & p::send,{BackSpace}
    ;= + ()
    CapsLock & `;::send,{=}
    CapsLock & '::send,{+}
    ;!F4
    LCtrl & w::
        if GetKeyState("alt"){
            Send, !{F4}
        }Else{
            Send, ^w
        }                                                                                                                                    ;|
    return

;鼠标键盘控制音量
    XButton2 & WheelDown::send,{Volume_Down}
    XButton2 & WheelUp::send,{Volume_Up}
    CapsLock & PgUp::send,{Volume_Up}
    CapsLock & PgDn::send,{Volume_Down}

; 打开文件夹
    CapsLock & r::
        FileSelectFolder, OutputVar, *D:\mygit, 3
        OutputVar := RegExReplace(Folder, "\\$")  ; 移除默认的反斜杠, 如果存在.
        if OutputVar =
            MsgBox, You didn't select a folder.
        else
            MsgBox, You selected folder "%OutputVar%".
    Return

    CapsLock & c::
        run calc.exe
    Return
; 获取路径
    ^#c::
        send ^c
        sleep,200
        clipboard=%clipboard% ;%null%
        tooltip,%clipboard%
        sleep,500
        tooltip,
    return
; 循环（重复）按键
    ^#a::
        Input,AUTOCLICK, L1 M
        ToolTip, 连续点击{%AUTOCLICK%}键中，按右Shift取消连点
        SetTimer, RemoveToolTip, -1000
        Sleep,300
        loop
        {
            Send,{%AUTOCLICK%}
            Sleep,70
            if GetKeyState("RShift","P") 
            {
                SetTimer, RemoveToolTip, -10
                break
            }
        }
    Return
; 媒体键增强
    >!>^Right::send,{Media_Next}
    >!>^Left::send,{Media_Prev}
    >!>^Space::send,{Media_Play_Pause}
;额外补充
::email::默认文本填充
RemoveToolTip:
ToolTip
return
