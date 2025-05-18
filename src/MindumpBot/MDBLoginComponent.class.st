Class {
	#name : 'MDBLoginComponent',
	#superclass : 'MDBAbstractComponent',
	#instVars : [
		'accessCode'
	],
	#category : 'MindumpBot-Seaside',
	#package : 'MindumpBot',
	#tag : 'Seaside'
}

{ #category : 'accessing' }
MDBLoginComponent >> accessCode [

	^ accessCode
]

{ #category : 'accessing' }
MDBLoginComponent >> accessCode: anObject [

	accessCode := anObject
]

{ #category : 'callbacks' }
MDBLoginComponent >> attempLogin [

	| bot brain |
	bot := MindumpBot botRegistry first.
	brain := bot brainForCode: accessCode.
	accessCode := nil.
	brain ifNotNil: [
		self session brain: brain.
		self call: MDBHomeComponent new ]
]

{ #category : 'rendering' }
MDBLoginComponent >> renderContentOn: html [

	html container: [
		html break.
		html jumbotron: [
			html row: [
				self renderPresentationOn: html.
				self renderLoginFormOn: html ] ] ].

]

{ #category : 'updating' }
MDBLoginComponent >> renderLoginFormOn: html [

	html form: [
		html textInput
			formControl;
			on: #accessCode of: self.
		html break.

		html formButton
			bePrimary;
			callback: [ self attempLogin ];
			with: 'Login' ]
]

{ #category : 'rendering' }
MDBLoginComponent >> renderPresentationOn: html [
	 html heading
				level1;
				class: 'display-4';
				with: 'Mindump bot'.

			html paragraph
				class: 'lead';
				with:
					'Mindump is your externalized thinking companion. Capture thought strains throughout the day — fragmented, spontaneous, or focused — and later distill them into structured narratives ready to publish as blog posts, LinkedIn updates, or X threads.'.
			html paragraph with: 'To log in: 1)	Open Telegram and send the command /login to @MindumpBot.	2)	The bot will reply with a one-time login code. 	3)	Enter the code below to access your Mindump dashboard.' 
]
