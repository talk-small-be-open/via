as yet unclassified
renderValue: aValue label: aLabelString setter: aSetterBlock on: html
	
	aValue isBlock ifTrue: [ ^ self ].
	
	html tableRow: [
		html tableData: [html text: aLabelString].
		html tableData: [
			aValue isNil ifTrue: [
				html span: 'Empty'
			].
			aValue isString ifTrue: [
				(aValue lines size > 1) ifTrue: [ 
					html textArea
						callback: aSetterBlock;
						value: aValue
				] ifFalse: [
					html textInput
						callback: aSetterBlock;
						value: aValue
				]
			].
			(aValue isKindOf: Boolean) ifTrue: [
				html checkbox
					callback: aSetterBlock;
					value: aValue
			].
			(aValue isKindOf: Integer) ifTrue: [
				html numberInput
					callback: [:value | aSetterBlock value: value asInteger ];
					value: aValue asString
			]].
		html tableData: [
			aValue
				ifNotNil: [
					html anchor
						callback: [ aSetterBlock value: nil ];
						with: 'NIL'
				] ifNil: [
					html anchor
						callback: [ aSetterBlock value: '' ];
						with: 'Text'.
					html space.
					html anchor
						callback: [ aSetterBlock value: (String crlf, String crlf) ];
						with: 'Multiline'.
					html space.
					html anchor
						callback: [ aSetterBlock value: 0 ];
						with: 'Number'.
					html space.
					html anchor
						callback: [ aSetterBlock value: true ];
						with: 'Boolean'.
				]
			]
	]