
Feature: Money Transactions for Adults and Non-Adults

  Scenario: Sending money as an adult
    Given the sender is an adult
    And the sender has sufficient funds in their account
    And the recipient is a valid account
    When the sender transfers money to the recipient
    Then the transaction is successful

  Scenario: Sending money as a non-adult
    Given the sender is a non-adult
    And the sender has insufficient funds in their account
    And the recipient is a valid account
    When the sender tries to transfer money to the recipient
    Then the transaction fails

  Scenario: Withdrawing money as an adult
    Given the account holder is an adult
    And the account has sufficient funds
    When the account holder withdraws money
    Then the withdrawal is successful

  Scenario: Withdrawing money as a non-adult
    Given the account holder is a non-adult
    And the account has sufficient funds
    When the account holder tries to withdraw money
    Then the withdrawal fails

  Scenario: Sending money to a non-existent account
    Given the sender is an adult
    And the sender has sufficient funds in their account
    And the recipient is a non-existent account
    When the sender tries to transfer money to the recipient
    Then the transaction fails

  Scenario: Sending money with invalid payment method
    Given the sender is an adult
    And the sender has sufficient funds in their account
    And the recipient is a valid account
    And the payment method is invalid
    When the sender tries to transfer money to the recipient
    Then the transaction fails


These scenarios cover various cases of sending and withdrawing money by both adults and non-adults, including scenarios with insufficient funds, invalid accounts, and invalid payment methods.