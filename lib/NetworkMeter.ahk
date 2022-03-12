; Posted at http://www.autohotkey.com/forum/viewtopic.php?p=113890#113890

#SingleInstance, Force
Process, Priority,, High
OnExit, Quit 
oRC := 0, oWC := 0


; Run, diskperf.exe -y   ; Execute it once to enable Disk Performance monitoring. 

SetTimer, HDD_Monitor, ;500

hDrv := DllCall( "CreateFile", Str,"\\.\PhysicalDrive0", Uint,0 ,Uint,3, Uint,0, Uint,3
                , Uint,0, Uint,0 )

Gui, -Caption +Border +AlwaysOnTop +ToolWindow
Gui, Color, EEAA99  
Gui, +LastFound  
WinSet, TransColor, EEAA99  
Gui, Add, Progress,     w60 h9 cGreen -0x1 vRead
Gui, Add, Progress, x+5 w60 h9 cRed   -0x1 vWrite
Gui, Show, x780 y3 , HDD Monitor                 ; Adjust X & Y to suit your screen res
Return

HDD_Monitor:
  VarSetCapacity(dp, 88)
  DllCall( "DeviceIoControl", Uint,hDrv, Uint,0x00070020, Uint,0, Uint,0, Uint, &dp
          , Uint,88, UintP,nReturn, Uint,0 ) 

  nRC := *(&dp+40) | *(&dp+41) << 8 | *(&dp+42) << 16 | *(&dp+43) << 24
  nWC := *(&dp+44) | *(&dp+45) << 8 | *(&dp+46) << 16 | *(&dp+47) << 24

  RC := Round(100-(100*(1/(1+(nRC-oRC)))))  ,  WC := Round(100-(100*(1/(1+(nWC-oWC)))))

  GuiControl,, Read , %RC%
  GuiControl,, Write, %WC%
  oRC := nRC ,  oWC := nWC
Return

Quit:
  DllCall("CloseHandle", "Uint", hDrv) 
  ExitApp 
Return