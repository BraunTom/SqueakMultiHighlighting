*MultiHighlightSelection
addAdditionalSelectionStart: startBlock selectionStop: stopBlock
	
	self selectionStarts add: startBlock.
	self selectionStops add: stopBlock