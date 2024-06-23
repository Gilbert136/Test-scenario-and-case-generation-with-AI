Feature: Money Transactions for Adults and Non-Adults

  Background:
    Given a user is an adult

  Scenario: Adult user withdraws money
    When the adult user withdraws money
    Then the withdrawal is successful

  Scenario: Adult user sends money
    When the adult user sends money
    Then the money transfer is successful

  Scenario: Non-adult user tries to send more than 20 euros
    Given the user is not an adult
    When the non-adult user tries to send more than 20 euros
    Then the transaction is rejected

  Scenario: Adult user sends any amount of money
    Given the user is an adult
    When the adult user sends any amount of money
    Then the money transfer is successful

  Scenario: Non-adult user tries to withdraw money
    Given the user is not an adult
    When the non-adult user tries to withdraw money
    Then the transaction is rejected

  Scenario Outline: Adult user withdraws various amounts
    Given the user is an adult
    When the adult user withdraws <amount> euros
    Then the withdrawal is successful

    Examples:
      | amount |
      | 50     |
      | 100    |

  Scenario Outline: Adult user sends various amounts
    Given the user is an adult
    When the adult user sends <amount> euros
    Then the money transfer is successful

    Examples:
      | amount |
      | 30     |
      | 50     |