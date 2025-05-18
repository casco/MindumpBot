Class {
	#name : 'ToughtStrain',
	#superclass : 'Object',
	#instVars : [
		'summary',
		'thoughts'
	],
	#category : 'MindumpBot-Model',
	#package : 'MindumpBot',
	#tag : 'Model'
}

{ #category : 'accessing' }
ToughtStrain >> addTought: aTought [
	thoughts add: aTought 
]

{ #category : 'initialization' }
ToughtStrain >> initialize [ 
  thoughts := OrderedCollection new.

]

{ #category : 'accessing' }
ToughtStrain >> summary [

	^ summary ifNil: [
		  thoughts
			  ifEmpty: [ 'An empty thought strain' ]
			  ifNotEmpty: [ thoughts first textContent ] ]
]

{ #category : 'accessing' }
ToughtStrain >> summary: anObject [

	summary := anObject
]

{ #category : 'accessing' }
ToughtStrain >> thoughts [

	^ thoughts
]
