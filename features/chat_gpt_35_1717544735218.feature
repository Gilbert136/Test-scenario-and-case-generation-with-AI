Feature: Money Transactions for Adults and Non-Adults

  Background:
    Given I am a registered user
    And I am an adult

  Scenario: Adult User Sending Money
    Given my account balance is 100 euros
    When I send 50 euros to another user
    Then the transaction is successful
    And my account balance is now 50 euros

  Scenario: Adult User Withdrawing Money
    Given my account balance is 100 euros
    When I withdraw 30 euros from my account
    Then the withdrawal is successful
    And my account balance is now 70 euros

  Scenario: Non-Adult User Sending Money
    Given I am a non-adult user
    And my account balance is 30 euros
    When I try to send 25 euros to another user
    Then the transaction is blocked
    And I receive a notification that I can only send up to 20 euros

  Scenario: Non-Adult User Withdrawing Money
    Given I am a non-adult user
    And my account balance is 30 euros
    When I try to withdraw 10 euros from my account
    Then the transaction is blocked
    And I receive a notification that I am not allowed to withdraw money

  Scenario: Adult User Sending More than 20 Euros
    Given my account balance is 100 euros
    When I try to send 25 euros to another user
    Then the transaction is successful
    And my account balance is now 75 euros

  Scenario: Non-Adult User Sending 20 Euros
    Given I am a non-adult user
    And my account balance is 30 euros
    When I send 20 euros to another user
    Then the transaction is successful
    And my account balance is now 10 euros