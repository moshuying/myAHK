Gui, Add, Text,, Pick a file to launch from the list below.`nTo cancel, press ESCAPE or close this window.
Gui, Add, ListBox, vMyListBox gMyListBox w640 r10
Gui, Add, Button, Default, OK
Loop, ./*.*  ; 根据您的需要改变此文件和通配符模式.
{
    GuiControl,, MyListBox, %A_LoopFileFullPath%
}
Gui, Show
return

MyListBox:
if (A_GuiEvent != "DoubleClick")
    return
; 否则, 用户双击了列表中的项目, 所以把它和点击 OK 按钮进行相同的处理.
; 所以直接进入下一个标签.
ButtonOK:
GuiControlGet, MyListBox  ; 获取列表框中当前选择的项目.
MsgBox, 4,, Would you you like to launch the file or document below?`n`n%MyListBox%
IfMsgBox, No
    return
; 否则, 运行此文件:
Run, %MyListBox%,, UseErrorLevel
if (ErrorLevel = "ERROR")
    MsgBox Could not launch the specified file.  Perhaps it is not associated with anything.
return

GuiClose:
GuiEscape:
ExitApp