as yet unclassified
renderFormButtonsOn: html
	html div: [
		html submitButton
			class: 'button-primary';
			callback: [self save];
			with: 'Save'.
		html space.
		html anchorButton
			class: 'button-primary';
			callback: [self cancel];
			with: 'Cancel']