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

!CustomerBookTest methodsFor: 'testing' stamp: 'NP 4/11/2022 21:45:23'!
addCustomer: aCustomer to:customerBook

	customerBook addCustomerNamed: aCustomer.
	^customerBook! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NP 4/16/2022 18:40:07'!
assertOn: aCustomerBook activeCustomers:numberActiveCustomers suspendedCustomers: numberSuspendedCustomers totalCustomers: numberTotalCustomers

	self assert: numberActiveCustomers equals: aCustomerBook numberOfActiveCustomers.
	self assert: numberSuspendedCustomers equals: aCustomerBook numberOfSuspendedCustomers.
	self assert: numberTotalCustomers equals: aCustomerBook numberOfCustomers.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NP 4/16/2022 18:07:50'!
createCustomerBook: aCustomer
	|customerBook|	
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: aCustomer.
	^ customerBook! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NP 4/11/2022 21:15:03'!
ellapsedTime: aMethod
	| millisecondsBeforeRunning millisecondsAfterRunning|
	millisecondsBeforeRunning := self timeInMilliseconds.
	aMethod value.
	millisecondsAfterRunning := self timeInMilliseconds.
	^ millisecondsAfterRunning -  millisecondsBeforeRunning ! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NP 4/11/2022 21:16:40'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook methodDuration  |
	
	customerBook := CustomerBook new.
	
	methodDuration := self ellapsedTime: [customerBook addCustomerNamed: 'John Lennon'].
	
	self assert: methodDuration < (50 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NP 4/16/2022 18:10:31'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook methodDuration paulMcCartney |
	paulMcCartney := 'Paul McCartney'.
	
	customerBook := self createCustomerBook: paulMcCartney.
	
	
	
	methodDuration := self ellapsedTime:[customerBook removeCustomerNamed: paulMcCartney].
	 	
	
	self assert: methodDuration < (100 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NP 4/11/2022 21:40:33'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook|
			
	customerBook := CustomerBook new.

	
	self try: [ customerBook addCustomerNamed: ''. self fail ] catch: Error andDo: [ :anError | 
		 self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage. 
		 self assert: customerBook isEmpty]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NP 4/16/2022 18:09:58'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
	johnLennon := 'John Lennon'.		
	customerBook := self createCustomerBook: johnLennon .
	
	self try: [ customerBook removeCustomerNamed: 'Paul McCartney'. self fail ] catch: NotFound
		andDo: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
		
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NP 4/16/2022 18:40:51'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	paulMcCartney := 'Paul McCartney'.
       customerBook := self createCustomerBook: paulMcCartney.
	
	customerBook suspendCustomerNamed: paulMcCartney.
	self assertOn: customerBook activeCustomers:0 suspendedCustomers: 1       totalCustomers: 1.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).

	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NP 4/16/2022 18:40:35'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	paulMcCartney := 'Paul McCartney'.
	customerBook := self createCustomerBook: paulMcCartney.
	
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	self assertOn: customerBook activeCustomers:0 suspendedCustomers: 0       totalCustomers: 0.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NP 4/16/2022 18:45:07'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
	johnLennon := 'John Lennon'.		
	customerBook := self createCustomerBook: johnLennon.
	
	
	self try: [ customerBook suspendCustomerNamed: 'George Harrison'. self fail ] catch: CantSuspend
	andDo: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon)  ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NP 4/16/2022 18:45:45'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
	johnLennon := 'John Lennon'.		
	customerBook := self createCustomerBook: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	
	self try: [ customerBook suspendCustomerNamed: johnLennon.
	self fail ] catch: CantSuspend
andDo: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]

! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NP 4/11/2022 21:11:50'!
timeInMilliseconds

	^ Time millisecondClockValue * millisecond! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NP 4/11/2022 21:38:36'!
try: aBlock catch: error andDo: resolution  
	aBlock
		on: error 
		do: resolution! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 9/17/2020 07:23:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
removeCustomerNamed: aName 
 
	1 to: active size do: 
	[ :index |
		aName = (active at: index)
			ifTrue: [
				active removeAt: index.
				^ aName 
			] 
	].

	1 to: suspended size do: 	
	[ :index |
		aName = (suspended at: index)
			ifTrue: [
				suspended removeAt: index.
				^ aName 
			] 
	].
	
	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/11/2022 07:18:12'!
customerAlreadyExistsErrorMessage

	^'Customer already exists!!!!!!'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/11/2022 07:18:16'!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty!!!!!!'! !
