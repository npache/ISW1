!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 17:08:24'!
test01RoverStayAtOriginWhenReceivesEmptyStringHeadingSouth
	|marsRover|
	marsRover:=MarsRover new.
	self assert:( (marsRover process: '' )  isAt: 0@0 facing:South)
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 17:17:37'!
test02RoverMovesOneTimeForwardsWhenReceivesOneFHeadingSouth
	|marsRover|
	marsRover:=MarsRover new.
	
	self assert:( (marsRover process: 'f' )  isAt: 0@-1 facing:South)
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 17:17:44'!
test03RoverMovesFiveTimesForwardsWhenReceivesFiveFHeadingSouth
	|marsRover|
	marsRover:=MarsRover new.
	
	self assert:( (marsRover process: 'fffff' )  isAt: 0@-5 facing:South)
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 17:17:52'!
test04RoverMovesOneTimeBackwardsWhenReceivesOneBHeadingSouth
	|marsRover|
	marsRover:=MarsRover new.
	
	self assert:( (marsRover process: 'b' )  isAt: 0@1 facing:South)
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 17:18:03'!
test05RoverMovesFiveTimesBackwardsWhenReceivesFiveBHeadingSouth
	|marsRover|
	marsRover:=MarsRover new.
	
	self assert:( (marsRover process: 'bbbbb' )  isAt: 0@5 facing:South)
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 17:18:06'!
test06RoverMovesTwoTimesForwardAndOneTimeBackwardWhenReceivesTwoFAndOneBHeadingSouth
	|marsRover|
	marsRover:=MarsRover new.
	
	self assert:( (marsRover process: 'ffb' )  isAt: 0@-1 facing:South)
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 17:18:08'!
test07RoverRotatesEastWhenReceivesOneLHeadingSouth
	|marsRover|
	marsRover:=MarsRover new.
	
	self assert:( (marsRover process: 'l' )  isAt: 0@0 facing:East)
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 17:18:10'!
test08RoverRotatesWestWhenReceivesThreeLHeadingSouth
	|marsRover|
	marsRover:=MarsRover new.
	
	self assert:( (marsRover process: 'lll' )  isAt: 0@0 facing:West)
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 17:18:13'!
test09RoverRotatesWestWhenReceivesOneRHeadingSouth
	|marsRover|
	marsRover:=MarsRover new.
	
	self assert:( (marsRover process: 'r' )  isAt: 0@0 facing:West)
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 17:18:16'!
test10RoverRotatesEastWhenReceivesThreeRHeadingSouth
	|marsRover|
	marsRover:=MarsRover new.
	
	self assert:( (marsRover process: 'rrr' )  isAt: 0@0 facing:East)
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 17:18:20'!
test11RoverRotatesEastMovesForwardsWhenReceivesThreeROneFHeadingSouth
	|marsRover|
	marsRover:=MarsRover new.
	
	self assert:( (marsRover process: 'rrrf' )  isAt: 1@0 facing:East)
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 17:18:23'!
test12RoverRotatesWestMovesForwardsWhenReceivesThreeLOneFHeadingSouth
	|marsRover|
	marsRover:=MarsRover new.
	
	self assert:( (marsRover process: 'lllf' )  isAt: -1@0 facing:West)
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 17:18:26'!
test13RoverRotatesNorthMovesForwardWhenReceivesThreeROneLOneFHeadingSouth
	|marsRover|
	marsRover:=MarsRover new.
	
	self assert:( (marsRover process: 'rrrlf' )  isAt: 0@1 facing:North)
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 17:18:30'!
test14RoverRotatesEastMovesBackwardWhenReceivesThreeROneBHeadingSouth
	|marsRover|
	marsRover:=MarsRover new.
	
	self assert:( (marsRover process: 'rrrb' )  isAt: -1@0 facing:East)
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 17:18:32'!
test15RoverRotatesWestMovesBackwardsWhenReceivesThreeLOneBHeadingSouth
	|marsRover|
	marsRover:=MarsRover new.
	
	self assert:( (marsRover process: 'lllb' )  isAt: 1@0 facing:West)
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 17:18:35'!
test16RoverRotatesNorthMovesBackwardsWhenReceivesThreeROneLOneBHeadingSouth
	|marsRover|
	marsRover:=MarsRover new.
	
	self assert:( (marsRover process: 'rrrlb' )  isAt: 0@-1 facing:North)
	! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position facing'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'movement' stamp: 'NP 5/14/2022 16:43:11'!
initialize 
	
	position:= 0@0.
	facing:=South new.! !

!MarsRover methodsFor: 'movement' stamp: 'NP 5/14/2022 18:22:15'!
move: aPosition
	
	position:=aPosition
	! !

!MarsRover methodsFor: 'movement' stamp: 'NP 5/14/2022 18:22:10'!
process: aString 
	
	aString do:[:char| (MarsRoverMovement marsRover: self movement: char) move]
! !

!MarsRover methodsFor: 'movement' stamp: 'NP 5/14/2022 18:22:13'!
rotate: aCoordinate
	
	facing:=aCoordinate
	! !


!MarsRover methodsFor: 'position' stamp: 'NP 5/14/2022 18:13:39'!
facing
	^facing! !

!MarsRover methodsFor: 'position' stamp: 'NP 5/14/2022 17:17:26'!
isAt: aPoint facing: aSymbol 
	^aPoint = position and: (aSymbol= facing class).! !

!MarsRover methodsFor: 'position' stamp: 'NP 5/14/2022 18:13:34'!
position
	^position! !


!classDefinition: #MarsRoverCoordinate category: 'MarsRover'!
Object subclass: #MarsRoverCoordinate
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverCoordinate methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 16:39:51'!
leftCoordinate
	^self subclassResponsibility.
	 ! !

!MarsRoverCoordinate methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 17:05:14'!
moveBackwardFrom: aPosition
	^self subclassResponsibility.
	 ! !

!MarsRoverCoordinate methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 17:05:25'!
moveForwardFrom: aPosition
	^self subclassResponsibility.
	 ! !

!MarsRoverCoordinate methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 16:39:45'!
rightCoordinate
	^self subclassResponsibility.
	 ! !


!classDefinition: #East category: 'MarsRover'!
MarsRoverCoordinate subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!East methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 16:46:17'!
leftCoordinate
	^North new.! !

!East methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 17:06:02'!
moveBackwardFrom: aPosition
	^(aPosition x-1 )@(aPosition y)
	 ! !

!East methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 17:05:50'!
moveForwardFrom: aPosition
	^(aPosition x+1 )@(aPosition y)
	 ! !

!East methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 16:46:12'!
rightCoordinate
	^South new.! !


!classDefinition: #North category: 'MarsRover'!
MarsRoverCoordinate subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!North methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 16:46:07'!
leftCoordinate
	^West new.! !

!North methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 17:06:16'!
moveBackwardFrom: aPosition
	^(aPosition x)@(aPosition y-1)
	 ! !

!North methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 17:06:28'!
moveForwardFrom: aPosition
	^(aPosition x)@(aPosition y+1)
	 ! !

!North methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 16:46:03'!
rightCoordinate
	^East new.! !


!classDefinition: #South category: 'MarsRover'!
MarsRoverCoordinate subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!South methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 16:45:58'!
leftCoordinate
	^East new.! !

!South methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 17:06:41'!
moveBackwardFrom: aPostion
	^(aPostion x)@(aPostion y+1)
	 ! !

!South methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 17:06:53'!
moveForwardFrom: aPosition
	^(aPosition x)@(aPosition y-1)
	 ! !

!South methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 16:45:56'!
rightCoordinate
	^West new.! !


!classDefinition: #West category: 'MarsRover'!
MarsRoverCoordinate subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!West methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 16:45:52'!
leftCoordinate
	^South new.! !

!West methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 17:07:03'!
moveBackwardFrom: aPosition
	^(aPosition x+1 )@(aPosition y)
	 ! !

!West methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 17:07:15'!
moveForwardFrom: aPosition
	^(aPosition x-1 )@(aPosition y)
	 ! !

!West methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 16:45:48'!
rightCoordinate
	^North new.! !


!classDefinition: #MarsRoverMovement category: 'MarsRover'!
Object subclass: #MarsRoverMovement
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverMovement methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 18:11:44'!
initializeWith: aMarsRover
	marsRover:=aMarsRover.! !

!MarsRoverMovement methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 18:03:48'!
move 
	^self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverMovement class' category: 'MarsRover'!
MarsRoverMovement class
	instanceVariableNames: ''!

!MarsRoverMovement class methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 18:20:02'!
marsRover: aMarsRover movement: aMovement
	^(self subclasses detect:[:aSubclass | aSubclass canMove: aMovement]) new initializeWith: aMarsRover.
! !


!classDefinition: #Backward category: 'MarsRover'!
MarsRoverMovement subclass: #Backward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Backward methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 18:18:35'!
move

	marsRover move: (marsRover facing moveBackwardFrom: marsRover position) ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Backward class' category: 'MarsRover'!
Backward class
	instanceVariableNames: ''!

!Backward class methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 17:51:47'!
canMove: aMovement
	^aMovement = $b.! !


!classDefinition: #Forward category: 'MarsRover'!
MarsRoverMovement subclass: #Forward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Forward methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 18:18:00'!
move

	marsRover move: (marsRover facing moveForwardFrom: marsRover position) ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Forward class' category: 'MarsRover'!
Forward class
	instanceVariableNames: ''!

!Forward class methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 17:51:54'!
canMove: aMovement
	^aMovement = $f.! !


!classDefinition: #Left category: 'MarsRover'!
MarsRoverMovement subclass: #Left
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Left methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 18:17:18'!
move 
	marsRover rotate: (marsRover facing leftCoordinate) ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Left class' category: 'MarsRover'!
Left class
	instanceVariableNames: ''!

!Left class methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 17:52:00'!
canMove: aMovement
	^aMovement = $l.! !


!classDefinition: #Right category: 'MarsRover'!
MarsRoverMovement subclass: #Right
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Right methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 18:16:19'!
move 
	marsRover rotate: (marsRover facing rightCoordinate) ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Right class' category: 'MarsRover'!
Right class
	instanceVariableNames: ''!

!Right class methodsFor: 'as yet unclassified' stamp: 'NP 5/14/2022 17:52:05'!
canMove: aMovement
	^aMovement = $r.! !
