initialization
setupCommandFiltering
	[ [ socketStream isConnected ]
		whileTrue: [ | anArr textArr aCmd aLine |
			aLine := [ socketStream nextLine ]
				on: ConnectionClosed
				do: [ self class restart ].
			aLine = EBEvilBot
				ifFalse: [  
			(aLine beginsWith: 'PING')
				ifTrue: [ self sendCommand: 'PONG' ]
				ifFalse: [ 
					self log: aLine.
					anArr := aLine substrings: ' '.
					textArr := aLine substrings: ':'.
					aCmd := anArr size > 1
						ifTrue: [ anArr at: 2 ]
						ifFalse: [ 0 ].
					self log: aCmd asString.
					self processCommand: aCmd from: textArr ] ] ] ] fork