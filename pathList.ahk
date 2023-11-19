#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

Gui,Add,ListView, , No|LV1|LV2|Title
Gui,Add,Button,gButtonOk,OK
Array := Object()
ArrayCount = 0

Loop, Read, pathList.csv, CSV
{
  global Array
  global ArrayCount

  ArrayCount += 1
  LineNumber = %A_Index%
  if (A_Index != 1)
  {
    col1=%LineNumber%
    Loop, Parse, A_LoopReadLine, CSV
    {
      if(A_Index = 1)
      {
        col2=%A_LoopField%
      }else if(A_Index = 2){
        col3=%A_LoopField%
      }else if(A_Index = 3){
        col4=%A_LoopField%
        LV_Add("", col1, col2, col3, col4)
      }else{
        col5=%A_LoopField%
         Array.Insert(col5)
      }
    }
  }
}
LV_ModifyCol()
Gui, Show
Return

ButtonOk:
  global Array
  FocusedRowNumber := LV_GetNext(0, "F")
  LV_GetText(Index, FocusedRowNumber, 1)
  path = % Array[FocusedRowNumber]
  Run explorer.exe %path%
  Return