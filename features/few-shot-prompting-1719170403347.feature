Feature: Money Transactions for Adults and Minors

  Background:
    Given a user is an adult

  Scenario: Adult user withdraws money
    When the user is an adult
    And the user withdraws money
    Then the withdrawal is successful

  Scenario: Adult user sends money
    When the user is an adult
    And the user sends money
    Then the money transfer is successful

  Scenario: Non-adult user tries to send more than 20 euros
    Given the user is not an adult
    When the user tries to send more than 20 euros
    Then the transaction is rejected

  Scenario: Adult user sends any amount of money
    Given the user is an adult
    When the user sends any amount of money
    Then the money transfer is successful

  Scenario: Non-adult user tries to withdraw money
    Given the user is not an adult
    When the user tries to withdraw money
    Then the transaction is rejected

  Scenario: Adult user withdraws any amount of money
    Given the user is an adult
    When the user withdraws any amount of money
    Then the withdrawal is successful