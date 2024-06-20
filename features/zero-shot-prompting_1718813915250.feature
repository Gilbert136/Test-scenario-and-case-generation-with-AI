
Feature: Money Transactions for Business

Scenario: Sending money as an adult
  Given the sender is an adult
  And they have sufficient balance in their account
  When they send money to another account
  Then the transaction should be successful
  
Scenario: Withdrawing money as an adult
  Given the account holder is an adult
  And they have sufficient balance in their account
  When they withdraw money from their account
  Then the withdrawal should be successful
  
Scenario: Sending money as a non-adult
  Given the sender is a non-adult
  And they have their guardian's permission
  And the guardian has authorized the transaction
  When they send money to another account
  Then the transaction should be successful
  
Scenario: Withdrawing money as a non-adult
  Given the account holder is a non-adult
  And they have their guardian's permission
  And the guardian has authorized the withdrawal
  When they try to withdraw money from their account
  Then the withdrawal should be successful
  
Scenario: Sending money without sufficient balance
  Given the sender has insufficient balance in their account
  When they try to send money to another account
  Then the transaction should fail
  
Scenario: Withdrawing money without authorization
  Given the account holder is a non-adult
  And they try to withdraw money without guardian authorization
  When they attempt to withdraw money from their account
  Then the withdrawal should fail
  Sure, here are two more test scenarios:

Scenario: Sending money with a blocked account
  Given the sender's account is blocked
  And they try to send money to another account
  When they initiate the transaction
  Then the transaction should fail

Scenario: Withdrawing money exceeding daily limit
  Given the account holder is trying to withdraw an amount exceeding the daily limit
  And they have sufficient balance in their account
  When they try to withdraw the money
  Then the withdrawal should fail due to exceeding the daily limitFeature: Money Transactions for Business

Scenario: Sending money as an adult
  Given the sender is an adult
  And they have sufficient balance in their account
  When they send money to another account
  Then the transaction should be successful
  
Scenario: Withdrawing money as an adult
  Given the account holder is an adult
  And they have sufficient balance in their account
  When they withdraw money from their account
  Then the withdrawal should be successful
  
Scenario: Sending money as a non-adult
  Given the sender is a non-adult
  And they have their guardian's permission
  And the guardian has authorized the transaction
  When they send money to another account
  Then the transaction should be successful
  
Scenario: Withdrawing money as a non-adult
  Given the account holder is a non-adult
  And they have their guardian's permission
  And the guardian has authorized the withdrawal
  When they try to withdraw money from their account
  Then the withdrawal should be successful
  
Scenario: Sending money without sufficient balance
  Given the sender has insufficient balance in their account
  When they try to send money to another account
  Then the transaction should fail
  
Scenario: Withdrawing money without authorization
  Given the account holder is a non-adult
  And they try to withdraw money without guardian authorization
  When they attempt to withdraw money from their account
  Then the withdrawal should fail

Scenario: Sending money to a non-existing account
  Given the sender initiates a money transfer
  And provides an account number that does not exist
  When the transaction is processed
  Then the transaction should fail
  
Scenario: Withdrawing money from a locked account
  Given the account holder's account is locked
  When they try to withdraw money
  Then the withdrawal should fail