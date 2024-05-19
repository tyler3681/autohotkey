#NoTrayIcon
CoordMode, Menu, Screen
SplitPath, A_LineFile, ahkl_scriptname, ahkl_scriptdir
ahklaunch := """" A_AhkPath """ """ A_ScriptFullPath """"

; 初期設定
launcherinifile := ".\ini\ahklauncher.ini"

; 設定ファイルが指定されているか確認
if (launcherinifile = "")
{
    MsgBox, Error: launcher INI file is not specified.
    return
}

; 設定ファイルの存在確認
if !FileExist(launcherinifile)
{
    MsgBox, Error: Cannot find launcher INI file: %launcherinifile%
    return
}

; ランチャーメニューの作成
Menu, ahklauncher, Add
Menu, ahklauncher, DeleteAll

Loop, Read, %launcherinifile%
{
    ; [launch]セクションをスキップ
    if InStr(A_LoopReadLine, "[launch]")
        continue

    ; コメント行をスキップ
    if (RegExMatch(A_LoopReadLine, "^\s*;"))
        continue

    ; = が含まれない行をスキップ
    if !InStr(A_LoopReadLine, "=")
    {
        Menu, ahklauncher, Add
        continue
    }

    ; メニュー名とコマンドの取得
    StringSplit, launchermenuname, A_LoopReadLine, =
    Menu, ahklauncher, Add, %launchermenuname1%, launcherlabel
}

Menu, ahklauncher, Show,, 100
return

; コマンドの実行ラベル
launcherlabel:
IniRead, launchercommand, %launcherinifile%, launch, %A_ThisMenuItem%

; %input%が含まれる場合、入力ボックスを表示
if InStr(launchercommand, "%input%")
{
    InputBox, input, Input Parameter, , , 170, 120
    if ErrorLevel
        return
    StringReplace, launchercommand, launchercommand, %input%, %input%, All
}

; %selectfolder%が含まれる場合、フォルダ選択ダイアログを表示
if InStr(launchercommand, "%selectfolder%")
{
    FileSelectFolder, selectfolder, , 0, Select Folder
    if ErrorLevel
        return
    StringReplace, launchercommand, launchercommand, %selectfolder%, %selectfolder%, All
}

; コマンドを実行
Transform, launchercommand, Deref, %launchercommand%
SplitPath, launchercommand, exename, exedir
SetWorkingDir, %exedir%
Run, %launchercommand%
return

; メニューの編集
edit_this_menu:
Run, %ahkl_scriptdir%\..\otbedit\otbedit.exe %launcherinifile%
return

; 何もしない
do_nothing:
return
