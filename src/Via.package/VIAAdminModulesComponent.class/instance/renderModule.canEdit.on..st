rendering
renderModule: aModule canEdit: canEdit on: html
	html tableData: [
		aModule isDraft
			ifTrue: [html badgeWarning: ('DRAFT ', aModule versionNumberString)]
			ifFalse: [html badgeSuccess: ('RELEASED ', aModule versionNumberString)]
	].
	html tableData class: 'moduleName'; with: [
		html text: aModule displayName.
		aModule hasGeocodes ifTrue: [
			html space; space.
			(html fasIcon: 'globe') style: 'color: blue'.
		].
		aModule isExam ifTrue: [
			html space.
			html badgeSuccess: 'EXAM ONLY'].
		aModule isPrivate ifTrue: [
			html space.
			html badgeWarning: 'PRIVATE'].
		aModule isForDemo ifTrue: [
			html space.
			html badgeWarning: 'IN DEMO'].
		aModule isForBetatester ifTrue: [
			html space.
			html badgeSuccess: 'FOR TESTER'].
		aModule isLocked ifTrue: [
			html space.
			html badgeDanger: ('LOCKED by ', aModule lockedByAdmin fullName)].
	].
	html tableData class: 'actions'; with: [
		canEdit ifTrue: [
			html anchor
				callback: [self editModule: aModule];
				with: 'Edit'.
			(self canMakeNewVersionModule: aModule) ifTrue: [
				html anchor
					callback: [self createNewModuleVersion: aModule];
					title: 'Create a new draft version for this module';
					with: 'New version'].
			aModule hasVersions ifTrue: [
				html anchor
					callback: [self showVersionHistory: aModule];
					title: 'Show all versions history';
					with: 'Versions'].
			self ifAdmin: [
				aModule isDraft
					ifTrue: [
						html anchor
							callback: [self releaseModule: aModule];
							title: 'Publish this module!';
							with: 'Release']]].
		html popupAnchor
			dependent: true;
			windowTitle: 'VIA Preview';
			callback: [self testdriveModule: aModule];
"							target: '_blank';"
			title: 'Preview and test module';
			with: 'Test'.
	].
	html tableData class: 'actions extras'; with: [
		html anchor callback: [ self openExtraToolsFor: aModule ]; with: 'Tools ...']