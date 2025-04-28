#SingleInstance Force

*Space:: {
	Send "{Blind}{Shift Down}"
	KeyWait "Space"
	Send "{Blind}{Shift Up}"
	if A_PriorKey = "Space"
		Send "{Space}"
}

*vk1C:: {
	startTime := A_TickCount
	Send "{Ctrl Down}"
	KeyWait "vk1C"
	Send "{Ctrl Up}"

	if (A_TickCount - startTime < 200) {
		Send "{vk19}"
	}
}

vk1D:: {
	startTime := A_TickCount
	KeyWait "vk1D"
	if (A_TickCount - startTime < 200) {
		Send "{Esc}"
	}
}

#HotIf GetKeyState("vk1D", "P")
h:: Send "{Left}"
l:: Send "{Right}"
k:: Send "{Up}"
j:: Send "{Down}"
n:: Send "^{Left}"
m:: Send "^{Right}"
i:: Send "{Home}"
o:: Send "{End}"
u:: Send "{Home}{Shift down}{End}{Shift up}"
`;:: {
    today := FormatTime(A_Now, "yyyy/MM/dd")
    SendText(today)
}
#HotIf

vkF0:: return


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

#v:: {
	Run "C:\Users\itoht\AppData\Local\Vivaldi\Application\vivaldi.exe"
}