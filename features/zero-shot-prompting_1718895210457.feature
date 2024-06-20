
Feature: Sending and Withdrawing Money for Business Transactions

  Scenario: Sending money with a valid recipient
    Given I am an adult user with sufficient balance in my account
    And there is a valid recipient to send money to
    When I initiate a money transfer to the recipient
    Then the transfer should be successful and the recipient should receive the money

  Scenario: Sending money to an invalid recipient
    Given I am an adult user with sufficient balance in my account
    And the recipient's account information is incorrect
    When I try to send money to the invalid recipient
    Then the transfer should fail with an error message indicating invalid recipient

  Scenario: Withdrawing money within daily transaction limits
    Given I am an adult user with sufficient balance in my account
    And the withdrawal amount is within the daily transaction limit
    When I request to withdraw money within the limit
    Then the withdrawal should be successful and the balance reduced accordingly

  Scenario: Withdrawing money exceeding daily transaction limits
    Given I am an adult user with sufficient balance in my account
    And the withdrawal amount exceeds the daily transaction limit
    When I try to withdraw money exceeding the limit
    Then the withdrawal request should be denied with an error message indicating daily transaction limit exceeded

  Scenario: Sending money in a different currency
    Given I am an adult user with a multi-currency account
    And there is a valid recipient in a different currency
    When I initiate a money transfer in a different currency
    Then the transfer should be successful, with conversion rates applied

  Scenario: Sending money with network connection issues
    Given I am an adult user with sufficient balance in my account
    And there are temporary network connection issues
    When I attempt to initiate a money transfer
    Then the transfer should be queued and processed once the connection is restored

Feature: Sending and Withdrawing Money for Business Transactions

  Scenario: Sending money as an adult
    Given I am an adult user with sufficient balance in my account
    When I initiate a money transfer transaction to another user
    Then the money should be successfully sent and reflected in the recipient's account

  Scenario: Sending money as a non-adult
    Given I am a non-adult user with sufficient balance in my account
    When I attempt to initiate a money transfer transaction
    Then the transfer should be declined with an error message stating age restriction

  Scenario: Withdrawing money as an adult
    Given I am an adult user with sufficient balance in my account
    When I request to withdraw money from my account
    Then the withdrawal should be successful and the balance reduced accordingly

  Scenario: Withdrawing money as a non-adult
    Given I am a non-adult user with sufficient balance in my account
    When I try to request for a money withdrawal
    Then the withdrawal request should be denied with an age restriction error message

  Scenario: Sending money with insufficient balance
    Given I am an adult user with insufficient balance in my account
    When I attempt to send money to another user
    Then the transfer should fail with an error message indicating insufficient funds

  Scenario: Withdrawing more money than available balance
    Given I am an adult user with a limited balance in my account
    When I try to withdraw an amount exceeding my account balance
    Then the withdrawal request should be denied with an error message stating insufficient funds

  Scenario: Sending money with a wire transfer
    Given I am an adult user with sufficient balance in my account
    And I want to send money to an international recipient
    When I initiate a wire transfer transaction
    Then the wire transfer should be successful, with applicable fees deducted

  Scenario: Receiving money as an adult
    Given I am an adult user with an account that can receive money
    When someone sends me money
    Then the money should be successfully deposited into my account

  Scenario: Receiving money as a non-adult
    Given I am a non-adult user with an account that can receive money
    When someone sends me money
    Then the money should be successfully deposited into my account, following age restriction rules

  Scenario: Withdrawing all money from the account
    Given I am an adult user with a balance in my account
    When I request to withdraw all the money in my account
    Then the withdrawal should be successful and the account balance should be zero

  Scenario: Sending money with incorrect recipient details
    Given I am an adult user with sufficient balance in my account
    And the recipient's account information is incorrect
    When I try to send money with the incorrect recipient details
    Then the transfer should fail with an error message indicating incorrect recipient details