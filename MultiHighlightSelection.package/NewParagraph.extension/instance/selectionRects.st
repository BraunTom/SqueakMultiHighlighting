*MultiHighlightSelection
selectionRects
	"Return an array of rectangles representing the selection region."
	| result |
	selectionStart ifNil: [^ Array new].
	result := (self selectionRectsFrom: selectionStart to: selectionStop) asOrderedCollection.
	self selectionStarts with: self selectionStops
		do: [:start :stop | result addAll: (self selectionRectsFrom: start to: stop)].
		
	^ result