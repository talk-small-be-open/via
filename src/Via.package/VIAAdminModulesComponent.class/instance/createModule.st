actions
createModule
	| module |
	module := VIAModule new.
	
	module
		website: self website;
		addAuthorUser: self currentUser. 
	
	self wd addModule: module.
	
	self editModule: module