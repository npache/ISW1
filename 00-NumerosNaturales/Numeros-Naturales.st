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


!I class methodsFor: '--** private fileout/in **--' stamp: 'NP 4/10/2022 19:34:53'!
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
ileout/in **--' stamp: 'NP 4/10/2022 19:34:53' overrides: 50447471! !

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


!II class methodsFor: 'operaciones' stamp: 'NP 4/10/2022 19:33:41'!
* multiplicando
	^ previous * multiplicando + multiplicando.! !

!II class methodsFor: 'operaciones' stamp: 'NP 4/10/2022 19:33:48'!
+ sumando
	^ previous + sumando next.! !

!II class methodsFor: 'operaciones' stamp: 'NP 4/10/2022 19:33:56'!
- substraendo
	^ substraendo sustraeDe: self.! !

!II class methodsFor: 'operaciones' stamp: 'NP 4/10/2022 19:34:14'!
/ dividendo
	dividendo = self ifTrue: [ ^ I ].
	dividendo = I ifTrue: [ ^ self ].
	^ I + (self - dividendo / dividendo).! !

!II class methodsFor: 'operaciones'!
! !

!II class methodsFor: 'operaciones'!
! !


!II class methodsFor: '--** private fileout/in **--' stamp: 'NP 4/10/2022 19:34:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := I.! !

I initializeAfterFileIn!
II initializeAfterFileIn!