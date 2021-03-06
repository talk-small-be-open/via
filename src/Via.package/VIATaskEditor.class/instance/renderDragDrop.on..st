rendering-visitor
renderDragDrop: aDragDropInput on: html
	self renderInputEditorFor: aDragDropInput on: html with: [
		html heading level2; with: [
			html text: 'Drag & Drop: '.
			html text: aDragDropInput code].
		html span: 'Hint: '.
		html textArea
			on: #hintText of: aDragDropInput.
		html break.
		html div: 'Draggable choices (prefixed * = answer)'.
		html textArea on: #choicesString of: aDragDropInput.
"		html skRow: [
			html skColumnWidth: 'three' with: [
				html label: [
					html checkbox on: #shuffleChoices of: aDragDropInput.
					html text: ' shuffle choices']]]."
	]