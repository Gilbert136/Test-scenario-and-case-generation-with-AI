
Feature: Sending and Withdrawing Money for Business Transactions

  Scenario: Adults can send money to other adults
    Given an adult user with sufficient balance
    And the recipient is also an adult
    When the adult user sends money to the recipient
    Then the transaction should be successful

  Scenario: Adults can withdraw money
    Given an adult user with sufficient balance
    When the adult user initiates a withdrawal request
    Then the withdrawal should be successful

  Scenario: Non-adults cannot send money
    Given a non-adult user
    And a recipient who is an adult
    When the non-adult user tries to send money to the recipient
    Then the transaction should fail with an error message

  Scenario: Non-adults can receive money from adults
    Given a non-adult user
    And an adult sender
    When the adult sends money to the non-adult user
    Then the transaction should be successful

  Scenario: Non-adults cannot withdraw money
    Given a non-adult user
    When the non-adult user initiates a withdrawal request
    Then the withdrawal should fail with an error message

  Scenario: Adults can send money to non-adults
    Given an adult user with sufficient balance
    And a non-adult recipient
    When the adult user sends money to the non-adult
    Then the transaction should be successful

  Scenario: Insufficient balance for sending money
    Given an adult user with insufficient balance
    When the user tries to send money
    Then the transaction should fail with an error message

  Scenario: Non-adult tries to send money to an adult
    Given a non-adult user
    And an adult recipient
    When the non-adult user tries to send money to the adult recipient
    Then the transaction should fail with an error message

  Scenario: Non-adult tries to send money to another non-adult
    Given a non-adult user
    And another non-adult recipient
    When the non-adult user tries to send money to the recipient
    Then the transaction should fail with an error message

  Scenario: Withdrawal limit exceeded
    Given an adult user with a withdrawal limit
    And the user has already reached the limit
    When the user tries to withdraw money
    Then the withdrawal should fail with an error message

  Scenario: Non-adult tries to receive money from another non-adult
    Given two non-adult users
    When one non-adult tries to send money to the other non-adult
    Then the transaction should fail with an error message

  Scenario: Transaction between non-adults is not allowed
    Given two non-adult users
    When they try to send money to each other
    Then the transaction should fail with an error message
