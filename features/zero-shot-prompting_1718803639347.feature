
Feature: Money Transactions for Adults and Non-adults
  
  Scenario: Sending money as an adult
    Given an adult user with sufficient balance
    When they send money to another user
    Then the transaction should be successful

  Scenario: Withdrawing money as an adult
    Given an adult user with sufficient balance
    When they withdraw money from their account
    Then the withdrawal should be successful

  Scenario: Sending money as a non-adult
    Given a non-adult user with sufficient balance
    When they try to send money to another user 
    Then the transaction should fail with an error stating age restriction

  Scenario: Withdrawing money as a non-adult
    Given a non-adult user with sufficient balance
    When they try to withdraw money from their account
    Then the withdrawal should fail with an error stating age restriction

  Scenario: Sending money with insufficient balance
    Given a user with insufficient balance
    When they try to send money
    Then the transaction should fail with an error stating insufficient funds

  Scenario: Withdrawing money with insufficient balance
    Given a user with insufficient balance
    When they try to withdraw money
    Then the withdrawal should fail with an error stating insufficient funds
  