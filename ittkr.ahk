#SingleInstance Force

; Space押しっぱなしでShift、単に押すとSpace
*Space:: {
	Send "{Blind}{Shift Down}"
	KeyWait "Space"
	Send "{Blind}{Shift Up}"
	if A_PriorKey = "Space"
		Send "{Space}"
}

; 変換キーを短押しで半角キー、長押しでCtrl
*vk1C:: {
	startTime := A_TickCount
	Send "{Ctrl Down}"
	KeyWait "vk1C"
	Send "{Ctrl Up}"
	if (A_TickCount - startTime < 200) {
		Send "{vk19}"  ; 半角キー
	}
}

; 無変換キーを短押しでEsc
vk1D:: {
	startTime := A_TickCount
	KeyWait "vk1D"
	if (A_TickCount - startTime < 200) {
		Send "{Esc}"
	}
}

; 無変換キーを押しながらでhjklなどを移動キーに
#HotIf GetKeyState("vk1D", "P")
h:: Send "{Left}"
l:: Send "{Right}"
k:: Send "{Up}"
j:: Send "{Down}"
n:: Send "{Ctrl Down}{Left}{Ctrl Up}"
m:: Send "{Ctrl Down}{Right}{Ctrl Up}"
i:: Send "{Home}"
o:: Send "{End}"
u:: Send "{Home}{Shift down}{End}{Shift up}"
`;:: Send "{BackSpace}"
#HotIf

; 中ボタン押し、音量操作
MButton:: {
	Send "{MButton Down}"
	KeyWait "MButton"
	Send "{MButton Up}"
}

MButton & WheelUp:: {
	SoundSetVolume("+5")
	ShowVolumeOSD()
}

MButton & WheelDown:: {
	SoundSetVolume("-5")
	ShowVolumeOSD()
}

; 音量OSD表示
ShowVolumeOSD() {
	try {
		currentVolume := SoundGetVolume()
		ToolTip(Round(currentVolume) . "%")
		SetTimer () => ToolTip(), -1000
	}
	catch as e {
		ToolTip("ERROR")
		SetTimer () => ToolTip(), -1000
	}
}

; Win + v でVivaldi起動
#v:: {
	Run "C:\Users\itoht\AppData\Local\Vivaldi\Application\vivaldi.exe"
}
