Feature: Money Transactions for Business

  Scenario: Adult user successfully withdraws money
    Given the user is an adult
    When the user withdraws 50 euros
    Then the withdrawal is successful

  Scenario: Adult user successfully sends money
    Given the user is an adult
    When the user sends 30 euros to another user
    Then the money transfer is successful

  Scenario: Non-adult user tries to send more than 20 euros
    Given the user is not an adult
    When the user tries to send 25 euros to another user
    Then the transaction fails

  Scenario: Adult user sends money successfully regardless of amount
    Given the user is an adult
    When the user sends 100 euros to another user
    Then the money transfer is successful

  Scenario: Non-adult user tries to withdraw money
    Given the user is not an adult
    When the user tries to withdraw 40 euros
    Then the withdrawal fails

  Scenario: Non-adult user successfully sends money within 20 euros
    Given the user is not an adult
    When the user sends 15 euros to another user
    Then the money transfer is successful