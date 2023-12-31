grep(){
	global gArray
	gArray := Object()
	FileRead, Allfile, restart_apl.list
	filearr := StrSplit(Allfile, "`n","`r")
	InputBox, inst, GREP, 文字を入力してください
	If ErrorLebel = 0
	Gui, Add, ListView, x0 y0 w450 h300 Grid, ファイル
	Gui, Add, Button, gOK W100 X25 Default , 表示
	Gui, Add, Button, W100 X+0 , Cancel
	for k, v in filearr {
		if InStr(v,inst) {
			SplitPath, v, OutFileName
			LV_Add("",OutFileName)
			gArray.Insert(v)
		}
	}
	Gui, Show, Center h350 w450, File Launcher
	LV_ModifyCol(1, "AutoHdr")
	Return
}

OK:
RowNumber = 0
Loop
{
	RowNumber := LV_GetNext(RowNumber)
	if not RowNumber {
		break
	}
	LV_GetText(RowText, RowNumber, 1)
	filePath := gArray[RowNumber]
	Run, explorer.exe %filePath%
}
Return