
Feature: Money Transactions for Business

Scenario: Sending Money by Adults
  Given the sender is an adult
  And the sender has enough balance
  When the sender sends money to another account
  Then the transaction is successful

Scenario: Sending Money by Non-Adults
  Given the sender is a non-adult
  And the sender has enough balance
  When the sender tries to send money to another account
  Then the transaction fails with an error message

Scenario: Withdrawing Money by Adults
  Given the account holder is an adult
  And the account has enough balance
  When the account holder withdraws money
  Then the withdrawal is successful

Scenario: Withdrawing Money by Non-Adults
  Given the account holder is a non-adult
  And the account has enough balance
  When the account holder tries to withdraw money
  Then the withdrawal fails with an error message

Scenario: Insufficient Balance for Sending Money
  Given the sender is an adult
  And the sender has insufficient balance
  When the sender tries to send money
  Then the transaction fails with an error message

Scenario: Insufficient Balance for Withdrawing Money
  Given the account holder is an adult
  And the account has insufficient balance
  When the account holder tries to withdraw money
  Then the withdrawal fails with an error message
