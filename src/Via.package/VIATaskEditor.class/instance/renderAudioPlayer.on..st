rendering-visitor
renderAudioPlayer: anAudioPlayer on: html
	| assets |
	assets := (self wd audioAssets sortedReversedBy: [ :each | each createdAt ]).
	self renderInputEditorFor: anAudioPlayer on: html with: [
		anAudioPlayer hasAudio ifTrue: [
			html audio
				controls: true;
				url: anAudioPlayer audioUrl.
		].

		html selectize
			list: assets;
			labels: [:each | each displayName];
			beOptional;
			on: #audioAsset of: anAudioPlayer.

		self ifFeature: #backend:recordAudioFromBrowser then: [
			html space.
			self renderAudioRecorderFor: anAudioPlayer on: html.
		].

	
		html skRow: [
			html skColumnWidth: 'three' with: [
				html label: 'Start time [format 0:00:00]'.
				html textInput on: #startTimeString of: anAudioPlayer].
			html skColumnWidth: 'three' with: [
				html label: 'End time [format 0:00:00]'.
				html textInput on: #endTimeString of: anAudioPlayer].
		].
		html label: 'Transcription'.
		anAudioPlayer transcriptionPillar isParseOk ifFalse: [
			self renderPillarSyntaxError: anAudioPlayer transcriptionPillar parseError on: html
		].
		self renderPillarInput: #pillarString of: anAudioPlayer transcriptionPillar on: html.
	]