#include pathList.ahk
#include accountList.ahk

;もう一つのプロセスが起動された場合、既存プロセスを終了して起動
#SingleInstance, Force
;Inputモードに設定
SendMode Input
;スクリプトのあるディレクトリを作業ディレクトリにする
SetWorkingDir, %A_ScriptDir%

;「変換」で「変換」
vk1D::return
vk1C::return

;01.変換キー(右親指)との組み合わせ
;▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽
;【上段】
;vk1C & tab::AltTabMenu      ;変換 + Tab = Alt+Tab
vk1C & r::Send, {F2}        ;変換 + R = F2（名前の変更）
vk1C & p::showPathList()
;【中段】
vk1C & h::Send, !{Left}
vk1C & l::Send, !{Right}
vk1C & a::showAccountList()
;【下段】
vk1C & c::Send, !c          ;変換 + c = Alt+c(CLaunch起動。)
vk1C & z::Reload
vk1C & b::
	if(WinExist("ahk_class #32768")){
		return	;何かのメニュー表示中は出さない
	}
	CoordMode,Mouse,Screen
	Run,C:\Program Files\AutoHotkey\AutoHotkey.exe CtMenu.ahk
	;メニューにフォーカスを移す処理をして終わる
	WinWait,ahk_class #32768,,2
	WinGetPos,wx,wy,,,ahk_class #32768
	MouseClick,Left,%wx%,%wy%
return
;------------------------------------------------------

;02.無変換キー(左親指)との組み合わせ
;▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽
;【上段】a
vk1D & u::Send, {Home}     ;無変換 + u = Home
vk1D & i::Send, {End}      ;無変換 + i = End
vk1D & tab::Send,^{Tab}     ;無変換 + Tab = Ctrl + Tab（ブラウザのTabの移動）
vk1D & q::Send,!{F4}        ;無変換 + Q   = Alt+F4(終了)
vk1D & w::Send,^w           ;無変換 + W   = Ctrl + W(閉じる)
vk1D & e::Send,^e           ;無変換 + E   = Ctrl + E(検索バーを選択)
vk1D & y::Send,^y           ;無変換 + Y   = Ctrl + Y（やり直し）
vk1D & o::Send,^o           ;無変換 + O   = Ctrl + O（開く）
vk1D & [::Send,{ESC}        ;無変換 + [   = ESC

;【中段】
vk1D & k::Send, {Blind}{Up}        ;無変換 + k = ↑(矢印↑移動)
vk1D & j::Send, {Blind}{Down}      ;無変換 + j = ↓(矢印↓移動)
vk1D & h::Send, {Blind}{Left}      ;無変換 + h = ←(矢印←移動)
vk1D & l::Send, {Blind}{Right}     ;無変換 + l = →(矢印→移動)
vk1D & a::Send,^a           ;無変換 + A = Ctrl + A（全選択）
vk1D & s::Send,^s           ;無変換 + S = Ctrl + S（上書き保存）
vk1D & f::Send,^f           ;無変換 + F = Ctrl + F（検索）
vk1D & `;::Send,{BS}        ;無変換 + ; = BackSpace(バックスペース)

;【下段】
vk1D & z::Send,^z           ;無変換 + Z = Ctrl + Z（戻る）
vk1D & x::Send,^x           ;無変換 + X = Ctrl + X（切り取り）
vk1D & c::Send,^c           ;無変換 + C = Ctrl + C（コピー）
vk1D & v::Send,^v           ;無変換 + V = Ctrl + V（貼り付け）
vk1D & n::Send,^n           ;無変換 + N = Ctrl + N（新しく開く）
vk1D & m::Send,{Enter}      ;無変換 + M = Enter(エンター)
vk1D & .::Send,+{F6}        ;無変換 + . = Shift+F6(矩形選択)

;【最下段】
vk1D & space::Send, {vkF3}  ;無変換+Spaceで全角/半角

;●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●
;■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
;【CLaunch】
;■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
;ランチャーのショートカット集
#IfWinActive ahk_class CLaunchWndClass
    vk1C & v::Send, !v        ;Alt+v(Vivaldi起動)
    vk1C & e::Send, !e        ;Alt+e(エディタ起動)
    vk1C & k::Send, !k        ;Alt+k(KeePass起動)
    vk1C & t::Send, !t        ;Alt+t(Todoist起動)
    vk1C & s::Send, !s        ;Alt+f(Sakuraエディタ起動)
    vk1C & o::Send, !o        ;Alt+x(Obisidian起動)
    vk1C & a::Send, !a        ;Alt+a(Autohotkeyフォルダ起動)
    vk1C & d::Send, !d        ;Alt+d(Downloadフォルダ起動)
#IfWinActive
;■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
;【サクラエディタ】
;■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#IfWinActive ahk_class TextEditorWindowWP177
;右親指の各種設定(基本的に無変換=Ctrlと同じ)
;【上段】
    vk1C & q::Send,^!{F4}    ;変換+Q(終了)
    vk1C & w::Send,^{F4}    ;変換+W(閉じる)

;【中段】
    vk1C & a::Send,^a        ;変換+A(全選択)
    vk1C & s::Send, ^s        ;変換+S(上書き保存)
    vk1C & f::Send, ^f        ;変換+F(検索)
    vk1C & `;::Send,{BS}    ;変換+;(バックスペース)
    vk1C & m::Send,{Enter}    ;変換+m(Enter)

;【下段】
    vk1C & z::Send,^z        ;変換+Z(戻る)
    vk1C & x::Send,^x        ;変換+X(切り取り)
    vk1C & c::Send,^c        ;変換+C(コピー)
    vk1C & v::Send,^v        ;変換+V(貼り付け)
    vk1C & /::Send,{Delete}    ;変換+/(削除)
#IfWinActive
;■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
;【VisualStdioCode】
;■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
