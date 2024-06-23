
Feature: Money Transactions for Business

Scenario: Sending Money by Adults
   Given a sender is an adult
   And the sender has sufficient balance
   When the sender initiates a money transfer
   Then the money is successfully sent

Scenario: Sending Money by Non-Adults
   Given a sender is a non-adult
   When the sender tries to initiate a money transfer
   Then the transfer is not allowed
   And an error message is displayed

Scenario: Withdrawing Money by Adults
   Given a user is an adult
   And the user has sufficient balance in their account
   When the user requests a withdrawal
   Then the money is successfully withdrawn

Scenario: Withdrawing Money by Non-Adults
   Given a user is a non-adult
   When the user tries to make a withdrawal
   Then the withdrawal is not allowed
   And an error message is displayed

Scenario: Sending Money with Insufficient Balance
   Given a sender has an insufficient balance
   When the sender initiates a money transfer
   Then the transfer is not allowed
   And an error message is displayed

Scenario: Withdrawing Money Exceeding Balance
   Given a user has a balance of $100
   When the user requests a withdrawal of $150
   Then the withdrawal is not allowed
   And an error message is displayed
