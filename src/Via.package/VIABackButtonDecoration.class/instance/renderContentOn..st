as yet unclassified
renderContentOn: html
	html div class: 'backButton'; with: [
		html anchor
			useBaseUrl;
			class: 'backButtonAnchor';
			callback: [self decoratedComponent cancel];
			with: [
				html iconBack.
				html t: 'general:back']].
	self renderNextOn: html.