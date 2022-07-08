*MultiHighlightSelection
displayAdditionalSelectionFrom: selectionStart to: selectionStop In: line on: aCanvas 
	| leftX rightX |


	selectionStart = selectionStop
		ifTrue: ["Only show caret
			on line where
			clicked "
			selectionStart textLine ~= line
				ifTrue: [^ self]]
		ifFalse: ["Test entire
			selection before
			or after here"
			(selectionStop stringIndex < line first
					or: [selectionStart stringIndex > (line last + 1)])
				ifTrue: [^ self].
			"No selection on
			this line"
			(selectionStop stringIndex = line first
					and: [selectionStop textLine ~= line])
				ifTrue: [^ self].
			"Selection ends
			on line above"
			(selectionStart stringIndex = (line last + 1)
					and: [selectionStop textLine ~= line])
				ifTrue: [^ self]].
	"Selection begins on line
	below "
	leftX := (selectionStart stringIndex <= line first
				ifTrue: [line]
				ifFalse: [selectionStart]) left.
	rightX := (selectionStop stringIndex > (line last + 1)
					or: [selectionStop stringIndex = (line last + 1)
							and: [selectionStop textLine ~= line]])
				ifTrue: [line right]
				ifFalse: [selectionStop left].
	selectionStart = selectionStop
		ifTrue: [| w pos |
			w := caretRect
						ifNil: [self caretWidth]
						ifNotNil: [caretRect width].
			pos := leftX - (w // 2).
			caretRect := pos @ line top corner: pos + w @ line bottom.
			(self showCaret
					and: [self focused])
				ifFalse: [^ self].
			Editor dumbbellCursor
				ifTrue: [self
						displayDumbbellCursorOn: aCanvas
						at: pos
						in: line]
				ifFalse: [self
						displaySimpleCursorOn: aCanvas
						at: pos
						in: line]]
		ifFalse: [caretRect := nil.
			aCanvas
				fillRectangle: (leftX @ line top corner: rightX @ line bottom)
				color: (self focused
						ifTrue: [self additionalSelectionColor]
						ifFalse: [self additionalUnfocusedSelectionColor])]