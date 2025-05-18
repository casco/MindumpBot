Class {
	#name : 'Tought',
	#superclass : 'Object',
	#instVars : [
		'textContent',
		'timeStamp'
	],
	#category : 'MindumpBot-Model',
	#package : 'MindumpBot',
	#tag : 'Model'
}

{ #category : 'accessing' }
Tought class >> textContent: aString timeStamp: aDateAndTime [

	^ self new
		  textContent: aString timeStamp: aDateAndTime;
		  yourself
]

{ #category : 'accessing' }
Tought >> textContent [

	^ textContent
]

{ #category : 'accessing' }
Tought >> textContent: aString timeStamp: aDateAndTime [
	textContent := aString .
	timeStamp := aDateAndTime .
]

{ #category : 'accessing' }
Tought >> timeStamp [

	^ timeStamp
]
