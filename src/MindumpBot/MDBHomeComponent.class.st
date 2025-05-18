Class {
	#name : 'MDBHomeComponent',
	#superclass : 'MDBAbstractComponent',
	#category : 'MindumpBot-Seaside',
	#package : 'MindumpBot',
	#tag : 'Seaside'
}

{ #category : 'rendering' }
MDBHomeComponent >> renderContentOn: html [

	html container: [
		self session brain thoughtStrains do: [ :each |
			html paragraph: [ html text: each summary ] ] ]
]
