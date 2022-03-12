Gui, GuiName:New ,+AlwaysOnTop +Resize -SysMenu +ToolWindow 
WinSet, Transparent, EEAA99 150, WinTitle

; Gui, Show, Center
Gui, Add, ListBox,Sort,Sort

; 从文件夹中获取文件名列表并把它们放入 ListView:
; Loop, Parse,MyListBox | {
;     MsgBox Selection number %A_Index% is %A_LoopField%.
; }


; 显示窗口并返回. 每当用户点击一行时脚本会发出通知.
Gui, Show
return

MyListView:
if (A_GuiEvent = "DoubleClick")
{
    LV_GetText(RowText, A_EventInfo)  ; 从行的第一个字段中获取文本. 
    ToolTip You double-clicked row number %A_EventInfo%. Text: "%RowText%" 
}  
return 

GuiClose: ; 表示当窗口关闭时脚本应自动退出.
ExitApp 