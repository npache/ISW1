!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing'!
! !

!CustomerBookTest methodsFor: 'testing'!
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MY 4/18/2022 16:20:29'!
createCustomerBook: arg1
	| customerBook |
	customerBook _ CustomerBook new.
	customerBook addCustomerNamed: arg1.
	^ customerBook.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MY 4/18/2022 16:21:02'!
ellapsedTime: arg1
	| startTime endTime |
	startTime _ self timeInMilliseconds.
	arg1 value.
	endTime _ self timeInMilliseconds.
	^ endTime - startTime.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MY 4/18/2022 16:22:33'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	| customerBook timeToAddCustomer |
	customerBook _ CustomerBook new.
	timeToAddCustomer _ self ellapsedTime: [ customerBook addCustomerNamed: 'John Lennon' ].
	self assert: timeToAddCustomer < (50 * millisecond).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MY 4/18/2022 16:23:23'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds
	| customerBook timeToRemoveCustomer customer |
	customer _ 'Paul McCartney'.
	customerBook _ self createCustomerBook: customer.
	timeToRemoveCustomer _ self ellapsedTime: [ customerBook removeCustomerNamed: customer ].
	self assert: timeToRemoveCustomer < (100 * millisecond).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MY 4/18/2022 16:23:42'!
test03CanNotAddACustomerWithEmptyName
	| customerBook |
	customerBook _ CustomerBook new.
	self
		try: [
			customerBook addCustomerNamed: ''.
			self fail ]
		catch: Error
		andDo: [ :argm1_2 |
			self assert: argm1_2 messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MY 4/18/2022 16:24:02'!
test04CanNotRemoveAnInvalidCustomer
	| customerBook customer |
	customer _ 'John Lennon'.
	customerBook _ self createCustomerBook: customer.
	self
		try: [
			customerBook removeCustomerNamed: 'Paul McCartney'.
			self fail ]
		catch: NotFound
		andDo: [ :argm2_3 |
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: customer) ].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MY 4/18/2022 16:24:25'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook
	| customerBook customer |
	customer _ 'Paul McCartney'.
	customerBook _ self createCustomerBook: customer.
	customerBook suspendCustomerNamed: customer.
	self
		assertOn: customerBook
		activeCustomers: 0
		suspendedCustomers: 1
		totalCustomers: 1.
	self assert: (customerBook includesCustomerNamed: customer).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MY 4/18/2022 16:24:55'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook
	| customerBook customer |
	customer _ 'Paul McCartney'.
	customerBook _ self createCustomerBook: customer.
	customerBook suspendCustomerNamed: customer.
	customerBook removeCustomerNamed: customer.
	self
		assertOn: customerBook
		activeCustomers: 0
		suspendedCustomers: 0
		totalCustomers: 0.
	self deny: (customerBook includesCustomerNamed: customer).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MY 4/18/2022 16:25:13'!
test07CanNotSuspendAnInvalidCustomer
	| customerBook customer |
	customer _ 'John Lennon'.
	customerBook _ self createCustomerBook: customer.
	self
		try: [
			customerBook suspendCustomerNamed: 'George Harrison'.
			self fail ]
		catch: CantSuspend
		andDo: [ :argm2_3 |
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: customer) ].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MY 4/18/2022 16:25:37'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	| customerBook customer |
	customer _ 'John Lennon'.
	customerBook _ self createCustomerBook: customer.
	customerBook suspendCustomerNamed: customer.
	self
		try: [
			customerBook suspendCustomerNamed: customer.
			self fail ]
		catch: CantSuspend
		andDo: [ :argm3_3 |
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: customer) ].! !

!CustomerBookTest methodsFor: 'testing'!
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MY 4/18/2022 16:27:16'!
try: aClosure catch: anError andDo: assertions.
	aClosure
		on: anError
		do: assertions.! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing'!
! !

!CustomerBook methodsFor: 'testing'!
! !


!CustomerBook methodsFor: 'initialization'!
! !


!CustomerBook methodsFor: 'customer management'!
! !

!CustomerBook methodsFor: 'customer management'!
! !

!CustomerBook methodsFor: 'customer management'!
! !

!CustomerBook methodsFor: 'customer management'!
! !

!CustomerBook methodsFor: 'customer management'!
! !

!CustomerBook methodsFor: 'customer management'!
! !

!CustomerBook methodsFor: 'customer management'!
! !

!CustomerBook methodsFor: 'customer management'!
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages'!
! !

!CustomerBook class methodsFor: 'error messages'!
! !
