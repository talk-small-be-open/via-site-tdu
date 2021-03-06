rendering
initializeAccountMenu
	| subMenu entry userLabel |
	subMenu := mainMenu addSubMenu.
	mainMenu addDivider.

	userLabel := self currentUser fullName.
	self ifTeacher: [
		userLabel := userLabel,	' (', ('menu:iAmTeacher't), ')' ].
				
	entry := (VIATextMenuEntry label: userLabel).
	entry icon: #account.
	subMenu mainEntry: entry.

	entry := subMenu addEntry: 'menu:logout' send: #logout to: self.
"	entry
		script: 'hello.logout()'."

	subMenu addEntry: 'menu:myProfile' send: #gotoMyProfile to: self.

"								self ifDevelopment: [
					html listItem: [
						self renderQuickLoginOn: html]]."