Class {
	#name : 'Brain',
	#superclass : 'Object',
	#instVars : [
		'telegramUser',
		'activeToughtStrain',
		'oneTimeAccessCode',
		'accessCodeValidThrough',
		'thoughtStrains'
	],
	#category : 'MindumpBot-Model',
	#package : 'MindumpBot',
	#tag : 'Model'
}

{ #category : 'instance creation' }
Brain class >> telegramUser: aTelegramUser [

	^ self new
		  telegramUser: aTelegramUser;
		  yourself
]

{ #category : 'accessing' }
Brain >> accessCodeValidThrough [

	^ accessCodeValidThrough
]

{ #category : 'accessing' }
Brain >> activeToughtStrain [

	^ activeToughtStrain ifNil: [
		  thoughtStrains
			  ifEmpty: [ thoughtStrains add: ToughtStrain new ]
			  ifNotEmpty: [ thoughtStrains first ] ]
]

{ #category : 'initialize' }
Brain >> addTought: aTought [

	self activeToughtStrain addTought: aTought
]

{ #category : 'initialize' }
Brain >> addToughtStrain: aToughtStrain [

	thoughtStrains add: aToughtStrain
]

{ #category : 'initialize' }
Brain >> initialize [ 
  thoughtStrains := OrderedCollection new.

]

{ #category : 'accessing' }
Brain >> oneTimeAccessCode [

	^ oneTimeAccessCode
]

{ #category : 'accessing' }
Brain >> oneTimeAccessCode: code accessCodeValidThrough: aDateAndTime [

	oneTimeAccessCode := code.
	accessCodeValidThrough := aDateAndTime
]

{ #category : 'accessing' }
Brain >> telegramUser [

	^ telegramUser
]

{ #category : 'accessing' }
Brain >> telegramUser: anObject [

	telegramUser := anObject
]

{ #category : 'accessing' }
Brain >> thoughtStrains [

	^ thoughtStrains
]
