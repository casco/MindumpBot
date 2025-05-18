Class {
	#name : 'MDBSession',
	#superclass : 'WASession',
	#instVars : [
		'brain'
	],
	#category : 'MindumpBot-Seaside',
	#package : 'MindumpBot',
	#tag : 'Seaside'
}

{ #category : 'accessing' }
MDBSession >> brain [

	^ brain
]

{ #category : 'accessing' }
MDBSession >> brain: anObject [

	brain := anObject
]
