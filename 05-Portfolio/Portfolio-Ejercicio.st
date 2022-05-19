!classDefinition: #PortfolioTest category: 'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MY 5/16/2022 21:20:01'!
test01EmptyPortfolioBalanceShoulBeZero

	| portfolio |
	portfolio := Portfolio new.
	self assert: 0 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MY 5/16/2022 22:00:47'!
test02PortfolioWithOneAccountBalanceShouldBeAccountBalance

	| portfolio account |
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio addAccounts: #(account).
	
	self assert: account balance equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MY 5/16/2022 21:41:41'!
test03PortfolioWithTwoAccountsBalanceShouldBeTheSumOfAllBalances

	| portfolio account1 account2 |
	
	account1 := ReceptiveAccount new.
	Deposit register: 100 on: account1.
	account2 := ReceptiveAccount new.
	Withdraw register: 150 on: account2.
	
	portfolio := Portfolio new.
	portfolio addAccounts: #(account1, account2).
	
	self assert: (account1 balance) + (account2 balance) equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MY 5/16/2022 21:11:36'!
xtest04PortfolioWithOnePortfolioBalanceShouldBeTheBalanceOfThePortfolio
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MY 5/16/2022 21:12:52'!
xtest05PortfolioWithFivePortfolioBalanceShouldBeTheSumOfPortfoliosBalances! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MY 5/16/2022 21:13:24'!
xtest06PortfolioWithOnePortfolioAndOneAccountBalanceShouldBeTheSumOfAccountAndPortfolioBalance! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MY 5/16/2022 21:16:53'!
xtest07PortfolioWithOneAccountHasSameTransactionsAsTheAccount
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MY 5/16/2022 21:17:19'!
xtest08PortfolioWithFiveAccountsHasTransactionsIfIsInAnyAccount
! !


!classDefinition: #ReceptiveAccountTest category: 'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'MY 5/16/2022 21:19:20'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'MY 5/16/2022 21:23:22'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'MY 5/16/2022 20:10:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 5/16/2022 16:18:39'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 5/16/2022 16:19:11'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw account |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 200.
	withdraw := Withdraw for: 50.
	
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:14:01'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 50 on: account1.
		
	self assert: 1 equals: account1 transactions size.
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #Account category: 'Portfolio-Ejercicio'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!


!classDefinition: #Portfolio category: 'Portfolio-Ejercicio'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'balance' stamp: 'MY 5/16/2022 21:53:52'!
balance

	| totalBalance |
	totalBalance := 0.
	accounts do: [ :anAccount | totalBalance := totalBalance + anAccount balance ].
	^totalBalance! !



!Portfolio methodsFor: 'initialization' stamp: 'MY 5/16/2022 21:42:17'!
initialize
	accounts := Set new.! !


!Portfolio methodsFor: 'adding' stamp: 'MY 5/16/2022 21:58:24'!
addAccounts: anArray 

	anArray do: [:anAccount | accounts add: anAccount].! !


!classDefinition: #ReceptiveAccount category: 'Portfolio-Ejercicio'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'MY 5/16/2022 21:22:58'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'MY 5/16/2022 21:23:07'!
register: aTransaction

	transactions add: aTransaction ! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'MY 5/16/2022 20:56:29'!
balance

	^transactions inject: 0 into: [ :currentBalance :aTransaction | aTransaction addTo: currentBalance].! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'MY 5/16/2022 21:16:06'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction
! !


!classDefinition: #AccountTransaction category: 'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'MY 5/16/2022 20:46:47'!
addTo: aBalance 

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'value' stamp: 'MY 5/16/2022 20:13:32'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'MY 5/16/2022 20:23:09'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'MY 5/16/2022 20:23:35'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'MY 5/16/2022 20:46:26'!
addTo: aBalance

	^ aBalance + value! !

!Deposit methodsFor: 'value' stamp: 'MY 5/16/2022 20:13:07'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'MY 5/16/2022 20:23:30'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'MY 5/16/2022 20:22:45'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'MY 5/16/2022 20:46:39'!
addTo: aBalance

	^ aBalance - value! !

!Withdraw methodsFor: 'value' stamp: 'MY 5/16/2022 20:15:24'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !
