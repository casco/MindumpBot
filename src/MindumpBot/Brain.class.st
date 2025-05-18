Class {
	#name : 'Brain',
	#superclass : 'Object',
	#instVars : [
		'toughtStrains',
		'telegramUser'
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

{ #category : 'initialize' }
Brain >> add: aToughtStrain [

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
