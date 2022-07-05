!classDefinition: #LaddersAndSliddersTest category: 'ISW1-2022-1C-2doParcial'!
TestCase subclass: #LaddersAndSliddersTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-1C-2doParcial'!

!LaddersAndSliddersTest methodsFor: 'as yet unclassified' stamp: 'NP 7/4/2022 21:07:32'!
test01AddLadderCorrectly
	|gameBoard|
	gameBoard:= LaddersAndSlidders new.
	gameBoard addShortCutAt: 2@2 in: 1 endingAt: 2@2 in:2 ofType: Ladder.
	self assert: (gameBoard shortCutExistAt: 2@2 in: 1 endingAt: 2@2 in:2 ofType: Ladder).! !

!LaddersAndSliddersTest methodsFor: 'as yet unclassified' stamp: 'NP 7/4/2022 21:08:30'!
test02AddTwoLaddersCorrectly
	|gameBoard|
	gameBoard:= LaddersAndSlidders new.
	gameBoard addShortCutAt: 2@2 in: 1 endingAt: 2@2 in:2 ofType: Ladder.
	gameBoard addShortCutAt: 2@2 in: 1 endingAt: 2@2 in:3 ofType: Ladder.
	
	self assert: (gameBoard shortCutExistAt: 2@2 in: 1 endingAt: 2@2 in:2 ofType: Ladder).
	self assert: (gameBoard shortCutExistAt: 2@2 in: 1 endingAt: 2@2 in:3 ofType: Ladder).! !

!LaddersAndSliddersTest methodsFor: 'as yet unclassified' stamp: 'NP 7/4/2022 21:30:52'!
test03AddSlidderCorrectly
	|gameBoard|
	gameBoard:= LaddersAndSlidders new.
	gameBoard addShortCutAt: 2@2 in: 2 endingAt: 2@2 in:1 ofType: Slidder.
	self assert: (gameBoard shortCutExistAt: 2@2 in: 2 endingAt: 2@2 in:1 ofType: Slidder).! !

!LaddersAndSliddersTest methodsFor: 'as yet unclassified' stamp: 'NP 7/4/2022 21:31:44'!
test04AddTwoSliddersCorrectly
	|gameBoard|
	gameBoard:= LaddersAndSlidders new.
	gameBoard addShortCutAt: 2@2 in: 2 endingAt: 2@2 in:1 ofType: Slidder.
	gameBoard addShortCutAt: 2@2 in: 3 endingAt: 2@2 in:1 ofType: Slidder.
	
	self assert: (gameBoard shortCutExistAt: 2@2 in: 2 endingAt: 2@2 in:1 ofType: Slidder).
	self assert: (gameBoard shortCutExistAt: 2@2 in: 3 endingAt: 2@2 in:1 ofType: Slidder).! !

!LaddersAndSliddersTest methodsFor: 'as yet unclassified' stamp: 'NP 7/4/2022 21:24:32'!
test05CanNotAddLadderThatDoesNotGoesUp
	|gameBoard|
	gameBoard:= LaddersAndSlidders new.
	self 
		should: [gameBoard addShortCutAt: 2@2 in: 2 endingAt: 2@2 in:2 ofType: Ladder.]
		raise: Error - MessageNotUnderstood 
		withMessageText: Ladder invalidPosition.
		
		! !

!LaddersAndSliddersTest methodsFor: 'as yet unclassified' stamp: 'NP 7/4/2022 21:32:59'!
test06CanNotAddSlidderThatDoesNotGoesDown
	|gameBoard|
	gameBoard:= LaddersAndSlidders new.
	self 
		should: [gameBoard addShortCutAt: 2@2 in: 2 endingAt: 2@2 in:2 ofType: Slidder.]
		raise: Error - MessageNotUnderstood 
		withMessageText: Ladder invalidPosition.
		
		! !


!classDefinition: #LaddersAndSlidders category: 'ISW1-2022-1C-2doParcial'!
Object subclass: #LaddersAndSlidders
	instanceVariableNames: 'shortcuts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-1C-2doParcial'!

!LaddersAndSlidders methodsFor: 'as yet unclassified' stamp: 'NP 7/4/2022 21:25:19'!
addShortCutAt: beginPos in: beginPiso endingAt: endPos in: endPiso ofType: type
	
	shortcuts add:( type initializeAt: beginPos in: beginPiso endingAt: endPos in: endPiso)
	! !

!LaddersAndSlidders methodsFor: 'as yet unclassified' stamp: 'NP 7/4/2022 21:04:06'!
initialize
	shortcuts:= Set new.! !

!LaddersAndSlidders methodsFor: 'as yet unclassified' stamp: 'NP 7/4/2022 21:09:51'!
shortCutExistAt: beginPos in: beginPiso endingAt: endPos in: endPiso ofType: type
	shortcuts do:[:aShortCut|
	(aShortCut startPos = beginPos and: aShortCut startPiso = beginPiso  and: aShortCut finPos = endPos and: aShortCut finPiso = endPiso and: aShortCut class = type) ifTrue:[^true].
	]. 
	^false
	 ! !


!classDefinition: #Shortcut category: 'ISW1-2022-1C-2doParcial'!
Object subclass: #Shortcut
	instanceVariableNames: 'startPos startPiso finPos finPiso'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-1C-2doParcial'!

!Shortcut methodsFor: 'as yet unclassified' stamp: 'NP 7/4/2022 20:57:29'!
finPiso
	^finPiso! !

!Shortcut methodsFor: 'as yet unclassified' stamp: 'NP 7/4/2022 20:57:19'!
finPos 
	^finPos! !

!Shortcut methodsFor: 'as yet unclassified' stamp: 'NP 7/4/2022 20:57:13'!
initializeAt: beginPos in: beginPiso endingAt: endPos in: endPiso
	startPos:=beginPos.
	startPiso:=beginPiso.
	finPos:=endPos.
	finPiso:=endPiso.	
	! !

!Shortcut methodsFor: 'as yet unclassified' stamp: 'NP 7/4/2022 20:57:06'!
startPiso
	^startPiso! !

!Shortcut methodsFor: 'as yet unclassified' stamp: 'NP 7/4/2022 20:56:59'!
startPos 
	^startPos! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Shortcut class' category: 'ISW1-2022-1C-2doParcial'!
Shortcut class
	instanceVariableNames: ''!

!Shortcut class methodsFor: 'as yet unclassified' stamp: 'NP 7/4/2022 21:27:34'!
initializeAt: beginPos in: beginPiso endingAt: endPos in: endPiso
	self canAddAt: beginPos in: beginPiso endingAt: endPos in: endPiso.
	^self new initializeAt: beginPos in: beginPiso endingAt: endPos in: endPiso.
! !


!classDefinition: #Ladder category: 'ISW1-2022-1C-2doParcial'!
Shortcut subclass: #Ladder
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-1C-2doParcial'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Ladder class' category: 'ISW1-2022-1C-2doParcial'!
Ladder class
	instanceVariableNames: ''!

!Ladder class methodsFor: 'as yet unclassified' stamp: 'NP 7/4/2022 21:28:39'!
canAddAt: beginPos in: beginPiso endingAt: endPos in: endPiso.
	beginPiso>=endPiso ifTrue:[self error: self invalidPosition ].! !

!Ladder class methodsFor: 'as yet unclassified' stamp: 'NP 7/4/2022 21:24:15'!
invalidPosition
	^'Invalid position'.! !


!classDefinition: #Slidder category: 'ISW1-2022-1C-2doParcial'!
Shortcut subclass: #Slidder
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-1C-2doParcial'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Slidder class' category: 'ISW1-2022-1C-2doParcial'!
Slidder class
	instanceVariableNames: ''!

!Slidder class methodsFor: 'as yet unclassified' stamp: 'NP 7/4/2022 21:30:07'!
canAddAt: beginPos in: beginPiso endingAt: endPos in: endPiso.
	beginPiso<=endPiso ifTrue:[self error: self invalidPosition ].! !

!Slidder class methodsFor: 'as yet unclassified' stamp: 'NP 7/4/2022 21:30:15'!
invalidPosition
	^'Invalid position'.! !
