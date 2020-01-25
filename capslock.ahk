;---- CapsLock Initializer ----
SetCapsLockState, AlwaysOff

;---- CapsLock + \ === CapsLock ----
CapsLock & \::
GetKeyState, CapsLockState, CapsLock, T
if CapsLockState = D
    SetCapsLockState, AlwaysOff
else
    SetCapsLockState, AlwaysOn
KeyWait, \
return

;---- CapsLock === ESC ----
CapsLock::Send, {ESC}

;---- Editor ----
CapsLock & z:: Send, ^z      ; Z = Cancel
CapsLock & x:: Send, ^x      ; X = Cut
CapsLock & c:: Send, ^c      ; C = Copy
CapsLock & v:: Send, ^v      ; V = Paste
CapsLock & a:: Send, ^a      ; A = Select All
CapsLock & g:: Send, ^y      ; Y = Redo
;---- ---- ---- ----
CapsLock & f:: Send, ^f      ; F = Find
CapsLock & w:: Send, ^w      ; W = Close
CapsLock & s:: Send, ^s      ; S = Save
CapsLock & e:: Send, !{F4}   ; E = Exit

;---- CapsLock + D === Copy Current Line ----
CapsLock & d:: send, {Home}+{End}^c{End}

;---- CapsLock + R === AppsKey(Menu Key) ----
CapsLock & r:: Send, {AppsKey}

;---- CapsLock + T === Ctrl + Tab ----
CapsLock & t:: Send, ^{Tab}

;---- ---- ---- ----
CapsLock & =:: Send, ^{WheelUp}
CapsLock & -:: Send, ^{WheelDown}
CapsLock & Space:: Send, {Shift}

;---- Delete ----
CapsLock & ,:: Send, {Del}              ; , = Del char after
CapsLock & .:: Send, ^{Del}             ; . = Del word after
CapsLock & /:: Send, +{End}{Del}        ; / = Del all  after
CapsLock & m:: Send, {BS}               ; m = Del char before
CapsLock & n:: Send, ^{BS}              ; n = Del word before
CapsLock & b:: Send, +{Home}{Del}       ; b = Del all  before

;---- U === Word Before ----
CapsLock & u::
if getkeystate("alt") = 0
    Send, ^{Left}
else
    Send, ^+{Left}
return

;---- O === Word After ----
CapsLock & o::
if getkeystate("alt") = 0
    Send, ^{Right}
else
    Send, ^+{Right}
return

;---- P === PageDown ----
CapsLock & p::
if getkeystate("alt") = 0
    Send, {PgDn}
else
    Send, +{PgDn}
return

;---- Y === PageUp ----
CapsLock & y::
if getkeystate("alt") = 0
    Send, {PgUp}
else
    Send, +{PgUp}
return

;---- H === Home ----
CapsLock & h::
if getkeystate("alt") = 0
    Send, {Home}
else
    Send, +{Home}
return

;---- ; === End ----
CapsLock & `;::
if getkeystate("alt") = 0
    Send, {End}
else
    Send, +{End}
return

;---- J === Left ----
CapsLock & j::
if getkeystate("alt") = 0
    Send, {Left}
else
    Send, +{Left}
return

;---- K === Down ----
CapsLock & k::
if getkeystate("alt") = 0
    Send, {Down}
else
    Send, +{Down}
return

;---- I === Up ----
CapsLock & i::
if getkeystate("alt") = 0
    Send, {Up}
else
    Send, +{Up}
return

;---- L === Right ----
CapsLock & l::
if getkeystate("alt") = 0
    Send, {Right}
else
    Send, +{Right}
return

;---- Mouse Controller ----
CapsLock & Up::    MouseMove, 0, -10, 0, R  ;Mouse Up
CapsLock & Down::  MouseMove, 0, 10, 0, R   ;Mouse Down
CapsLock & Left::  MouseMove, -10, 0, 0, R  ;Mouse Left
CapsLock & Right:: MouseMove, 10, 0, 0, R   ;Mouse Right

;---- CapsLock + Enter(Push Release) === Mouse Left Push(Release) ----
CapsLock & Enter::
SendEvent {Blind}{LButton down}
KeyWait Enter
SendEvent {Blind}{LButton up}
return

;---- Scroll Left ----
CapsLock & WheelUp::    ; 向左滚动
ControlGetFocus, fcontrol, A
Loop 2  ; <-- 增加这个值来加快滚动速度
    SendMessage, 0x114, 0, 0, %fcontrol%, A  ; 0x114 是 WM_HSCROLL, 它后面的 0 是 SB_LINELEFT
return
  
;---- Scroll Right ----
CapsLock & WheelDown::  ; 向右滚动
ControlGetFocus, fcontrol, A
Loop 2  ; <-- 增加这个值来加快滚动速度
    SendMessage, 0x114, 1, 0, %fcontrol%, A  ; 0x114 是 WM_HSCROLL, 它后面的 1 是 SB_LINERIGHT
return