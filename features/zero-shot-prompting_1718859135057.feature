
Feature: Sending and Withdrawing Money

Scenario: Positive Test Cases
  Given a valid adult user with sufficient funds
    When they send money to another user
    Then the transaction is successful
  
  Given a valid non-adult user with sufficient funds
    When they send money to another user
    Then the transaction is successful
  
  Given a valid adult user with a bank account
    When they withdraw money from an ATM
    Then the withdrawal is successful
  
  Given a valid non-adult user with a bank account
    When they withdraw money from an ATM with parental consent
    Then the withdrawal is successful

Scenario: Negative Test Cases
  Given an adult user with insufficient funds
    When they try to send money to another user
    Then the transaction fails
  
  Given a non-adult user trying to send money
    When they try to send money to another user
    Then the transaction fails
  
  Given an adult user with no bank account
    When they try to withdraw money from an ATM
    Then the withdrawal fails
  
  Given a non-adult user trying to withdraw money without parental consent
    When they try to withdraw money from an ATM
    Then the withdrawal fails
  
Feature: Sending and Withdrawing Money

  Scenario: Adult User Sending Money
    Given a valid adult user with sufficient funds
    When they send money to another user
    Then the transaction is successful

  Scenario: Non-Adult User Sending Money
    Given a valid non-adult user with sufficient funds
    When they send money to another user
    Then the transaction is successful

  Scenario: Adult User Withdrawing Money
    Given a valid adult user with a bank account
    When they withdraw money from an ATM
    Then the withdrawal is successful

  Scenario: Non-Adult User Withdrawing Money with Parental Consent
    Given a valid non-adult user with a bank account and parental consent
    When they withdraw money from an ATM
    Then the withdrawal is successful

  Scenario: Adult User Sending Money with Insufficient Funds
    Given an adult user with insufficient funds
    When they try to send money to another user
    Then the transaction fails
  
  Scenario: Non-Adult User Sending Money
    Given a non-adult user trying to send money
    When they try to send money to another user
    Then the transaction fails

  Scenario: Adult User With No Bank Account
    Given an adult user with no bank account
    When they try to withdraw money from an ATM
    Then the withdrawal fails

  Scenario: Non-Adult User Withdrawing Money without Parental Consent
    Given a non-adult user trying to withdraw money without parental consent
    When they try to withdraw money from an ATM
    Then the withdrawal fails
  