
Feature: Money Transactions for Adults and Non-Adults

  Background: 
    Given a user is an adult 

  @withdraw
  Scenario: Adult user withdraws money
    When the user is an adult
    And the user withdraws 50 euros
    Then the withdrawal is successful

  @send
  Scenario: Adult user sends money
    When the user is an adult
    And the user sends 30 euros
    Then the money transfer is successful

  @non_adult_send_over_limit
  Scenario Outline: Non-adult user attempts to send over limit
    Given the user is not an adult
    And the user tries to send <amount> euros
    Then the transaction is rejected

    Examples:
      | amount |
      | 25     |
      | 30     |

  @adult_send_over_limit
  Scenario Outline: Adult user attempts to send over limit
    Given the user is an adult
    And the user sends <amount> euros
    Then the money transfer is successful

    Examples:
      | amount |
      | 100    |
      | 200    |

  @non_adult_withdraw
  Scenario: Non-adult user attempts to withdraw money
    Given the user is not an adult
    When the user tries to withdraw 20 euros
    Then the transaction is rejected

  @adult_withdraw
  Scenario: Adult user withdraws any amount
    Given the user is an adult
    When the user withdraws 50 euros
    Then the withdrawal is successful
