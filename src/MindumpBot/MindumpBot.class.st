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

	| fileReference |
	fileReference := 'temp-audio.oga' asFileReference.
	fileReference binaryWriteStream
		nextPutAll: (aMessage voice readStreamWith: self) contents;
		close.
	aMessage answer: 'Sorry, I do not speak human.'.
	aMessage answer:
		'However, I just saved the file as ' , fileReference fullName
		, ' for future reference.'
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
