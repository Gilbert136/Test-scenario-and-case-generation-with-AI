
Feature: Money Transactions for Business

  Scenario: Adult user successfully withdraws money
    Given the user is an adult
    When the user withdraws 50 euros
    Then the withdrawal is successful

  Scenario: Adult user successfully sends money
    Given the user is an adult
    When the user sends 30 euros
    Then the money transfer is successful

  Scenario: Non-adult user tries to send over 20 euros (negative test)
    Given the user is not an adult
    When the user tries to send 25 euros
    Then the money transfer fails

  Scenario: Adult user successfully sends any amount of money
    Given the user is an adult
    When the user sends 100 euros
    Then the money transfer is successful

  Scenario: Non-adult user tries to withdraw money (negative test)
    Given the user is not an adult
    When the user tries to withdraw 10 euros
    Then the withdrawal fails

  Scenario: Non-adult user successfully sends money within 20 euros
    Given the user is not an adult
    When the user sends 15 euros
    Then the money transfer is successful
