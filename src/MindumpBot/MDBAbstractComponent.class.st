Class {
	#name : 'MDBAbstractComponent',
	#superclass : 'WAComponent',
	#category : 'MindumpBot-Seaside',
	#package : 'MindumpBot',
	#tag : 'Seaside'
}

{ #category : 'updating' }
MDBAbstractComponent >> rendererClass [
	^ SBSHtmlCanvas
]

{ #category : 'updating' }
MDBAbstractComponent >> updateRoot: aWARoot [
	super updateRoot: aWARoot.
	aWARoot
		beHtml5;
		title: 'MindumpBot'.
	aWARoot meta
		name: 'viewport';
		content: 'width=device-width, initial-scale=1.0'.
	aWARoot stylesheet
		url:
			'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'
]
