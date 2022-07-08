*MultiHighlightSelection
initialize

	(self instVarNames includes: #selectionStarts)
		ifFalse: [self addInstVarName: #selectionStarts].
		
	(self instVarNames includes: #selectionStops)
		ifFalse: [self addInstVarName: #selectionStops].