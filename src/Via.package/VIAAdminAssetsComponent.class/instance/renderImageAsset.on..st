rendering-visitor
renderImageAsset: anImageAsset on: html
	html div class: 'topBuffer'; with: [
		html anchor
			class: 'muted';
			callback: [ anImageAsset containsTextInImage: anImageAsset containsTextInImage not ];
			with: [ 
"				anImageAsset containsTextInImage ifTrue: [ html iconChecked ] ifFalse: [ html iconUnchecked ]."
				html checkbox
					style: 'pointer-events: none;';
					value: anImageAsset containsTextInImage.
				html space.
				html span: 'contains text to read in image (quality)'.
			].
		
		"Show warning"
		(anImageAsset containsTextInImage and: [ anImageAsset isJpeg ]) ifTrue: [
			html div class: 'topBuffer'; with: [
				html badgeWarning: 'Quality warning'.
				html paragraph: 'JPG is blury and not a good format for readable text. Use PNG instead!'
			].
		]
	]