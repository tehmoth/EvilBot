accessing
processCommand: aCmd withArray: anArray
	| aLoc |
	aLoc := ((anArray first substrings: ' ') last).
	(aCmd asUppercase beginsWith: '!WEATHER')
		ifTrue: [ self weatherCommand: aCmd withArray: anArray to: aLoc ].
	(aCmd asUppercase beginsWith: '!SEARCH')
		ifTrue: [ self searchCommand: aCmd withArray: anArray to: aLoc ].
	(aCmd asUppercase beginsWith: '!SAVE')
		ifTrue: [ self processSaveCommand: anArray to: aLoc ].
	(aCmd asUppercase beginsWith: '!HELP')
		ifTrue: [ self sendCommand: 'PRIVMSG ',aLoc,' try !weather' ].