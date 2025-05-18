Class {
	#name : 'MindumpBot',
	#superclass : 'PollingTelegramBot',
	#instVars : [
		'brains'
	],
	#category : 'MindumpBot-Bot',
	#package : 'MindumpBot',
	#tag : 'Bot'
}

{ #category : 'actions' }
MindumpBot >> brainFor: aMessage [

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
	(self brainFor: aMessage) addTought:
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
