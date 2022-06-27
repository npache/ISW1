!classDefinition: #ImportTest category: 'CustomerImporter'!
TestCase subclass: #ImportTest
	instanceVariableNames: 'session'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!ImportTest methodsFor: 'tests' stamp: 'NP 6/23/2022 19:48:18'!
test01ValidateImportCustomerCorrectly

	CustomerImporter valueFrom: self validImportData into: session..

	self assertImportedRightNumberOfCustomers.
	self assertPepeSanchezWasImportedCorrecty.
	self assertJuanPerezWasImportedCorrectly ! !

!ImportTest methodsFor: 'tests' stamp: 'NP 6/23/2022 20:53:03'!
test02CustomerRecordMustBeCOnly

	self 
	should: [CustomerImporter valueFrom: self invalidImportDataCustomer into: session.]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError |
		self assert: CustomerImporter invalidTypeDescriptionError equals: anError messageText.
		self assert: 0 equals: (session selectAllOfType: Customer) size].
	! !

!ImportTest methodsFor: 'tests' stamp: 'NP 6/23/2022 20:56:37'!
test03CustomerRecordMustNotHaveLessThanFiveElements
	self 
	should: [CustomerImporter valueFrom: self importCustomerDataWithLessThanFiveElements into: session.]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError |
		self assert: CustomerImporter invalidAmountOfElementsDescriptionError equals: anError messageText.
		self assert: 0 equals: (session selectAllOfType: Customer) size].
	! !

!ImportTest methodsFor: 'tests' stamp: 'NP 6/23/2022 20:24:22'!
test04CustomerRecordMustNotHaveMoreThanFiveElements
	self 
	should: [CustomerImporter valueFrom: self importDataWithMoreThanFiveElements into: session.]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError |
		self assert: CustomerImporter invalidAmountOfElementsDescriptionError equals: anError messageText.
		self assert: 0 equals: (session selectAllOfType: Customer) size].
	! !

!ImportTest methodsFor: 'tests' stamp: 'NP 6/23/2022 20:52:46'!
test05AddressRecordMustBeAOnly

	self 
	should: [CustomerImporter valueFrom: self invalidImportDataAddress into: session.]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError |
		self assert: CustomerImporter invalidTypeDescriptionError equals: anError messageText.
		self assert: 0 equals: (session selectAllOfType: Address) size].
	! !

!ImportTest methodsFor: 'tests' stamp: 'NP 6/23/2022 21:21:57'!
test06AddressRecordMustNotHaveLessThanSixElements
	self 
	should: [CustomerImporter valueFrom: self importAddressDataWithLessThanSixElements into: session.]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError |
		self assert: CustomerImporter invalidAmountOfElementsDescriptionError equals: anError messageText.
		self assert: 0 equals: (session selectAllOfType: Address) size].
	! !

!ImportTest methodsFor: 'tests' stamp: 'NP 6/23/2022 21:22:22'!
test07AddressRecordMustNotHaveMoreThanSixElements
	self 
	should: [CustomerImporter valueFrom: self importAddressDataWithMoreThanSixElements into: session.]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError |
		self assert: CustomerImporter invalidAmountOfElementsDescriptionError equals: anError messageText.
		self assert: 0 equals: (session selectAllOfType: Address) size].
	! !

!ImportTest methodsFor: 'tests' stamp: 'NP 6/23/2022 20:35:29'!
test08AddressShouldHaveCustomerAssociated
	self 
	should: [CustomerImporter valueFrom: self importDataWithAddressAndNoCustomer into: session.]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError |
		self assert: CustomerImporter doesNotHaveCustomerDescriptionError equals: anError messageText.
		self assert: 0 equals: (session selectAllOfType: Customer) size.
		self assert: 0 equals: (session selectAllOfType: Address) size].
	! !


!ImportTest methodsFor: 'assertions' stamp: 'HAW 5/22/2022 18:22:05'!
assertAddressOf: importedCustomer at: aStreetName hasNumber: aNumber town: aTown zipCode: aZipCode province: aProvince

	| importedAddress |

	importedAddress := importedCustomer addressAt: aStreetName ifNone: [ self fail ].
	self assert: aStreetName equals: importedAddress streetName.
	self assert: aNumber equals: importedAddress streetNumber.
	self assert: aTown equals: importedAddress town.
	self assert: aZipCode equals: importedAddress zipCode.
	self assert: aProvince equals: importedAddress province.

	! !

!ImportTest methodsFor: 'assertions' stamp: 'HAW 5/22/2022 18:27:57'!
assertCustomerWithIdentificationType: anIdType number: anIdNumber hasFirstName: aFirstName lastName: aLastName

	| importedCustomer |

	importedCustomer := self customerWithIdentificationType: anIdType number: anIdNumber.

	self assert: aFirstName equals: importedCustomer firstName.
	self assert: aLastName equals: importedCustomer lastName.
	self assert: anIdType equals: importedCustomer identificationType.
	self assert: anIdNumber equals: importedCustomer identificationNumber.

	^importedCustomer

	! !

!ImportTest methodsFor: 'assertions' stamp: 'HAW 5/22/2022 18:12:18'!
assertImportedRightNumberOfCustomers

	^ self assert: 2 equals: (session selectAllOfType: Customer) size! !

!ImportTest methodsFor: 'assertions' stamp: 'HAW 5/22/2022 18:28:45'!
assertJuanPerezWasImportedCorrectly

	| importedCustomer |

	importedCustomer := self assertCustomerWithIdentificationType: 'C' number: '23-25666777-9' hasFirstName: 'Juan' lastName: 'Perez'.
	self assertAddressOf: importedCustomer at: 'Alem' hasNumber: 1122 town: 'CABA' zipCode: 1001 province: 'CABA'
	! !

!ImportTest methodsFor: 'assertions' stamp: 'HAW 5/22/2022 18:28:05'!
assertPepeSanchezWasImportedCorrecty

	| importedCustomer |

	importedCustomer := self assertCustomerWithIdentificationType: 'D' number: '22333444' hasFirstName: 'Pepe' lastName: 'Sanchez'.
	self assertAddressOf: importedCustomer at: 'San Martin' hasNumber: 3322 town: 'Olivos' zipCode: 1636 province: 'BsAs'.
	self assertAddressOf: importedCustomer at: 'Maipu' hasNumber: 888 town: 'Florida' zipCode: 1122 province: 'Buenos Aires'.


	! !


!ImportTest methodsFor: 'setUp/tearDown' stamp: 'HAW 5/22/2022 00:27:50'!
setUp

	session := DataBaseSession for: (Array with: Address with: Customer).
	session beginTransaction.
! !

!ImportTest methodsFor: 'setUp/tearDown' stamp: 'HAW 5/22/2022 00:28:23'!
tearDown

	session commit.
	session close.
	! !


!ImportTest methodsFor: 'customer' stamp: 'HAW 5/22/2022 18:14:22'!
customerWithIdentificationType: anIdType number: anIdNumber

	^ (session
		select: [ :aCustomer | aCustomer identificationType = anIdType and: [ aCustomer identificationNumber = anIdNumber ]]
		ofType: Customer) anyOne! !


!ImportTest methodsFor: 'test data' stamp: 'NP 6/23/2022 21:01:03'!
importAddressDataWithLessThanSixElements

	^ ReadStream on: 'A,San Martin,3322,Olivos,1636'! !

!ImportTest methodsFor: 'test data' stamp: 'NP 6/23/2022 21:22:35'!
importAddressDataWithMoreThanSixElements

	^ ReadStream on: 'A,San Martin,3322,Olivos,1636,AA,AAA,AA'! !

!ImportTest methodsFor: 'test data' stamp: 'NP 6/23/2022 20:56:37'!
importCustomerDataWithLessThanFiveElements

	^ ReadStream on: 'C,Pepe,D,22333444'! !

!ImportTest methodsFor: 'test data' stamp: 'NP 6/23/2022 20:36:12'!
importDataWithAddressAndNoCustomer

	^ ReadStream on:
'A,San Martin,3322,Olivos,1636,BsAs
A,Maipu,888,Florida,1122,Buenos Aires'! !

!ImportTest methodsFor: 'test data' stamp: 'NP 6/23/2022 20:24:51'!
importDataWithMoreThanFiveElements

	^ ReadStream on: 'C,Pepe,Sachez,Sanchez,D,22333444'! !

!ImportTest methodsFor: 'test data' stamp: 'NP 6/23/2022 20:48:27'!
importDataWithNoData

	^ ReadStream on: ''! !

!ImportTest methodsFor: 'test data' stamp: 'NP 6/23/2022 20:53:10'!
invalidImportDataAddress

	^ ReadStream on: 'AA,Pepe,Sanchez,D,22333444'! !

!ImportTest methodsFor: 'test data' stamp: 'NP 6/23/2022 20:53:03'!
invalidImportDataCustomer

	^ ReadStream on: 'CA,Pepe,Sanchez,D,22333444'! !

!ImportTest methodsFor: 'test data' stamp: 'HAW 5/22/2022 18:08:08'!
validImportData

	^ ReadStream on:
'C,Pepe,Sanchez,D,22333444
A,San Martin,3322,Olivos,1636,BsAs
A,Maipu,888,Florida,1122,Buenos Aires
C,Juan,Perez,C,23-25666777-9
A,Alem,1122,CABA,1001,CABA'! !


!classDefinition: #Address category: 'CustomerImporter'!
Object subclass: #Address
	instanceVariableNames: 'id streetName streetNumber town zipCode province'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!Address methodsFor: 'province' stamp: 'HAW 5/22/2022 00:19:29'!
province

	^province! !

!Address methodsFor: 'province' stamp: 'HAW 5/22/2022 00:19:29'!
province: aProvince

	province := aProvince
	! !


!Address methodsFor: 'street' stamp: 'HAW 5/22/2022 17:55:46'!
isAt: aStreetName

	^streetName = aStreetName ! !

!Address methodsFor: 'street' stamp: 'HAW 5/22/2022 00:19:29'!
streetName

	^streetName ! !

!Address methodsFor: 'street' stamp: 'HAW 5/22/2022 00:19:29'!
streetName: aStreetName

	streetName := aStreetName ! !

!Address methodsFor: 'street' stamp: 'HAW 5/22/2022 00:19:29'!
streetNumber

	^streetNumber ! !

!Address methodsFor: 'street' stamp: 'HAW 5/22/2022 00:19:29'!
streetNumber: aStreetNumber

	streetNumber := aStreetNumber ! !


!Address methodsFor: 'twon' stamp: 'HAW 5/22/2022 00:19:29'!
town

	^town! !

!Address methodsFor: 'twon' stamp: 'HAW 5/22/2022 00:19:29'!
town: aTown

	town := aTown! !


!Address methodsFor: 'zip code' stamp: 'HAW 5/22/2022 00:19:29'!
zipCode

	^zipCode! !

!Address methodsFor: 'zip code' stamp: 'HAW 5/22/2022 00:19:29'!
zipCode: aZipCode

	zipCode := aZipCode! !


!classDefinition: #Customer category: 'CustomerImporter'!
Object subclass: #Customer
	instanceVariableNames: 'id firstName lastName identificationType identificationNumber addresses'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!Customer methodsFor: 'addresses' stamp: 'HAW 5/22/2022 00:19:29'!
addAddress: anAddress

	addresses add: anAddress ! !

!Customer methodsFor: 'addresses' stamp: 'HAW 5/22/2022 17:55:17'!
addressAt: aStreetName ifNone: aNoneBlock

	^addresses detect: [ :address | address isAt: aStreetName ] ifNone: aNoneBlock ! !

!Customer methodsFor: 'addresses' stamp: 'HAW 5/22/2022 00:19:29'!
addresses

	^ addresses! !


!Customer methodsFor: 'name' stamp: 'HAW 5/22/2022 00:19:29'!
firstName

	^firstName ! !

!Customer methodsFor: 'name' stamp: 'HAW 5/22/2022 00:19:29'!
firstName: aName

	firstName := aName! !

!Customer methodsFor: 'name' stamp: 'HAW 5/22/2022 00:19:29'!
lastName

	^lastName ! !

!Customer methodsFor: 'name' stamp: 'HAW 5/22/2022 00:19:29'!
lastName: aLastName

	lastName := aLastName
! !


!Customer methodsFor: 'identification' stamp: 'HAW 5/22/2022 00:19:29'!
identificationNumber

	^identificationNumber ! !

!Customer methodsFor: 'identification' stamp: 'HAW 5/22/2022 00:19:29'!
identificationNumber: anIdentificationNumber

	identificationNumber := anIdentificationNumber! !

!Customer methodsFor: 'identification' stamp: 'HAW 5/22/2022 00:19:29'!
identificationType

	^identificationType ! !

!Customer methodsFor: 'identification' stamp: 'HAW 5/22/2022 00:19:29'!
identificationType: anIdentificationType

	identificationType := anIdentificationType! !


!Customer methodsFor: 'initialization' stamp: 'HAW 5/22/2022 00:19:29'!
initialize

	super initialize.
	addresses := OrderedCollection new.! !


!classDefinition: #CustomerImporter category: 'CustomerImporter'!
Object subclass: #CustomerImporter
	instanceVariableNames: 'session readStream record customer line'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!CustomerImporter methodsFor: 'initialization' stamp: 'HAW 5/22/2022 18:06:47'!
initializeFrom: aReadStream into: aSession
	session := aSession.
	readStream := aReadStream.! !


!CustomerImporter methodsFor: 'evaluating' stamp: 'NP 6/23/2022 19:46:29'!
createRecord

	^ record := line findTokens: $,! !

!CustomerImporter methodsFor: 'evaluating' stamp: 'NP 6/23/2022 19:46:01'!
hasLineToImport

	line := readStream nextLine.  
	^line notNil.! !

!CustomerImporter methodsFor: 'evaluating' stamp: 'NP 6/23/2022 20:40:36'!
importAddress

	| newAddress |
	self validateCustomerExists.

	newAddress := Address new.
	customer addAddress: newAddress.
	newAddress streetName: record second.
	newAddress streetNumber: record third asNumber .
	newAddress town: record fourth.
	newAddress zipCode: record fifth asNumber .
	newAddress province: record sixth! !

!CustomerImporter methodsFor: 'evaluating' stamp: 'NP 6/23/2022 19:34:27'!
importCustomer

	customer := Customer new.
	customer firstName: record second.
	customer lastName: record third.
	customer identificationType: record fourth.
	customer identificationNumber: record fifth.
	session persist: customer! !

!CustomerImporter methodsFor: 'evaluating' stamp: 'NP 6/23/2022 20:53:40'!
importRecord

	(record first = 'C') ifTrue: [ ^self importCustomer ].
	(record first = 'A') ifTrue: [ ^self importAddress ].

	self error: CustomerImporter invalidTypeDescriptionError.	! !

!CustomerImporter methodsFor: 'evaluating' stamp: 'NP 6/23/2022 21:23:46'!
isValidAddress

	^ (record size ~= 6) and: record first = 'A'! !

!CustomerImporter methodsFor: 'evaluating' stamp: 'NP 6/23/2022 21:18:13'!
isValidCustomer

	^ (record size ~= 5) and: record first ='C'! !

!CustomerImporter methodsFor: 'evaluating' stamp: 'NP 6/23/2022 20:40:36'!
validateCustomerExists

	^ (customer isNil) ifTrue: [ self error: CustomerImporter doesNotHaveCustomerDescriptionError]! !

!CustomerImporter methodsFor: 'evaluating' stamp: 'NP 6/23/2022 21:18:25'!
validateRecord

	((self isValidCustomer) or: (self isValidAddress)) ifTrue: [self error: CustomerImporter invalidAmountOfElementsDescriptionError	].! !

!CustomerImporter methodsFor: 'evaluating' stamp: 'NP 6/23/2022 20:27:16'!
value

	"
	self importCustomers
	"

	[ self hasLineToImport ] whileTrue: [
		self createRecord.
		self validateRecord.
		self importRecord.
	].

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerImporter class' category: 'CustomerImporter'!
CustomerImporter class
	instanceVariableNames: ''!

!CustomerImporter class methodsFor: 'instance creation' stamp: 'HAW 5/22/2022 18:06:47'!
from: aReadStream into: aSession
	^self new initializeFrom: aReadStream into: aSession! !


!CustomerImporter class methodsFor: 'importing' stamp: 'NP 6/23/2022 20:37:01'!
doesNotHaveCustomerDescriptionError

	^'Not customer found for address'! !

!CustomerImporter class methodsFor: 'importing' stamp: 'NP 6/23/2022 20:18:44'!
invalidAmountOfElementsDescriptionError

	^'Invalid number of elements in record'! !

!CustomerImporter class methodsFor: 'importing' stamp: 'NP 6/23/2022 20:18:47'!
invalidTypeDescriptionError

	^'Invalid Type'! !

!CustomerImporter class methodsFor: 'importing' stamp: 'HAW 5/22/2022 18:11:27'!
valueFrom: aReadStream into: aSession

	^(self from: aReadStream into: aSession) value! !


!classDefinition: #DataBaseSession category: 'CustomerImporter'!
Object subclass: #DataBaseSession
	instanceVariableNames: 'configuration tables id'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!DataBaseSession methodsFor: 'transaction management' stamp: 'HAW 5/22/2022 00:19:29'!
beginTransaction

	! !

!DataBaseSession methodsFor: 'transaction management' stamp: 'HAW 5/22/2022 19:17:36'!
commit

	(tables at: Customer ifAbsent: [#()]) do: [ :aCustomer | self persistAddressesOf: aCustomer ]
	! !


!DataBaseSession methodsFor: 'closing' stamp: 'HAW 5/22/2022 00:19:29'!
close

	! !


!DataBaseSession methodsFor: 'persistence - private' stamp: 'HAW 5/22/2022 00:19:29'!
defineIdOf: anObject

	anObject instVarNamed: 'id' put: (self newIdFor: anObject).! !

!DataBaseSession methodsFor: 'persistence - private' stamp: 'HAW 5/22/2022 00:19:29'!
delay

	(Delay forMilliseconds: 100) wait! !

!DataBaseSession methodsFor: 'persistence - private' stamp: 'HAW 5/22/2022 19:29:06'!
objectsOfType: aType

	^ tables at: aType ifAbsent: [ #() ]! !

!DataBaseSession methodsFor: 'persistence - private' stamp: 'HAW 5/22/2022 00:19:29'!
persistAddressesOf: anObjectWithAddresses

	anObjectWithAddresses addresses do: [ :anAddress | self persist: anAddress ]
	! !


!DataBaseSession methodsFor: 'initialization' stamp: 'HAW 5/22/2022 00:19:29'!
initializeFor: aConfiguration

	configuration := aConfiguration.
	tables := Dictionary new.
	id := 0.! !


!DataBaseSession methodsFor: 'id' stamp: 'HAW 5/22/2022 00:19:29'!
newIdFor: anObject

	id := id + 1.
	^id! !


!DataBaseSession methodsFor: 'persistance' stamp: 'HAW 5/22/2022 00:19:29'!
persist: anObject

	| table |

	self delay.
	table := tables at: anObject class ifAbsentPut: [ Set new ].

	self defineIdOf: anObject.
	table add: anObject.

	(anObject isKindOf: Customer) ifTrue: [ self persistAddressesOf: anObject ].! !


!DataBaseSession methodsFor: 'selecting' stamp: 'HAW 5/22/2022 19:29:06'!
select: aCondition ofType: aType

	self delay.
	^(self objectsOfType: aType) select: aCondition ! !

!DataBaseSession methodsFor: 'selecting' stamp: 'HAW 5/22/2022 19:29:06'!
selectAllOfType: aType

	self delay.
	^(self objectsOfType: aType) copy ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DataBaseSession class' category: 'CustomerImporter'!
DataBaseSession class
	instanceVariableNames: ''!

!DataBaseSession class methodsFor: 'instance creation' stamp: 'HAW 5/22/2022 00:19:29'!
for: aConfiguration

	^self new initializeFor: aConfiguration! !
