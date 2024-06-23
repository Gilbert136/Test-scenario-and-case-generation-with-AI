
Feature: Money Transactions for Business

  Scenario: Sending money by adults
    Given an adult user with sufficient balance
    When the user sends money to another user
    Then the transaction should be successful

  Scenario: Sending money by non-adults
    Given a non-adult user with sufficient balance
    When the user tries to send money to another user
    Then the transaction should be blocked

  Scenario: Withdrawing money by adults
    Given an adult user with sufficient balance
    When the user withdraws money from their account
    Then the withdrawal should be successful

  Scenario: Withdrawing money by non-adults
    Given a non-adult user with sufficient balance
    When the user tries to withdraw money from their account
    Then the withdrawal should be blocked

  Scenario: Insufficient balance for sending money
    Given an adult user with insufficient balance
    When the user tries to send money to another user
    Then the transaction should fail due to lack of funds

  Scenario: Insufficient balance for withdrawal
    Given an adult user with insufficient balance
    When the user tries to withdraw money from their account
    Then the withdrawal should fail due to lack of funds
