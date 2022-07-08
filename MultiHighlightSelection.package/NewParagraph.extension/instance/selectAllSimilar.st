*MultiHighlightSelection
selectAllSimilar

	| start stop searchString where position |
	self clearAdditionalSelections.
	
	selectionStart ifNil: [^ self].
	
	start := selectionStart stringIndex.
	stop := selectionStop stringIndex.
	
	stop - start < 2 ifTrue: [^ self].
	
	searchString := self text copyFrom: start to: stop - 1.
	position := 0.
	
	[where := self text
				findString: searchString
				startingAt: position
				caseSensitive: Preferences caseSensitiveFinds.
				
	where = 0
		ifTrue: [^ self]
		ifFalse: [
			(where >= start and: [where <= stop])
				ifFalse: [self 
					addAdditionalSelectionStart: (self characterBlockForIndex: where) 
					selectionStop: (self characterBlockForIndex: where + searchString size)].			
				 position := where + searchString size].
	true] whileTrue