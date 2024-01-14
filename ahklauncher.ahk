/*
[launch]
menuname1=command1
menuname2=command2
なファイルを作って、引数に指定。
=のない行は[launch]以外全部セパレタ。
日本語不可っぽい。
%input%と%selectfolder%が使用可能。
あと、%ahklaunch%使える。
例:mainmenu=%ahklaunch% "ahklauncher.ini"
*/
#NoTrayIcon 
CoordMode,menu,screen
SplitPath, A_LineFile, ahkl_scriptname, ahkl_scriptdir
ahklaunch = "%A_AhkPath%" "%A_ScriptFullPath%"
;;;;;;;;;;;;;;;;;;;;;;;;;;
;ファイル読み込み
launcherinifile := "C:\git\autohotkey\ini\ahklauncher.ini"
if launcherinifile = ""
goto cannotfindlauncherini
IfNotExist, %launcherinifile%
goto cannotfindlauncherini
;;;;;;;;;;;;;;;;;;;;;;;;;;
;ランチャメニュー作成
menu,ahklauncher,add
menu,ahklauncher,deleteall
Loop, Read, %launcherinifile%
{
 IfInString,A_LoopReadLine,[launch]
  continue
 if ( RegExMatch( "%A_LoopReadLine%" , "^;" ) ) ;コメントうまくできん
  continue
 IfNotInString,A_LoopReadLine,=
 {
  menu,ahklauncher,add
  continue
 }
 StringSplit,launchermenuname,A_LoopReadLine,=
 menu,ahklauncher,add,%launchermenuname1%,launcherlabel
}
menu,ahklauncher,add
Menu,ahklauncher,Show,,100
return

cannotfindlauncherini:

menu,ahklauncher,add,edit this menu,edit_this_menu
menu,ahklauncher,add,do nothing,do_nothing

;Menu,ahklauncher,Show,300,100
Menu,ahklauncher,Show,,100

return

;;;;;;;;;;;;;;;;;;;;
;ランチャ用ラベル
launcherlabel:
IniRead,launchercommand,%launcherinifile%,launch,%A_ThisMenuItem%

IfInString,launchercommand,`%input`% ;%input%代入
InputBox, input , input parameter, , , 170, 120

IfInString,launchercommand,`%selectfolder`% ;%selectfolder%代入
FileSelectFolder,selectfolder,,0,Select Folder

Transform, launchercommand, Deref, %launchercommand% ;変数を全部展開
SplitPath, launchercommand, exename, exedir
SetWorkingDir, %exedir%
;msgbox,%launchercommand%
run,%launchercommand%
return

edit_this_menu:
run,%ahkl_scriptdir%\..\otbedit\otbedit.exe %launcherinifile%
do_nothing:
return

