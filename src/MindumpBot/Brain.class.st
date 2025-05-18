Class {
	#name : 'Brain',
	#superclass : 'Object',
	#instVars : [
		'toughtStrains',
		'telegramUser',
		'activeToughtStrain'
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
