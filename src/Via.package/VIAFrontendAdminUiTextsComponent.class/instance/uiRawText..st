accessing
uiRawText: anObject
	uiRawText := anObject.
	
	[
	self db uiTextAt: uiKey put: uiRawText.
	
	"renew cached text in session. a bit dirty, but ok here"
	self session cachedUiTexts removeKey: uiKey.
	self session getUiText: uiKey.
	]
		on: VIAPillarSyntaxError do: [:e |
	"TBD" ]