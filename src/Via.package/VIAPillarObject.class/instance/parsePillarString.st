as yet unclassified
parsePillarString
	[
	pillarDocument := VIAPrDocumentParser parse: pillarString.
	pillarString := VIAHelper pillarStringFromPillar: pillarDocument.
	self beParseOk
	]
	on: VIAPillarSyntaxError do: [:e |
		self beParseError: e messageText]