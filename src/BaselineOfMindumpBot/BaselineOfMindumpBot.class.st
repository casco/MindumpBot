Class {
	#name : 'BaselineOfMindumpBot',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfMindumpBot',
	#package : 'BaselineOfMindumpBot'
}

{ #category : 'baselines' }
BaselineOfMindumpBot >> baseline: spec [

	<baseline>
	spec for: #common do: [
		self
			telebots: spec;
			openAiPapi: spec.
		spec package: 'MindumpBot' with: [
			spec requires:
				#( 'Telebots-Core' 'Mustache-Library' 'OpenAI-Speech'
				   'OpenAI-API' ) ] ]
]

{ #category : 'baselines' }
BaselineOfMindumpBot >> openAiPapi: spec [

	spec
		package: 'OpenAI-Speech'
		with: [ spec repository: 'github://casco/openai-papi:main' ].
	spec
		package: 'OpenAI-API'
		with: [ spec repository: 'github://casco/openai-papi:main' ]
]

{ #category : 'baselines' }
BaselineOfMindumpBot >> telebots: spec [

	spec package: 'Telebots-Core' with: [
		spec repository: 'github://casco/telebots'.
		spec requires: #( 'OpenAI-Speech' 'OpenAI-Speech' ) ]
]
