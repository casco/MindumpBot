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
ToughtStrain >> addTought: aTought [
	toughts add: aTought 
]

{ #category : 'initialization' }
ToughtStrain >> initialize [ 
  toughts := OrderedCollection new.

]
