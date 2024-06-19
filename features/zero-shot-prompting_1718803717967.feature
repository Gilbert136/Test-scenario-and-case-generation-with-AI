
Feature: Money Transactions for Business

  Scenario: Sending money by adults
    Given the sender is an adult
    And the account balance is sufficient
    When the sender initiates a money transfer
    Then the money transfer is completed successfully

  Scenario: Unable to send money by adults with insufficient balance
    Given the sender is an adult
    And the account balance is insufficient
    When the sender initiates a money transfer
    Then the money transfer fails

  Scenario: Withdrawing money by adults
    Given the account holder is an adult
    And the account balance is sufficient
    When a withdrawal is made
    Then the money is withdrawn successfully

  Scenario: Unable to withdraw money by adults with insufficient balance
    Given the account holder is an adult
    And the account balance is insufficient
    When a withdrawal is made
    Then the withdrawal fails

  Scenario: Sending money by non-adults
    Given the sender is a non-adult
    When the sender initiates a money transfer
    Then the money transfer fails

  Scenario: Withdrawing money by non-adults
    Given the account holder is a non-adult
    When a withdrawal is made
    Then the withdrawal fails
  