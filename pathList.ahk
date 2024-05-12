Array := Object()

showPathList(){
  Gui,Add,ListView, r10 w300, LV1|LV2|Title
  Gui,Add,Button, hidden Default,OK

  ;csvファイルを読み込んでListViewを作成
  Loop, Read, "%A_AhkPath%" "\ini\pathList.csv", CSV
  {
    global Array

    if (A_Index != 1)
    {
      Loop, Parse, A_LoopReadLine, CSV
      {
        if(A_Index = 1)
        {
          col1=%A_LoopField%
        }else if(A_Index = 2){
          col2=%A_LoopField%
        }else if(A_Index = 3){
          col3=%A_LoopField%
          LV_Add("", col1, col2, col3)
        }else{
          col4=%A_LoopField%
           Array.Insert(col4)
        }
      }
    }
  }
  LV_ModifyCol()
  Gui, Show, , pathList
}
Return

ButtonOK:
  global Array
  GuiControlGet, FocusedControl, FocusV
FocusedRowNumber := LV_GetNext(0, "F")
LV_GetText(Index, FocusedRowNumber, 1)
path = % Array[FocusedRowNumber]
Run explorer.exe %path%
Return

GuiClose:
GuiEscape:
Gui, Destroy