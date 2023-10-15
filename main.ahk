;「変換」で「変換」
vk1D::vk1D
vk1C::vk1C

;矢印移動(アプリに関わらず全般で使用)
;【上下左右】
vk1D & i::Send, {Up}        ;無変換 + i = ↑(矢印↑移動)
vk1D & k::Send, {Down}      ;無変換 + k = ↓(矢印↓移動)
vk1D & j::Send, {Left}      ;無変換 + j = ←(矢印←移動)
vk1D & l::Send, {Right}     ;無変換 + l = →(矢印→移動)

vk1C & i::Send, {Up 2}      ;変換 + i   = ↑(矢印↑2個移動)
vk1C & k::Send, {Down 2}    ;変換 + k   = ↓(矢印↓2個移動)
vk1C & j::Send, {Left 2}    ;変換 + j   = ←(矢印←2個移動)
vk1C & l::Send, {Right 2}   ;変換 + l   = →(矢印→2個移動)

vk1D & 8::Send, ^{Home}     ;無変換 + 8 = Home(Ctrl+Home)
vk1D & ,::Send, ^{End}      ;無変換 + , = End(Ctrl+End)
vk1D & h::Send, {Home}      ;無変換 + h = Home(Home)
vk1D & vkba::Send, {End}    ;無変換 + : = End(End)

;01.変換キー(右親指)との組み合わせ
;▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽
vk1C & tab::AltTab
vk1C & c::Send, !c          ;変換 + c = Alt+c(CLaunch起動。)
vk1C & r::Send, {F2}        ;変換 + R = F2（名前の変更）
;------------------------------------------------------

;02.無変換キー(左親指)との組み合わせ
;▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽
;【上段】
vk1D & tab::Send,^{Tab}     ;無変換 + Tab = Ctrl + Tab（ブラウザのTabの移動）
vk1D & q::Send,!{F4}        ;無変換 + Q   = Alt+F4(終了)
vk1D & w::Send,^w           ;無変換 + W   = Ctrl + W(閉じる)
vk1D & e::Send,^e           ;無変換 + E   = Ctrl + E(検索バーを選択)
vk1D & r::Send,{F2}         ;無変換 + R   = F2（名前の変更）
vk1D & y::Send,^y           ;無変換 + Y   = Ctrl + Y（やり直し）
vk1D & o::Send,^o           ;無変換 + O   = Ctrl + O（開く）
vk1D & u::Send,{F7}         ;無変換 + u   = F7（カタカナ）

;【中段】
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
vk1D & /::Send,{Delete}     ;無変換 + / = Delete(削除)

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
    vk1C & k::Send, !k        ;Alt+a(KeePass起動)
    vk1C & t::Send, !t        ;Alt+a(Todoist起動)
    vk1C & s::Send, !s        ;Alt+f(Sakuraエディタ起動)
    vk1C & o::Send, !o        ;Alt+x(Obisidian起動)
    vk1C & a::Send, !a        ;Alt+a(Autohotkeyフォルダ起動)
#IfWinActive
;■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
;【サクラエディタ】
;■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#IfWinActive ahk_class TextEditorWindowW151
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
