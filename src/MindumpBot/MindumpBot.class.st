Class {
	#name : 'MindumpBot',
	#superclass : 'PollingTelegramBot',
	#instVars : [
		'brains'
	],
	#classInstVars : [
		'botRegistry'
	],
	#category : 'MindumpBot-Bot',
	#package : 'MindumpBot',
	#tag : 'Bot'
}

{ #category : 'accessing' }
MindumpBot class >> botRegistry [

	^ botRegistry
]

{ #category : 'instance-creation' }
MindumpBot class >> token: aToken [

	^ (botRegistry ifNil: [ botRegistry := OrderedCollection new ])
		detect: [ :each | each token = aToken ]
		ifNone: [ botRegistry add: (super token: aToken) ]
]

{ #category : 'actions' }
MindumpBot >> brainForCode: aOneTimeAccessCode [

	^ brains
		  detect: [ :each | each oneTimeAccessCode = aOneTimeAccessCode ]
		  ifNone: [ nil ]
]

{ #category : 'actions' }
MindumpBot >> brainForMessage: aMessage [

	^ brains
		  detect: [ :each | each telegramUser = aMessage from ]
		  ifNone: [ brains add: (Brain telegramUser: aMessage from) ]
]

{ #category : 'actions' }
MindumpBot >> handleDocumentMessage: aMessage [

	| fileReference |

	fileReference := aMessage document fileName asFileReference.
	fileReference binaryWriteStream
		nextPutAll: (aMessage document readStreamWith: self) contents;
		close.
	aMessage answer: 'Nice document! '.
	aMessage answer:
		'I just saved the file as ' , fileReference fullName
		, ' for future reference.'
]

{ #category : 'actions' }
MindumpBot >> handlePhotoMessage: aMessage [

	aMessage answer: 'Nice picture ! '
	

]

{ #category : 'actions' }
MindumpBot >> handleTextMessage: aMessage [

	aMessage answer: 'You said: ', aMessage text.
	(aMessage doesMention: me) ifTrue: [ 
		aMessage answer: 'Oh, you mentioned me.' ]
]

{ #category : 'actions' }
MindumpBot >> handleVoiceMessage: aMessage [

	| transcription |
	transcription := self transcribe: aMessage.
	(self brainForMessage: aMessage) addTought:
		(Tought textContent: transcription timeStamp: DateAndTime now).
	aMessage answer: 'I just added "'
		, (transcription copyFrom: 1 to: (50 min: transcription size))
		, '..." to the current tought strain.'
]

{ #category : 'initialize' }
MindumpBot >> initialize [

	super initialize.
	brains := OrderedCollection new.
]

{ #category : 'commands' }
MindumpBot >> login: aMessage [

	| brain |
	brain := self brainForMessage: aMessage.
	brain
		oneTimeAccessCode: Time millisecondClockValue greaseString
		accessCodeValidThrough: DateAndTime now + 5 minutes.
	aMessage answer: 'Your access code is ' , brain oneTimeAccessCode greaseString 
]

{ #category : 'commands' }
MindumpBot >> start: aMessage [

	self sendChatMessage: 'Hi! let''s *start*' to: aMessage chat
]

{ #category : 'transcribing' }
MindumpBot >> transcribe: anAudioMessage [

	| sapi bytes |
	sapi := SpeechToTextApi new.
	sapi isProperlyConfigured ifFalse: [
		anAudioMessage answer:
			'Al parecer, la API de transcripción no está correctamente configurada.'.
		^ nil ].

	bytes := (anAudioMessage voice readStreamWith: self) contents.
	^ sapi transcribeByteArray: bytes
]
