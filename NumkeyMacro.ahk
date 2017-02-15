#InstallKeybdHook
SendMode Event
#UseHook
SetNumlockState, off

Numpad1::
	GetInput(1)
return
NumpadEnd::
	send %1%
return

Numpad2::
	GetInput(2)
return
NumpadDown::
	send %2%
return

Numpad3::
	GetInput(3)
return
NumpadPgDn::
	send %3%
return

Numpad4::
	GetInput(4)
return
NumpadLeft::
	send %4%
return

Numpad5::
	GetInput(5)
return
NumpadClear::
	send %5%
return

Numpad6::
	GetInput(6)
return
NumpadRight::
	send %6%
return

Numpad7::
	GetInput(7)
return
NumpadHome::
	send %7%
return

Numpad8::
	GetInput(8)
return
NumpadUp::
	send %8%
return

Numpad9::
	GetInput(9)
return
NumpadPgUp::
	send %9%
return

NumpadDot::
	GetInput(10)
return
NumpadDel::
	send %10%
return


GetInput(KeyNo) {
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