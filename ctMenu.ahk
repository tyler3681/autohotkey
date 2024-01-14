
#NoEnv
SendMode,Input
SetTitleMatchMode,3
#InstallKeybdHook
#UseHook
#NoTrayIcon

CoordMode,Mouse,Screen
CoordMode,Menu,Screen
MouseGetPos,mx,my

showCtMenu(){


  Menu,ctMenu,Add,AutoHotkeyフォルダを開く,folderAhkOpen
  Menu,ctMenu,Add,Cドライブを開く,folderCdrvOpen
  Menu,ctMenu,Add,サウンドデバイス,soundDevOpen
  Menu,ctMenu,Add,キャンセル,cmenuCancel

  SplashImage,1:,B M CW00007f,,,wt_ctMenuAHK
  WinSet,Transparent,90,wt_ctMenuAHK
  WinSet,Top,,wt_ctMenuAHK
  SysGet,x,76
  SysGet,y,77
  SysGet,w,78
  SysGet,h,79
  WinMove,wt_ctMenuAHK,,%x%,%y%,%w%,%h%

  Menu,ctMenu,Show,%mx%,%my%

cmenuCancel:
SplashImage,1:off
return


folderAhkOpen:
	run,%A_ScriptDir%
return

folderCdrvOpen:
	run,C:\
return

soundDevOpen:
	Run,mmsys.cpl
return
}