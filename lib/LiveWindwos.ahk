OnExit handle_exit
    
p_w = 200                                    ; thumbnail width
p_h = 150                                    ; height
Left    := A_ScreenWidth - p_w               ; initial position
Height1 := A_ScreenHeight / 4
Height2 := A_ScreenHeight - Height1
Trans :=  "Off"                         ; transparency level

Hotkey, #w, AddWatch
Hotkey, #q, RemoveWatch
Hotkey, #a, ShowHideGui
Hotkey, ^+LButton , define_region

Gui +AlwaysOnTop  +Owner +Resize +ToolWindow ; window for the dock

ypic =0
Loop 10,                                     ; prepare 10 thumbs to be clicked
{
  Gui, Add, Pic , gRestoreWin x0 y%ypic% w%p_w% h100 vPic%a_index%			; add dock-slots to gui
  ypic +=100
}

Gui Show, NoActivate w%p_w% h32 x%Left% y%Height2%, LiveWindows

WinGet LiveWindowsID, id, LiveWindows
WinSet, Transparent, %Trans%, LiveWindows       ; Make Window Transparent for coolness and usability

hdc_frame := DllCall( "GetDC", UInt, LiveWindowsID )
hdc_buffer := DllCall("gdi32.dll\CreateCompatibleDC", UInt,  hdc_frame)  ; buffer
hbm_buffer := DllCall("gdi32.dll\CreateCompatibleBitmap", UInt,hdc_frame, Int,A_ScreenWidth, Int,A_ScreenHeight)
DllCall( "gdi32.dll\SelectObject", UInt,hdc_buffer, UInt,hbm_buffer)

; comment this line for speed but less quality
DllCall( "gdi32.dll\SetStretchBltMode", "uint", hdc_frame, "int", 4 )  ; Halftone better quality with stretch

SetTimer update_dock, 1                   ; x sec update
                                             ; flow through 1st call (is efficient, but introduces bugs easily!)
update_dock:
  WinGetPos ,,, p_w2, p_h2, LiveWindows       ; get size of LiveWindows Window
  p_w2 := p_w2 -8                             ; adjust sizes (margins, borders ..)

  ypos= 0                                    ; offset for each thumbnail
  nr  = 0                                    ; which thumbnail

  WinGet ids, list,,,Program Manager         ; all active windows-tasks (processes)
  Loop %ids% {
     task_id := ids%a_index%                 ; id of this window
     WinGetPos ,,, w, h, ahk_id %task_id%
     WinGetTitle,title,ahk_id %task_id%
                                             ; try to match mediumsize dialog-boxes like alerts/copy or userdefined with #w
     if ( title <> "LiveWindows" and title <> "" and title <> " "  and (( w > 300 and h < 300 and h > 50 ) or watch_me_%task_id% = 1 ) )
     {              
      
      DllCall("PrintWindow", UInt,task_id, UInt,hdc_buffer, UInt,0)
      
      wx1 := watch_me_x1_%task_id%
      wy1 := watch_me_y1_%task_id%
      ww  := watch_me_w_%task_id%
      wh  := watch_me_h_%task_id%
      nr  += 1
      
      ; ToolTip, %task_id% %current_id% "..." %title% "x" %wx1% "v" %onoff%

       if  wx1 <>
       {
        h1 := wh * ( p_w2 / ww )                  ; autosize (seems not exaclty right?)
      
        DllCall("gdi32.dll\StretchBlt", UInt,hdc_frame, Int,0, Int,ypos, Int,p_w2, Int,h1
              , UInt,hdc_buffer, Int, wx1, Int,wy1, Int,ww, Int,wh ,UInt,0xCC0020) ; SRCCOPY
       }
       else
       {
         h1 := h * ( p_w2 / w )                  ; autosize (seems not exaclty right?)
         DllCall("gdi32.dll\StretchBlt", UInt,hdc_frame, Int,0, Int,ypos, Int,p_w2, Int,h1
              , UInt,hdc_buffer, Int,0, Int,0, Int,w, Int,h ,UInt,0xCC0020) ; SRCCOPY
       }

       watch_me_id_%nr% := task_id    ; store src-window id for later restore
       watch_me_title_%nr% := title

       GuiControl, Move, Pic%nr%, X0 Y%ypos% W%p_w2% H%h1%
       
       ypos += h1                          ; move down to next thumbnail-position
    }
  }
  WinMove LiveWindows,,,,,ypos +32         ; resize to make pseudo-transparent
Return

AddWatch:
    WinGet current_id , id , A         ; get ahk_id of foreground window
   
    watch_me_%current_id% = 1
Return

RemoveWatch:
    WinGet current_id , id , A         ; get ahk_id of foreground window

    watch_me_%current_id% =
    watch_me_x1_%current_id% = 
Return

RestoreWin: 
    StringReplace, pos , A_GuiControl, Pic
    xid    := watch_me_id_%pos%
    WinActivate, ahk_id %xid%
    Gosub, ScreenBottom
Return

ShowHideGui:
   if ( DllCall( "IsWindowVisible", "uint", LiveWindowsID ) )
      Gui, Hide
   else
      Gui, Show 
Return 


define_region:
   CoordMode, Mouse, Relative                ; relative to window not screen
   MouseGetPos, start_x, start_y             ; start position of mouse
   ToolTip, %A_Space%, start_x, start_y      ; pseudo layer
   WinSet, Transparent, 150, ahk_class tooltips_class32 ; draw "layer" as feedback
   SetTimer mouse, 50                        ; check every 50ms for mouseup
Return

mouse:
   MouseGetPos, current_x, current_y
   WinMove, ahk_class tooltips_class32, , , , % current_x - start_x, % current_y - start_y
   If GetKeyState("LButton", "P")
      Return
   SetTimer mouse, OFF
   ToolTip
   MouseGetPos, end_x, end_y
   ;TrayTip, ,you selected %start_x% %start_y% %end_x% %end_y%, , 5

   width := end_x - start_x
   height := end_y - start_y

   WinGet current_id , id , A         ; get ahk_id of foreground window

   ;WinGetTitle,title, ahk_id %current_id%
   ;tooltip, "current" %current_id% %title%


   watch_me_x1_%current_id% := start_x
   watch_me_x2_%current_id% := end_x
   watch_me_y1_%current_id% := start_y
   watch_me_y2_%current_id% := end_y
   watch_me_w_%current_id%  := width
   watch_me_h_%current_id%  := height

   ;WinGetPos ,src_x, src_y, src_w, src_h, A
   ;watch_me_src_y_%current_id% := src_y
   ;watch_me_src_x_%current_id% := src_x

    Gosub, ScreenBottom         ; make it minimized
return

ScreenBottom:
   ; when clicked then use current window
   WinGet current_id , id , A         ; get ahk_id of foreground window

   minimized := minimized_state_%current_id%
   screenborder_x := 
   screenborder_y := A_ScreenHeight - 24
   if minimized = 
   {
     minimized_state_%current_id% := 1
     WinGetPos ,wx,wy,ww,wh, ahk_id %current_id%
     minmized_x_%current_id% := wx
     minmized_y_%current_id% := wy

     WinMove , ahk_id %current_id%,, screenborder_x,screenborder_y       ; move to screenborder (keep x-pos)
   }
   else
   {
      x := minmized_x_%current_id% 
      y := minmized_y_%current_id% 

      WinMove , ahk_id %current_id%,, x,y       ; restore
      minimized_state_%current_id% :=
   }
return 

RestoreAll:
    WinGet, ids, list,,, Program Manager
	Loop, %ids%
	{
		StringTrimRight, id, ids%a_index%, 0				; find the id of this window
	    if minimized_state_%id% = 1
        {
          WinActivate, ahk_id %id%
          Gosub, ScreenBottom
        }    
	}
Return

GuiClose:
handle_exit:
   DllCall("gdi32.dll\DeleteObject", UInt,h_region )
   DllCall("gdi32.dll\DeleteObject", UInt,hbm_buffer)
   DllCall("gdi32.dll\DeleteDC", UInt,hdc_frame )
   DllCall("gdi32.dll\DeleteDC", UInt,hdc_buffer)
   Gosub, RestoreAll
ExitApp 