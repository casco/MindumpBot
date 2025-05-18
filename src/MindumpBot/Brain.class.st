Class {
	#name : 'Brain',
	#superclass : 'Object',
	#instVars : [
		'toughtStrains',
		'telegramUser',
		'activeToughtStrain',
		'oneTimeAccessCode',
		'accessCodeValidThrough'
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
		  toughtStrains
			  ifEmpty: [ toughtStrains add: ToughtStrain new ]
			  ifNotEmpty: [ toughtStrains first ] ]
]

{ #category : 'initialize' }
Brain >> addTought: aTought [

	self activeToughtStrain addTought: aTought
]

{ #category : 'initialize' }
Brain >> addToughtStrain: aToughtStrain [

	toughtStrains add: aToughtStrain
]

{ #category : 'initialize' }
Brain >> initialize [ 
  toughtStrains := OrderedCollection new.

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
Brain >> toughtStrains [

	^ toughtStrains
]
