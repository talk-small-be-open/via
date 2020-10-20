rendering-visitor
renderAudioPlayer: anAudioPlayer on: html
	html div class: 'audioPlayer'; with: [
		html iconAudio; space.
		html text: 'AUDIO'.

		anAudioPlayer hasTranscription ifTrue: [
			html div class: 'transcriptionText'; with: [
				html pillar: anAudioPlayer transcriptionPillar pillarDocument]]]