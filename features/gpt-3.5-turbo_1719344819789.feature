```gherkin
Feature: Money Transactions for Adults and Non-Adults

Scenario: Sending money as an adult
   Given the sender is an adult
   And the sender account has sufficient balance
   When the sender initiates a money transfer
   Then the transfer should be successful
   
Scenario: Sending money as a non-adult
   Given the sender is a non-adult
   And the sender account has sufficient balance
   When the sender initiates a money transfer
   Then the transfer should be declined

Scenario: Withdrawing money as an adult
   Given the account holder is an adult
   And the account has sufficient balance
   When a withdrawal is requested
   Then the withdrawal should be successful
   
Scenario: Withdrawing money as a non-adult
   Given the account holder is a non-adult
   And the account has sufficient balance
   When a withdrawal is requested
   Then the withdrawal should be declined
   
Scenario: Sending money with insufficient balance
   Given the sender is an adult
   And the sender account has insufficient balance
   When the sender initiates a money transfer
   Then the transfer should be declined
   
Scenario: Withdrawing money exceeding daily limit
   Given the account holder is an adult
   And the withdrawal amount exceeds the daily limit
   When a withdrawal is requested
   Then the withdrawal should be declined
```