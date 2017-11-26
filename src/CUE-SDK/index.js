const CueSDK = require('cue-sdk-node')
const chalk = require('chalk')
const events = require('events')
const watch = require('node-watch')
const fs = require('fs')
const nk = chalk.cyan('[') + chalk.cyanBright('NumkeyMacro') + chalk.cyan('] ')

class State extends events {}
const state = new State()

class NumkeyMacro {
	static get config() {
		let config
		try {
			config = JSON.parse(fs.readFileSync('config.json', 'utf8'));
			return config
		} catch (e) {
			console.log(nk + chalk.redBright('Failed to parse ') + chalk.magentaBright('config.json'))
			process.exit(1)
		}
	}
	static get recordings() {
		let recordings
		try {
			recordings = JSON.parse(fs.readFileSync('recordings.json', 'utf8'));
			return recordings
		} catch (e) {
			console.log(nk + chalk.redBright('Failed to parse ') + chalk.magentaBright('recordings.json'))
			process.exit(1)
		}
	}
	static record() {
		let config = this.config
		if (!config.colors.record.set.enabled && !config.colors.record.unset.enabled) return

		state.emit('terminate')
		let cue = new CueSDK.CueSDK(),
			lights = [],
			recordings = this.recordings,
			enabledKeys = config.macroKeys
		
		if (config.colors.record.border) {
			lights = [
				[
					'NumLock',
					config.colors.record.border.color[0],
					config.colors.record.border.color[1],
					config.colors.record.border.color[2]
				],
				[
					'KeypadSlash',
					config.colors.record.border.color[0],
					config.colors.record.border.color[1],
					config.colors.record.border.color[2]
				],
				[
					'KeypadAsterisk',
					config.colors.record.border.color[0],
					config.colors.record.border.color[1],
					config.colors.record.border.color[2]
				],
				[
					'KeypadMinus',
					config.colors.record.border.color[0],
					config.colors.record.border.color[1],
					config.colors.record.border.color[2]
				],
				[
					'KeypadPlus',
					config.colors.record.border.color[0],
					config.colors.record.border.color[1],
					config.colors.record.border.color[2]
				],
				[
					'KeypadEnter',
					config.colors.record.border.color[0],
					config.colors.record.border.color[1],
					config.colors.record.border.color[2]
				],
				[
					'KeypadComma',
					config.colors.record.border.color[0],
					config.colors.record.border.color[1],
					config.colors.record.border.color[2]
				],
				[
					'KeypadPeriodAndDelete',
					config.colors.record.border.color[0],
					config.colors.record.border.color[1],
					config.colors.record.border.color[2]
				]
			]
		}
		
		for (let i = 0; i < enabledKeys.length; i++) {
			let key = recordings[enabledKeys[i]],
				type = "unset"
			if (key && fs.existsSync(key.file + ".mcr")) type = "set"
			if (config.colors.record[type].enabled) {
				lights.push([
					enabledKeys[i],
					config.colors.record[type].color[0],
					config.colors.record[type].color[1],
					config.colors.record[type].color[2]
				])
			}
		}
		if (JSON.stringify(lights) !== "[]") cue.set(lights)
		state.once('terminate', () => {
			cue.close()
		})
	}
	static playback() {
		let config = this.config
		if (!config.colors.playback.set.enabled && !config.colors.playback.unset.enabled) return

		state.emit('terminate')
		let cue = new CueSDK.CueSDK(),
			lights = [],
			recordings = this.recordings,
			enabledKeys = config.macroKeys
		
		for (let i = 0; i < enabledKeys.length; i++) {
			let key = recordings[enabledKeys[i]],
				type = "unset"
			if (key && fs.existsSync(key.file)) type = "set"
			if (config.colors.playback[type].enabled) {
				lights.push([
					enabledKeys[i],
					config.colors.playback[type].color[0],
					config.colors.playback[type].color[1],
					config.colors.playback[type].color[2]
				])
			}
		}
		if (JSON.stringify(lights) !== "[]") cue.set(lights)
		state.once('terminate', () => {
			cue.close()
		})
	}
	static recording() {
		let config = this.config
		if (!config.colors.recording.enabled) return

		state.emit('terminate')
		let cue = new CueSDK.CueSDK(),
			lights = []

		for(let i = 0; i < 130; i++) {
			lights.push([
				i,
				config.colors.recording.color[0],
				config.colors.recording.color[1],
				config.colors.recording.color[2]
			])
		}
		
		cue.setSync(lights, true)
		state.once('terminate', () => {
			cue.close()
		})
	}
	static playing() {
		let config = this.config
		if (!config.colors.playing.enabled) return

		state.emit('terminate')
		let cue = new CueSDK.CueSDK(),
			lights = []

		for(let i = 0; i < 130; i++) {
			lights.push([
				i,
				config.colors.playing.color[0],
				config.colors.playing.color[1],
				config.colors.playing.color[2]
			])
		}
		
		cue.setSync(lights, true)
		state.once('terminate', () => {
			cue.close()
		})
	}
}

NumkeyMacro.playback()
watch('stream.json', {}, () => {
	fs.readFile('stream.json', 'utf8', function (err,data) {
		if (err) {
			return
		}
		console.log(data)
		if (data == "numlock:on") {
			NumkeyMacro.record()
		}
		if (data == "numlock:off") {
			NumkeyMacro.playback()
		}
		if (data == "record:start") {
			NumkeyMacro.recording()
		}
		if (data == "record:stop") {
			NumkeyMacro.playback()
		}
		if (data == "playback:start") {
			NumkeyMacro.playing()
		}
		if (data == "playback:stop") {
			NumkeyMacro.playback()
		}
		
	})
})
// let cue = new CueSDK.CueSDK();


// cue.fade('F1', [255, 255, 0], [0, 0, 255], 4000)

setTimeout(function() {}, 500000)