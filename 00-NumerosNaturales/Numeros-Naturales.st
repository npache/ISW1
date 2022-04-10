!classDefinition: #I category: 'Numeros-Naturales'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: 'Numeros-Naturales'!
I class
	instanceVariableNames: 'next previous'!

!I class methodsFor: 'as yet unclassified'!
! !

!I class methodsFor: 'as yet unclassified'!
! !

!I class methodsFor: 'as yet unclassified'!
! !

!I class methodsFor: 'as yet unclassified'!
! !

!I class methodsFor: 'as yet unclassified'!
! !

!I class methodsFor: 'as yet unclassified'!
! !


!I class methodsFor: '--** private fileout/in **--' stamp: 'NP 4/10/2022 18:46:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := I.! !


!classDefinition: #II category: 'Numeros-Naturales'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: 'Numeros-Naturales'!
II class
	instanceVariableNames: 'next previous'!

!II class methodsFor: 'previous and next'!
! !

!II class methodsFor: 'previous and next'!
! !

!II class methodsFor: 'previous and next' stamp: 'NP 4/10/2022 18:46:11'!
next
	next ifNotNil: [ ^ next ].
	next _ II createChildNamed: self nameOfNext.
	next previous: self.
	^ next.! !

!II class methodsFor: 'previous and next'!
! !

!II class methodsFor: 'previous and next'!
! !

!II class methodsFor: 'previous and next'!
! !

!II class methodsFor: 'previous and next'!
! !


!II class methodsFor: 'operaciones' stamp: 'NP 4/10/2022 18:42:44'!
* multiplicando

	^previous * multiplicando + multiplicando! !

!II class methodsFor: 'operaciones' stamp: 'NP 4/10/2022 18:42:51'!
+ sumando
	^ previous + sumando next.! !

!II class methodsFor: 'operaciones' stamp: 'NP 4/10/2022 18:43:04'!
- sustraendo
	^ sustraendo sustraeDe: self.! !

!II class methodsFor: 'operaciones' stamp: 'NP 4/10/2022 18:43:14'!
/ dividendo
	dividendo = self ifTrue: [ ^ I ].
	dividendo = I ifTrue: [ ^ self ].
	^ I + (self - dividendo / dividendo).! !

!II class methodsFor: 'operaciones'!
! !

!II class methodsFor: 'operaciones'!
! !


!II class methodsFor: '--** private fileout/in **--' stamp: 'NP 4/10/2022 18:46:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := I.! !

I initializeAfterFileIn!
II initializeAfterFileIn!