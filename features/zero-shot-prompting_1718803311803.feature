**Feature: Money Transactions**

Scenario: Sending money as an adult
Given the account balance is sufficient
When an adult initiates a money transfer
Then the money should be successfully sent

Scenario: Sending money as a non-adult
Given the account balance is sufficient
When a non-adult initiates a money transfer
Then the money transfer should be declined

Scenario: Withdrawing money as an adult
Given the account balance is sufficient
When an adult requests a withdrawal
Then the withdrawal should be successful

Scenario: Withdrawing money as a non-adult
Given the account balance is sufficient
When a non-adult requests a withdrawal
Then the withdrawal should be declined

Scenario: Insufficient account balance for money transfer
Given the account balance is insufficient
When a transfer is initiated
Then the transfer should be declined

Scenario: Insufficient account balance for withdrawal
Given the account balance is insufficient
When a withdrawal is requested
Then the withdrawal should be declined