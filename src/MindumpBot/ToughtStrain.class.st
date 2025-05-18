Class {
	#name : 'ToughtStrain',
	#superclass : 'Object',
	#instVars : [
		'toughts'
	],
	#category : 'MindumpBot-Model',
	#package : 'MindumpBot',
	#tag : 'Model'
}

{ #category : 'accessing' }
ToughtStrain >> add: aTought [
	toughts add: aTought 
]

{ #category : 'initialization' }
ToughtStrain >> initialize [ 
  toughts := OrderedCollection new.

]
