Feature: Money Transaction for Business

  Scenario: Adult user successfully withdraws money
    Given the user is an adult
    And the user has sufficient balance
    When the user withdraws 50 euros
    Then the withdrawal is successful

  Scenario: Adult user successfully sends money
    Given the user is an adult
    And the user has sufficient balance
    When the user sends 30 euros
    Then the money transfer is successful

  Scenario: Non-adult user unable to send more than 20 euros
    Given the user is not an adult
    And the user has a balance of 50 euros
    When the user tries to send 25 euros
    Then the money transfer fails

  Scenario: Adult user successfully sends any amount of money
    Given the user is an adult
    And the user has sufficient balance
    When the user sends 100 euros
    Then the money transfer is successful

  Scenario: Non-adult user unable to withdraw money
    Given the user is not an adult
    And the user has a balance of 50 euros
    When the user tries to withdraw money
    Then the withdrawal is not allowed

  Scenario: Adult user sending money with insufficient balance
    Given the user is an adult
    And the user has a balance of 10 euros
    When the user tries to send 20 euros
    Then the money transfer fails