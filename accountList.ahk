Array := Object()

showAccountList(){
  Gui,Add,ListView, r10 w300, LV1|LV2
  Gui,Add,Button, hidden Default,AcOK

  ;csvファイルを読み込んでListViewを作成
  Loop, Read, ./ini/accountList.csv, CSV
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
          LV_Add("", col1, col2)
        }else{
          col3=%A_LoopField%
           Array.Push(col3)
        }
      }
    }
  }
  LV_ModifyCol()
  Gui, Show, , accountList
}
Return

ButtonAcOK:
global Array
GuiControlGet, FocusedControl, FocusV
FocusedRowNumber := LV_GetNext(0, "F")
LV_GetText(Index, FocusedRowNumber, 1)
info = % Array[FocusedRowNumber]
Clipboard := info
Return
