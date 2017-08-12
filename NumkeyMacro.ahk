#InstallKeybdHook
SendMode Event
#UseHook
SetNumlockState, off
SetScrollLockState, Off

interval = 0

Numpad1::
	GetInput(1)
return
NumpadEnd::
	SetScrollLockState, On
	SetKeyDelay, interval
	send %1%
	sleep 10
	SetScrollLockState, Off
return

Numpad2::
	GetInput(2)
return
NumpadDown::
	SetScrollLockState, On
	SetKeyDelay, interval
	send %2%
	sleep 10
	SetScrollLockState, Off
return

Numpad3::
	GetInput(3)
return
NumpadPgDn::
	SetScrollLockState, On
	SetKeyDelay, interval
	send %3%
	sleep 10
	SetScrollLockState, Off
return

Numpad4::
	GetInput(4)
return
NumpadLeft::
	SetScrollLockState, On
	SetKeyDelay, interval
	send %4%
	sleep 10
	SetScrollLockState, Off
return

Numpad5::
	GetInput(5)
return
NumpadClear::
	SetScrollLockState, On
	SetKeyDelay, interval
	send %5%
	sleep 10
	SetScrollLockState, Off
return

Numpad6::
	GetInput(6)
return
NumpadRight::
	SetScrollLockState, On
	SetKeyDelay, interval
	send %6%
	sleep 10
	SetScrollLockState, Off
return

Numpad7::
	RecordMacro(7)
return
NumpadHome::
	SetScrollLockState, On
	SetNumlockState, on
	RunWait, %comspec% /c "macros.bat p 7", , Hide
	SetScrollLockState, off
return

Numpad8::
	RecordMacro(8)
return
NumpadUp::
	SetScrollLockState, On
	SetNumlockState, on
	RunWait, %comspec% /c "macros.bat p 8", , Hide
	SetScrollLockState, off
return

Numpad9::
	RecordMacro(9)
return
NumpadPgUp::
	SetScrollLockState, On
	SetNumlockState, on
	RunWait, %comspec% /c "macros.bat p 9", , Hide
	SetScrollLockState, off
return

NumpadDot::
	RecordMacro(10)
return
NumpadDel::
	SetScrollLockState, On
	SetNumlockState, on
	RunWait, %comspec% /c "macros.bat p 10", , Hide
	SetScrollLockState, off
return

NumpadAdd::

	if interval < 500
	{
		SetNumlockState, off
		sleep 5
		SetNumlockState, on
		sleep 60
		SetNumlockState, off
		interval += 25
		HideTrayTip()
		if interval = 1000
		{
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
	if interval >= 25
	{
		SetNumlockState, off
		sleep 5
		SetNumlockState, on
		sleep 60
		SetNumlockState, off
		interval -= 25
		HideTrayTip()
		if interval = 0
			TrayTip, NumKeyMacro, Key interval: %interval% (Minimum)
		else
			TrayTip, NumKeyMacro, Key interval: %interval%
		sleep 5
	} else {
		TrayTip, NumKeyMacro, Key interval: %interval% (Minimum)
	}
return

RecordMacro(MKeyNo) {
	TrayTip, NumKeyMacro, Recording mouse & keyboard...
	sleep 250
	SetNumlockState, off
	sleep 60
	SetNumlockState, on
	sleep 60
	SetNumlockState, off
	sleep 60
	SetNumlockState, on
	sleep 60
	SetNumlockState, off
	sleep 60
	SetNumlockState, on
	RunWait, %comspec% /c "macros.bat r %MKeyNo%", , Hide
	sleep 500
	SetNumlockState, off
	sleep 200
	SetNumlockState, on
	sleep 500
	SetNumlockState, off
}

GetInput(KeyNo) {
	TrayTip, NumKeyMacro, Recording keyboard...
	sleep 250
	SetNumlockState, off
	sleep 60
	SetNumlockState, on
	sleep 60
	SetNumlockState, off
	sleep 60
	SetNumlockState, on
	sleep 60
	SetNumlockState, off
	sleep 60
	SetNumlockState, on
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
	%KeyNo% = %log%
	sleep 500
	SetNumlockState, off
	sleep 200
	SetNumlockState, on
	sleep 500
	SetNumlockState, off
}

blinkScroll() {
	SetScrollLockState, Off
	sleep 10
	SetScrollLockState, On
	sleep 20
	SetScrollLockState, Off
}

HideTrayTip() {
    TrayTip
    if SubStr(A_OSVersion,1,3) = "10." {
        Menu Tray, NoIcon
        Sleep 200
        Menu Tray, Icon
    }
}