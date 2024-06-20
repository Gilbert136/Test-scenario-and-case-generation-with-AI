plaintext
Feature: Money Transfer Feature

  Scenario: Sending money by an adult
    Given the sender is an adult
    And the sender has sufficient balance in their account
    When the sender initiates a money transfer to the recipient
    Then the money is successfully transferred
    And the sender's balance is updated

  Scenario: Withdrawing money by an adult
    Given the account holder is an adult
    And the account holder has sufficient balance in their account
    When the account holder initiates a withdrawal
    Then the money is successfully withdrawn
    And the account holder's balance is updated

  Scenario: Sending money by a non-adult
    Given the sender is a non-adult
    And the sender has sufficient balance in their account
    When the sender tries to initiate a money transfer
    Then the transfer is not allowed
    And the sender receives an error message
  
  Scenario: Withdrawing money by a non-adult
    Given the account holder is a non-adult
    And the account holder has sufficient balance in their account
    When the account holder tries to initiate a withdrawal
    Then the withdrawal is not allowed
    And the account holder receives an error message

  Scenario: Sender has insufficient balance
    Given the sender is an adult
    And the sender has insufficient balance in their account
    When the sender tries to initiate a money transfer
    Then the transfer is not allowed
    And the sender receives an error message
  
  Scenario: Account holder tries to withdraw more than available balance
    Given the account holder is an adult
    And the account holder has a limited balance in their account
    When the account holder tries to withdraw more than the available balance
    Then the withdrawal is not allowed
    And the account holder receives an error message
```

In the above BDD Gherkin scenarios, we have covered positive and negative test cases related to sending and withdrawing money by both adults and non-adults.