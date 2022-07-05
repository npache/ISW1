!classDefinition: #LaddersAndSlidesTest category: 'ISW1-2022-1C-2doParcial'!
TestCase subclass: #LaddersAndSlidesTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-1C-2doParcial'!

!LaddersAndSlidesTest methodsFor: 'as yet unclassified' stamp: 'MY 7/4/2022 20:07:58'!
firstFloor

	| ladders slides |
	
	ladders := OrderedCollection new.
	ladders add: (Ladder fromLevel: 1 point: 2@3 toLevel: 2 point: 2@2).

	slides := OrderedCollection new.
	^ RectangularFloor level: 1 ofHeight: 20 andWidth: 20 withLadders: ladders andSlides: slides.! !

!LaddersAndSlidesTest methodsFor: 'as yet unclassified' stamp: 'MY 7/4/2022 19:57:46'!
floorWithoutShortcutsLevel: aLevel

	| shortcuts |
	
	shortcuts := OrderedCollection new.
	
	^ RectangularFloor level: aLevel ofHeight: 5 andWidth: 4 withLadders: shortcuts andSlides: shortcuts.! !

!LaddersAndSlidesTest methodsFor: 'as yet unclassified' stamp: 'MY 7/4/2022 21:01:30'!
test01PlayersMustStartOnBeginning

	| firstFloor secondFloor game floors dice |
	
	firstFloor := self firstFloor.
	secondFloor := self floorWithoutShortcutsLevel: 2.
	floors := OrderedCollection newFrom: (Array with: firstFloor with: secondFloor).
	dice := Dice withFaces: 12.
	game := LaddersAndSlides withFloors: floors beginningFloor: 1 point: 1@1 endingFloor: 2 point: 4@4 withDice: dice andPlayers: 2.
	
	game players do:[:aPlayer | 
		self assert: [aPlayer position = (1@1)]].! !

!LaddersAndSlidesTest methodsFor: 'as yet unclassified' stamp: 'MY 7/4/2022 21:19:41'!
test02PlayerCanOnlyMoveInItsTurn

	| firstFloor secondFloor game floors dice |
	
	firstFloor := self firstFloor.
	secondFloor := self floorWithoutShortcutsLevel: 2.
	floors := OrderedCollection newFrom: (Array with: firstFloor with: secondFloor).
	dice := Dice withFaces: 12.
	game := LaddersAndSlides withFloors: floors beginningFloor: 1 point: 1@1 endingFloor: 2 point: 4@4 withDice: dice andPlayers: 2.
	game movePlayer: 1.
	
	self  should: [ game movePlayer: 1 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | anError messageText = LaddersAndSlides playerCannotMoveInOthersTurn ].
	game movePlayer: 2.
	
	self  should: [ game movePlayer: 2 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | anError messageText = LaddersAndSlides playerCannotMoveInOthersTurn ].! !

!LaddersAndSlidesTest methodsFor: 'as yet unclassified' stamp: 'MY 7/4/2022 21:48:47'!
test03MovePlayerShouldTranslatePlayerBetweenNegativeFiveAndPositiveSix

	| firstFloor secondFloor game floors dice |
	
	firstFloor := self firstFloor.
	secondFloor := self floorWithoutShortcutsLevel: 2.
	floors := OrderedCollection newFrom: (Array with: firstFloor with: secondFloor).
	dice := Dice withFaces: 12.
	
	game := LaddersAndSlides withFloors: floors beginningFloor: 1 point: 7@7 endingFloor: 2 point: 4@4 withDice: dice andPlayers: 2.
	game movePlayer: ((game players) at: 1) to: (1@1).
	self assert: (game playerPosition: 1) equals: 2@2.
	
	game := LaddersAndSlides withFloors: floors beginningFloor: 1 point: 7@7 endingFloor: 2 point: 4@4 withDice: dice andPlayers: 2.
	game movePlayer: ((game players) at: 1) to: (6@6).
	self assert: (game playerPosition: 1) equals: 7@7.
	
	game := LaddersAndSlides withFloors: floors beginningFloor: 1 point: 7@7 endingFloor: 2 point: 4@4 withDice: dice andPlayers: 2.
	game movePlayer: ((game players) at: 1) to: (12@12).
	self assert: (game playerPosition: 1) equals: 13@13.
	
	! !

!LaddersAndSlidesTest methodsFor: 'as yet unclassified' stamp: 'MY 7/4/2022 21:51:01'!
test04IfPlayerMovedMoreThanMapBorderItShouldLandAtBorder

	
	| firstFloor secondFloor game floors dice |
	
	firstFloor := self floorWithoutShortcutsLevel: 1.
	secondFloor := self floorWithoutShortcutsLevel: 2.
	floors := OrderedCollection newFrom: (Array with: firstFloor with: secondFloor).
	dice := Dice withFaces: 12.
	
	game := LaddersAndSlides withFloors: floors beginningFloor: 1 point: 2@2 endingFloor: 2 point: 4@4 withDice: dice andPlayers: 2.
	game movePlayer: ((game players) at: 1) to: (1@1).
	self assert: (game playerPosition: 1) equals: 1@1.
	
	game := LaddersAndSlides withFloors: floors beginningFloor: 1 point: 2@2 endingFloor: 2 point: 4@4 withDice: dice andPlayers: 2.
	game movePlayer: ((game players) at: 1) to: (12@12).
	self assert: (game playerPosition: 1) equals: 4@5.! !

!LaddersAndSlidesTest methodsFor: 'as yet unclassified' stamp: 'MY 7/4/2022 19:52:34'!
xtest05IfPlayerMovedToShortcutShouldMoveToDestinationOfShortcut

	! !

!LaddersAndSlidesTest methodsFor: 'as yet unclassified' stamp: 'MY 7/4/2022 19:52:51'!
xtest06IfPlayerMovedToBeginningOfShortcutConnectionsShouldMoveToLastShortcutDestination

	! !

!LaddersAndSlidesTest methodsFor: 'as yet unclassified' stamp: 'MY 7/4/2022 19:52:58'!
xtest07IfPlayerMovedToEndGameShouldEnd

	! !


!classDefinition: #RectangularFloorTest category: 'ISW1-2022-1C-2doParcial'!
TestCase subclass: #RectangularFloorTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-1C-2doParcial'!

!RectangularFloorTest methodsFor: 'as yet unclassified' stamp: 'MY 7/4/2022 18:34:33'!
test01FloorMustHaveAMapALevelNumberAListOfLaddersAndOfSlides

	| floor ladders slides |
	
	ladders := OrderedCollection new.
	ladders add: Ladder new.
	slides := OrderedCollection new.
	floor := RectangularFloor level: 1 ofHeight: 5 andWidth: 4 withLadders: ladders andSlides: slides.
	
	
	^self assert: [floor map height = 5.
		floor map width = 4.
		floor level = 1.
		floor ladders size = 1.
		floor slides size = 0 ]! !


!classDefinition: #ShortcutTest category: 'ISW1-2022-1C-2doParcial'!
TestCase subclass: #ShortcutTest
	instanceVariableNames: 'origin destination'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-1C-2doParcial'!

!ShortcutTest methodsFor: 'as yet unclassified' stamp: 'MY 7/4/2022 18:50:15'!
test01SlideOriginLevelShouldBeHigherThanDestination

	| slide |
	
	self  should: [ slide := Slide fromLevel: 1 point: 1@2 toLevel: 2 point: 2@1 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | anError messageText = Slide originLevelMustBeHigherThanDestination ]! !

!ShortcutTest methodsFor: 'as yet unclassified' stamp: 'MY 7/4/2022 19:00:24'!
test02LadderDestinationLevelShouldBeHigherThanOrigin

	| ladder |
	
	self  should: [ ladder := Ladder fromLevel: 2 point: 1@2 toLevel: 1 point: 2@1 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | anError messageText = Ladder destinationLevelMustBeHigherThanOrigin ]! !


!classDefinition: #Dice category: 'ISW1-2022-1C-2doParcial'!
Object subclass: #Dice
	instanceVariableNames: 'faces'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-1C-2doParcial'!

!Dice methodsFor: 'as yet unclassified' stamp: 'MY 7/4/2022 20:22:04'!
initializeWithFaces: aNumber

	faces := aNumber.! !

!Dice methodsFor: 'as yet unclassified' stamp: 'MY 7/4/2022 20:21:15'!
throwDice

	^ (1 to: faces) atRandom! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Dice class' category: 'ISW1-2022-1C-2doParcial'!
Dice class
	instanceVariableNames: ''!

!Dice class methodsFor: 'as yet unclassified' stamp: 'MY 7/4/2022 20:21:46'!
withFaces: aNumber

	^self new initializeWithFaces: aNumber! !


!classDefinition: #LaddersAndSlides category: 'ISW1-2022-1C-2doParcial'!
Object subclass: #LaddersAndSlides
	instanceVariableNames: 'floors beginningFloor endingFloor begin end players dice playerTurn'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-1C-2doParcial'!

!LaddersAndSlides methodsFor: 'initialize' stamp: 'MY 7/4/2022 21:53:43'!
initializeWithFloors: aListOfFloors beginningFloor: aBeginningFloor point: beginPoint endingFloor: anEndingFloor point: endPoint withDice: aDice andPlayers: aNumberOfPlayers

	floors := aListOfFloors.
	beginningFloor := aBeginningFloor.
	endingFloor := anEndingFloor.
	begin := beginPoint.
	end := endPoint.
	dice := aDice.
	playerTurn := 1.
	players := OrderedCollection new.
	self setPlayers: aNumberOfPlayers onPosition: beginPoint andLevel: aBeginningFloor .! !

!LaddersAndSlides methodsFor: 'initialize' stamp: 'MY 7/4/2022 21:53:58'!
setPlayers: aNumberOfPlayers onPosition: beginPoint andLevel: aBeginningFloor
	
	| turn |
	
	turn := 1.
	^ aNumberOfPlayers timesRepeat: [ players add: (Player atPosition: beginPoint withTurn: turn andLevel: aBeginningFloor).
								turn := turn + 1 ]! !


!LaddersAndSlides methodsFor: 'playing' stamp: 'MY 7/4/2022 21:40:12'!
movePlayer: aPlayer
	
	| player |
	
	self validateIsPlayerTurn: aPlayer.
	player := players at: aPlayer.
	player moveWithDice: dice on: self.
	players at: aPlayer put: player.
	playerTurn := playerTurn + 1.! !

!LaddersAndSlides methodsFor: 'playing' stamp: 'MY 7/4/2022 21:58:41'!
movePlayer: aPlayer to: aPoint
	
	| newPosition floorMap limitMap |
	floorMap := (floors at: (aPlayer level)) map.
	newPosition := (aPlayer position) + (aPoint - (6@6)).
	limitMap := (floorMap width)@(floorMap width).
	(newPosition > limitMap) ifTrue: [newPosition := limitMap] .
	(newPosition < 1@1) ifTrue: [newPosition := 1@1].

	^ aPlayer setPosition: newPosition.! !


!LaddersAndSlides methodsFor: 'accessing' stamp: 'MY 7/4/2022 21:44:29'!
playerPosition: aPlayer

	^ (players at: aPlayer) position! !

!LaddersAndSlides methodsFor: 'accessing' stamp: 'MY 7/4/2022 19:41:09'!
players
	
	^ players.! !


!LaddersAndSlides methodsFor: 'validation' stamp: 'MY 7/4/2022 21:20:06'!
validateIsPlayerTurn: aPlayer

	^ ((playerTurn mod: (players size)) ~= (aPlayer mod: (players size))) ifTrue: [self error: LaddersAndSlides playerCannotMoveInOthersTurn]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LaddersAndSlides class' category: 'ISW1-2022-1C-2doParcial'!
LaddersAndSlides class
	instanceVariableNames: ''!

!LaddersAndSlides class methodsFor: 'instance creation' stamp: 'MY 7/4/2022 21:10:58'!
playerCannotMoveInOthersTurn

	^'No es el turno de este jugador'! !

!LaddersAndSlides class methodsFor: 'instance creation' stamp: 'MY 7/4/2022 20:25:12'!
withFloors: aListOfFloors beginningFloor: aBeginningFloor point: beginPoint endingFloor: anEndingFloor point: endPoint withDice: aDice andPlayers: aNumberOfPlayers
	
	^self new initializeWithFloors: aListOfFloors beginningFloor: aBeginningFloor point: beginPoint endingFloor: anEndingFloor point: endPoint withDice: aDice andPlayers: aNumberOfPlayers.! !


!classDefinition: #Player category: 'ISW1-2022-1C-2doParcial'!
Object subclass: #Player
	instanceVariableNames: 'position turn level'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-1C-2doParcial'!

!Player methodsFor: 'initialize' stamp: 'MY 7/4/2022 20:58:45'!
initializeAtPosition: aPosition withTurn: aTurn

	position := aPosition.
	turn := aTurn.! !

!Player methodsFor: 'initialize' stamp: 'MY 7/4/2022 21:54:14'!
initializeAtPosition: aPosition withTurn: aTurn andLevel: aBeginningFloor

	position := aPosition.
	turn := aTurn.
	level := aBeginningFloor.! !


!Player methodsFor: 'accessing' stamp: 'MY 7/4/2022 21:55:08'!
level

	^ level.! !

!Player methodsFor: 'accessing' stamp: 'MY 7/4/2022 20:38:41'!
position

	^ position.! !


!Player methodsFor: 'playing' stamp: 'MY 7/4/2022 21:38:39'!
moveWithDice: aDice

	| xPos yPos |
	xPos := self throwDice: aDice.
	yPos := self throwDice: aDice.
	self setPosition: (xPos@yPos).
	! !

!Player methodsFor: 'playing' stamp: 'MY 7/4/2022 21:40:48'!
moveWithDice: aDice on: aGame

	| xPos yPos |
	xPos := self throwDice: aDice.
	yPos := self throwDice: aDice.
	aGame movePlayer: self to: (xPos@yPos).
	! !

!Player methodsFor: 'playing' stamp: 'MY 7/4/2022 21:38:54'!
setPosition: aPosition

	position := aPosition.! !

!Player methodsFor: 'playing' stamp: 'MY 7/4/2022 21:06:33'!
throwDice: aDice

	^ aDice throwDice.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Player class' category: 'ISW1-2022-1C-2doParcial'!
Player class
	instanceVariableNames: ''!

!Player class methodsFor: 'instance creation' stamp: 'MY 7/4/2022 21:54:20'!
atPosition: aPosition withTurn: aTurn andLevel: aBeginningFloor
	
	^self new initializeAtPosition: aPosition withTurn: aTurn andLevel: aBeginningFloor.! !


!classDefinition: #RectangularFloor category: 'ISW1-2022-1C-2doParcial'!
Object subclass: #RectangularFloor
	instanceVariableNames: 'map slides ladders level'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-1C-2doParcial'!

!RectangularFloor methodsFor: 'accessing' stamp: 'MY 7/4/2022 18:26:22'!
ladders
	
	^ladders ! !

!RectangularFloor methodsFor: 'accessing' stamp: 'MY 7/4/2022 18:19:22'!
level
	
	^level! !

!RectangularFloor methodsFor: 'accessing' stamp: 'MY 7/4/2022 18:08:42'!
map
	
	^map.! !

!RectangularFloor methodsFor: 'accessing' stamp: 'MY 7/4/2022 18:35:57'!
slides
	
	^slides.! !


!RectangularFloor methodsFor: 'initialize' stamp: 'MY 7/4/2022 20:23:02'!
initializeLevel: aNumber ofHeight: aHeight andWidth: aWidth withLadders: listOfLadders andSlides: listOfSlides
	
	map := Rectangle origin: 1@aHeight corner: aWidth@1.
	level := aNumber.
	ladders := listOfLadders.
	slides := listOfSlides.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RectangularFloor class' category: 'ISW1-2022-1C-2doParcial'!
RectangularFloor class
	instanceVariableNames: ''!

!RectangularFloor class methodsFor: 'instance creation' stamp: 'MY 7/4/2022 20:23:02'!
level: aNumber ofHeight: aHeight andWidth: aWidth withLadders: listOfLadders andSlides: listOfSlides
	
	^self new initializeLevel: aNumber ofHeight: (aHeight+1) andWidth: (aWidth+1) withLadders: listOfLadders andSlides: listOfSlides . ! !


!classDefinition: #Shortcut category: 'ISW1-2022-1C-2doParcial'!
Object subclass: #Shortcut
	instanceVariableNames: 'origin destination originLevel originPoint destinationLevel destinationPoint'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-1C-2doParcial'!

!Shortcut methodsFor: 'as yet unclassified' stamp: 'MY 7/4/2022 20:23:18'!
initializeFromLevel: anOriginLevel point: anOriginPoint toLevel: aDestinationLevel point: aDestinationPoint 

	originLevel := anOriginLevel.
	originPoint := anOriginPoint.
	destinationLevel := aDestinationLevel.
	destinationPoint := aDestinationPoint.! !

!Shortcut methodsFor: 'as yet unclassified' stamp: 'MY 7/4/2022 19:05:34'!
validate: aLevel LowerThan: anotherLevel orThrow: errorMessage

	(aLevel > anotherLevel) ifTrue: [^ self error: errorMessage ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Shortcut class' category: 'ISW1-2022-1C-2doParcial'!
Shortcut class
	instanceVariableNames: ''!

!Shortcut class methodsFor: 'as yet unclassified' stamp: 'MY 7/4/2022 20:23:18'!
fromLevel: anOriginLevel point: originPoint toLevel: aDestinationLevel point: destinationPoint
	
	^self new initializeFromLevel: anOriginLevel point: originPoint toLevel: aDestinationLevel point: destinationPoint ! !


!classDefinition: #Ladder category: 'ISW1-2022-1C-2doParcial'!
Shortcut subclass: #Ladder
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-1C-2doParcial'!

!Ladder methodsFor: 'as yet unclassified' stamp: 'MY 7/4/2022 20:23:18'!
initializeFromLevel: anOriginLevel point: anOriginPoint toLevel: aDestinationLevel point: aDestinationPoint 
	
	self validate: anOriginLevel LowerThan: aDestinationLevel orThrow: Ladder destinationLevelMustBeHigherThanOrigin.
	super initializeFromLevel: anOriginLevel point: anOriginPoint toLevel: aDestinationLevel point: aDestinationPoint.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Ladder class' category: 'ISW1-2022-1C-2doParcial'!
Ladder class
	instanceVariableNames: ''!


!Ladder class methodsFor: 'error' stamp: 'MY 7/4/2022 18:58:26'!
destinationLevelMustBeHigherThanOrigin
	
	^'The destination level of a slide must be higher than origin level'! !


!classDefinition: #Slide category: 'ISW1-2022-1C-2doParcial'!
Shortcut subclass: #Slide
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-1C-2doParcial'!

!Slide methodsFor: 'initialize' stamp: 'MY 7/4/2022 20:23:18'!
initializeFromLevel: anOriginLevel point: anOriginPoint toLevel: aDestinationLevel point: aDestinationPoint 
	
	self validate: aDestinationLevel LowerThan: anOriginLevel orThrow: Slide originLevelMustBeHigherThanDestination.
	super initializeFromLevel: anOriginLevel point: anOriginPoint toLevel: aDestinationLevel point: aDestinationPoint.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Slide class' category: 'ISW1-2022-1C-2doParcial'!
Slide class
	instanceVariableNames: ''!


!Slide class methodsFor: 'error' stamp: 'MY 7/4/2022 18:46:59'!
originLevelMustBeHigherThanDestination	
	
	^'The origin level of a slide must be higher than destination level'! !
