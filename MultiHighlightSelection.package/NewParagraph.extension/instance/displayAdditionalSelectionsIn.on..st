*MultiHighlightSelection
displayAdditionalSelectionsIn: line on: aCanvas 
	
	self selectionStarts
		ifEmpty: [^ self].
	"No selection"
	aCanvas isShadowDrawing
		ifTrue: [^ self].
	"don't draw selection with
	shadow "
	self selectionStarts with: self selectionStops
		do: [:start :stop | 
			self displayAdditionalSelectionFrom: start to: stop In: line on: aCanvas]