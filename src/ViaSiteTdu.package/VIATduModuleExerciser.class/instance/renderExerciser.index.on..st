rendering
renderExerciser: aTaskExerciser index: anInteger on: html
	| id task |
	task := aTaskExerciser task.
	id := html nextId.
	html div
		ukToggleTarget: ('#', id) class: 'hiddenTaskExercise' "animation: 'uk-animation-fade'";
		onClick: (html jQuery ajax
				callback: [aTaskExerciser toggleOpen]);
		class: 'acc-bar';
		class: 'ignored' if: aTaskExerciser exercise isIgnored;
		class: 'level-', model exerciseLevel asLowercase;
		with: [
			html div class: 'acc-number'; with: anInteger.
			html div class: 'acc-icon'; with: [
				task classification activityTypeTags do: [:each |
					html iconActivityType: each]
				].
			html div class: 'acc-title'; with: [
"				aTaskExerciser task classification activityTypeTags do: [:each |
					html text: each text capitalized]
				separatedBy: [html space]"
				html text: task title.
				html space; space.
				task classification topicTags do: [:each |
					each isUsingIcon ifTrue: [
						html iconTopic: each]]
			].
			html div class: 'acc-toggle'; with: [ html iconDropdown ].
			html div class: 'uk-visible@s acc-subtitle'; with: aTaskExerciser task subtitle.
	"		self renderScoreTask: aTaskExerciser exercise on: html"].
	
	html div
"		class: 'uk-accordion-content';"
		class: 'hiddenTaskExercise' if: aTaskExerciser isOpen not;
		id: id;
		with: [
"			model isIgnoreTaskAllowed ifTrue: [
				html ukAnchorButton
					callback: [self toggleIgnore ];
					with: 'Ignore'.
			]."
			html render: aTaskExerciser]