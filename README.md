## Bank Tech Test

This is the tech test for Makers Academy Week 10. 

I approached this Tech Test by breaking down the objects that will ultimately be involved, before assigning methods to each of them.
I have created a class for each object, in order of dependency, starting with the highest first. 
The order is:
- Bank, 
- Account, 
- Transaction and 
- Statement. 

I decided from the get-go that the Bank class will be able to control the whole application, and through the Bank class you would have control of creating Accounts, Transactions and Statements. There is no need to require any file in the console than the Bank.rb

I began writing tests for the Bank class first. I came to the conclusion that the User should create their own account, but through the Bank class. This allows multiple accounts to be made, and to be stored in the Bank. 

The heart of the program with the most logic was the Account class, and thus needed the most work. The default balance of every account is zero, and cannot be created with another value. All of the accounts logic started in the Transaction method, but to follow the SRP I redacted the logic into private methods, which all get called from the Transaction method. The private methods ensure that there will always be records kept of transactions, and money cannot be withdrawn or deposited without a record. All transactions are kept in an array, which can be read through an attribute reader.

The Transaction class has no responsibility other than storing records of transactions, and thus should not be munipulated in any way. This is why it only has an initialize method, with access to its attributes using an attribute reader. As testing with Time can be unpredictable, I have mocked all attributes that relate to Time and DateTime in my tests.

The Statement class has the sole responsibility of printing out the transactions up to the time that the User requests it, and is the only class that will print anything to the console. This class has one argument on instantiation, which is the array of transaction objects stored in the Account class, has one method that uses string concatenation to produce a table of all the information that has been collected, and prints it out to the console. You can produce this statement from the Bank class with the method request_statement, which will then call the print_statement in the Account class. 

*Further functionality*

Further to the specification, I have ensured that accounts can not go into negative balance, cannot have any other types of transactions besides withdraw or deposit, and banks will not deposit or withdraw money into any accounts that it does not have on its system. The program will throw an error otherwise. 

## User Stories

```
As a hard working citizen
So I can store my money somewhere
I would like to make an account at the bank
```

```
As a hard working citizen
So I can keep my hard earned cash safe
I would like to make deposits at the bank
```

```
As a hard working citizen
So I can spend my hard earned cash as a consumer
I would like to make withdrawals at the bank
```

```
As a hard working citizen
So I can check how much money I have
I would like to request my current bank statement
```

```
As a hard working citizen
So I can work out my monthly spendings
I would like my bank statement to include the date of each transaction
```

## Example Usage
- Run bundle install after cloning this repo

```
$ bundle install
```

- To run the tests, run rspec in the folder of the repository

```
$ rspec
```

- Start the interactive ruby terminal

```
$ irb
```

- The following is an example to how the application can be run. 

```
2.6.3 :001 > require './lib/bank.rb'
 => true 
2.6.3 :002 > bank = Bank.new
 => #<Bank:0x00000f85d10df670 @accounts=[]> 
2.6.3 :003 > account = bank.create_account("Stephan")
 => #<Account:0x00000f85d10c7868 @name="Stephan", @balance=0, @transactions=[]> 
2.6.3 :004 > bank.deposit(account, 100)
 => "You have deposited £100" 
2.6.3 :005 > bank.deposit(account, 2300)
 => "You have deposited £2300" 
2.6.3 :006 > bank.withdraw(account, 860)
 => "You have withdrawn £860" 
2.6.3 :007 > bank.request_statement(account)
date || credit || debit || balance
21-04-20 || 100.00 || || 100.00
21-04-20 || 2300.00 || || 2400.00
21-04-20 || || 860.00 || 1540.00
 => nil 
```


## Specification by Makers Academy

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```