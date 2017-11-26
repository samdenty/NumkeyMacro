#InstallKeybdHook
SendMode Event
#UseHook
SetNumlockState, off
SetScrollLockState, Off

interval = 0

Numlock::
	SetNumLockState, % (t:=!t) ?  "On" :  "Off"
	FileDelete, stream.json
	if (GetKeyState("NumLock", "T"))
		FileAppend, numlock:on, stream.json
	else
		FileAppend, numlock:off, stream.json
return

Numpad1::
	RecordBasicMacro(1)
return
Numpad2::
	RecordBasicMacro(2)
return
Numpad3::
	RecordBasicMacro(3)
return
Numpad4::
	RecordBasicMacro(4)
return
Numpad5::
	RecordBasicMacro(5)
return
Numpad6::
	RecordBasicMacro(6)
return
Numpad7::
	RecordMacro(7)
return
Numpad8::
	RecordMacro(8)
return
Numpad9::
	RecordMacro(9)
return
NumpadDot::
	RecordMacro(10)
return


NumpadEnd::
	SetKeyDelay, interval
	PlayBasicMacro(1)
return
NumpadDown::
	SetKeyDelay, interval
	PlayBasicMacro(2)
return
NumpadPgDn::
	SetKeyDelay, interval
	PlayBasicMacro(3)
return
NumpadLeft::
	SetKeyDelay, interval
	PlayBasicMacro(4)
return
NumpadClear::
	SetKeyDelay, interval
	PlayBasicMacro(5)
return
NumpadRight::
	SetKeyDelay, interval
	PlayBasicMacro(6)
return
NumpadHome::
	RunWait, %comspec% /c "macros.bat p 7", , Hide
return
NumpadUp::
	RunWait, %comspec% /c "macros.bat p 8", , Hide
return
NumpadPgUp::
	RunWait, %comspec% /c "macros.bat p 9", , Hide
return
NumpadDel::
	RunWait, %comspec% /c "macros.bat p 10", , Hide
return

NumpadAdd::
	if (interval < 500) {
		interval += 25
		HideTrayTip()
		if (interval = 1000) {
			TrayTip, NumKeyMacro, Key interval: %interval% (Maximum)
		} else {
			TrayTip, NumKeyMacro, Key interval: %interval%
		}
		TrayTip, NumKeyMacro, Key interval: %interval%
		sleep 5
	} else {
		TrayTip, NumKeyMacro, Key interval: %interval% (Maximum)
	}
return

NumpadSub::
	if (interval >= 25) {
		interval -= 25
		HideTrayTip()
		if (interval = 0) {
			TrayTip, NumKeyMacro, Key interval: %interval% (Minimum)
		} else {
			TrayTip, NumKeyMacro, Key interval: %interval%
		}
		sleep 5
	} else {
		TrayTip, NumKeyMacro, Key interval: %interval% (Minimum)
	}
return

RecordMacro(MKeyNo) {
	FileDelete, stream.json
	FileAppend, record:start, stream.json
	TrayTip, NumKeyMacro, Recording mouse & keyboard...
	RunWait, %comspec% /c "macros.bat r %MKeyNo%", , Hide
	FileDelete, stream.json
	FileAppend, record:stop, stream.json
}

RecordBasicMacro(KeyNo) {
	FileDelete, stream.json
	FileAppend, record:start, stream.json
	TrayTip, NumKeyMacro, Recording keyboard...
	Loop {
		Input, key, V L1, {LControl}{RControl}{LAlt}{RAlt}{LShift}{RShift}{LWin}{RWin}{AppsKey}{F1}{F2}{F3}{F4}{F5}{F6}{F7}{F8}{F9}{F10}{F11}{F12}{Left}{Right}{Up}{Down}{Home}{End}{PgUp}{PgDn}{Del}{Ins}{BS}{Capslock}{Numlock}{PrintScreen}{Pause}{Enter}{Space}{Numlock}{Tab}{Volume_Up}{Volume_Down}{Volume_Mute}
		If Errorlevel=Max 
		{
			log = %log%%key%
		} 
		else if InStr(ErrorLevel,"EndKey:")
		{
			if SubStr(ErrorLevel,8)="Numlock"
			{
				break
			}
			log1:=SubStr(ErrorLevel,8)
			log=%log%{%log1%}
		}
	}
	FileDelete, stream.json
	FileAppend, record:stop, stream.json
	
	FileDelete, %KeyNo%.mcr
	if (log != "")
		FileAppend, %log%, %KeyNo%.mcr
}

PlayBasicMacro(KeyNo) {
	FileDelete, stream.json
	FileAppend, playback:start, stream.json
	FileRead, keys, %KeyNo%.mcr
	Send, %keys%
	FileDelete, stream.json
	FileAppend, playback:stop, stream.json
}

HideTrayTip() {
    TrayTip
    if SubStr(A_OSVersion,1,3) = "10." {
        Menu Tray, NoIcon
        Sleep 200
        Menu Tray, Icon
    }
}