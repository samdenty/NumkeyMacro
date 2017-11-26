<p align="center">
  <a href="https://github.com/samdenty99/NumKeyMacro">
    <img src="https://raw.githubusercontent.com/samdenty99/NumKeyMacro/master/assets/NumKeyMacro.png" width="100">
  </a>

  <h3 align="center">NumkeyMacro</h3>

  <p align="center">
    Native macro key support without any extra hardware. <a href="https://www.npmjs.com/package/cue-sdk-node">CUE SDK enhanced</a>
    <br>
    <b><a href="">Demo</a> | <a href="https://samdenty99.github.io/r?https://discord.gg/yN2x7sp">Discord</a> | <a href="https://samdenty99.github.io/r?https://github.com/samdenty99/NumkeyMacro/wiki">Browse the docs</a></b>
    <br>
    <br>
	<a href="https://samdenty99.github.io/r?https://discord.gg/yN2x7sp">
		<img src="https://img.shields.io/discord/335836376031428618.svg?colorB=0082ff&style=flat">
	</a>
	<a href="https://samdenty99.github.io/r?http://www.somsubhra.com/github-release-stats/?username=samdenty99&repository=NumkeyMacro">
		<img src="https://img.shields.io/github/downloads/samdenty99/NumkeyMacro/total.svg?colorB=437FB9&style=flat">
	</a>
	<a href="https://samdenty99.github.io/r?https://github.com/samdenty99/NumKeyMacro/subscription">
    		<img src="https://img.shields.io/github/watchers/samdenty99/NumKeyMacro.svg?style=social&label=Watch&style=flat">
	</a>
	<a href="https://samdenty99.github.io/r?https://github.com/samdenty99/NumKeyMacro">
		<img src="https://img.shields.io/github/stars/samdenty99/NumKeyMacro.svg?style=social&label=Star&style=flat">
	</a>
	<a href="https://samdenty99.github.io/r?https://github.com/samdenty99/NumKeyMacro/fork">
		<img src="https://img.shields.io/github/forks/samdenty99/NumKeyMacro.svg?style=social&label=Fork&style=flat">
	</a>
</p>

---

## Getting started
NumkeyMacro is straight forward to install, simply [download the compiled binary](https://github.com/samdenty99/NumKeyMacro/raw/master/bin/NumkeyMacro.exe) and run it.

### Installing
This will allow NumkeyMacro to autostart on boot
1. [Download the latest binary from `bin/NumkeyMacro.exe`](https://github.com/samdenty99/NumKeyMacro/raw/master/bin/NumkeyMacro.exe)
2. Press <kbd>WIN+R</kbd> and type in `shell:startup`
3. Copy the downloaded EXE into this folder
4. Double click the EXE once copied and you can start using it

### Running locally
If you'd prefer to run NumkeyMacro directly from the source code instead, follow these steps.
### Prerequisites
```
AutoHotkey
NodeJS
NodeJS package manager (NPM)
```

### Launching from source
1. Navigate to the `src/CUE-SDK` folder
```
npm install
npm run numkeymacro node index.js
start NumkeyMacro.ahk
```

## Corsair keyboards

Thanks to [Yannicked/node-cue-sdk](https://github.com/Yannicked/node-cue-sdk), NumkeyMacro has full **customizable** RGB support 

| Action | How to |
| --- | --- |
| Record a macro | <ol><li>Press the <kbd>NUM LOCK</kbd> key</li><li>Press any key from 1-9 on the numpad <ol><li>Numbers 7-9 record the **mouse, delays, keystrokes and key combinations**</li><li>Numbers 1-6 **only record the keystrokes**</li></ol></li></ol>|
| Playback a macro | Simply hit the numpad number you recorded the macro on (<kbd>NUM LOCK</kbd> should be off) |
| Change the led colors | Open the `src|CUE-SDK/config.json` in a text editor and modify the [RGB array values](https://www.w3schools.com/colors/colors_picker.asp) |

<h2></h2>

## Regular keyboards

<h2></h2>

#### Can I still use ALT-CODES?
