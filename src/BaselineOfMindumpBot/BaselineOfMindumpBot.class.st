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
			seaside: spec;
			bootstrap4: spec;
			openAiPapi: spec.
		spec
			package: 'MindumpBot'
			with: [
			spec requires: #( 'Telebots-Core' 'OpenAI-Speech' 'OpenAI-API' 'Seaside3' 'Seaside-REST-Core' 'Bootstrap4-Core'  ) ] ]
]

{ #category : 'baselines' }
BaselineOfMindumpBot >> bootstrap4: spec [
	spec
		package: 'Bootstrap4-Core'
		with: [ spec repository: 'github://astares/Seaside-Bootstrap4:master/src' ].

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
BaselineOfMindumpBot >> seaside: spec [
	spec
		baseline: 'Seaside3'
		with: [ spec repository: 'github://SeasideSt/Seaside:master/repository' ].
	spec
		package: 'Seaside-REST-Core'
		with: [ spec repository: 'github://SeasideSt/Seaside:master/repository' ]

]

{ #category : 'baselines' }
BaselineOfMindumpBot >> telebots: spec [

	spec package: 'Telebots-Core' with: [
		spec repository: 'github://casco/telebots'.
		spec requires: #( 'OpenAI-Speech' 'OpenAI-Speech' ) ]
]
