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


!I class methodsFor: '--** private fileout/in **--' stamp: 'NP 4/10/2022 19:23:55'!
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

!II class methodsFor: 'previous and next' stamp: 'NP 4/10/2022 19:23:39'!
nameOfNext

	(self name endsWith: 'VIII') ifTrue:[^(self name withoutSuffix: 'VIII'), 'IX'].
	(self name endsWith: 'IV') ifTrue:[^(self name withoutSuffix: 'IV'), 'V'].
	(self name endsWith: 'III') ifTrue:[^(self name withoutSuffix: 'III'), 'IV'].
	^ self name, 'I'! !

!II class methodsFor: 'previous and next'!
! !

!II class methodsFor: 'previous and next'!
! !

!II class methodsFor: 'previous and next'!
! !

!II class methodsFor: 'previous and next'!
! !

!II class methodsFor: 'previous and next'!
! !

!II class methodsFor: 'previous and next'!
! !


!II class methodsFor: 'operaciones' stamp: 'NP 4/10/2022 19:22:53'!
* multiplicando

	^previous * multiplicando + multiplicando! !

!II class methodsFor: 'operaciones' stamp: 'NP 4/10/2022 19:23:02'!
+ sumando
	^ previous + sumando next.! !

!II class methodsFor: 'operaciones' stamp: 'NP 4/10/2022 19:23:17'!
- sustraendo
	^ sustraendo sustraeDe: self.! !

!II class methodsFor: 'operaciones' stamp: 'NP 4/10/2022 19:23:10'!
/ dividendo
	dividendo = self ifTrue: [ ^ I ].
	dividendo = I ifTrue: [ ^ self ].
	^ I + (self - dividendo / dividendo).! !

!II class methodsFor: 'operaciones'!
! !

!II class methodsFor: 'operaciones'!
! !


!II class methodsFor: '--** private fileout/in **--' stamp: 'NP 4/10/2022 19:23:55'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := I.! !

I initializeAfterFileIn!
II initializeAfterFileIn!