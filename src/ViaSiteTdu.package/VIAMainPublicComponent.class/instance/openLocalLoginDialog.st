actions
openLocalLoginDialog
	| login |
	login := self am loginComponentClass new.
	login
		beLocalOnly;
		messageKey: 'mainPublic:pleaseLogin:info'.
	
	self showLightbox: nil component: login onAnswer: [:answer |
		answer = true ifTrue: [self login]
	]