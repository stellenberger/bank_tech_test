## Bank Tech Test

This is the tech test for Makers Academy Week 10. 

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


## Specification

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