Feature: Money Transactions for Business

  Scenario: Adult user successfully withdraws money
    Given the user is an adult
    When the user withdraws 50 euros
    Then the withdrawal is successful
    
  Scenario: Adult user successfully sends money
    Given the user is an adult
    When the user sends 30 euros
    Then the money is successfully sent
    
  Scenario: Non-adult user tries to send over 20 euros
    Given the user is not an adult
    When the user tries to send 25 euros
    Then the transaction fails
    
  Scenario: Adult user sends any amount of money
    Given the user is an adult
    When the user sends 50 euros
    Then the money is successfully sent
    
  Scenario: Non-adult user tries to withdraw money
    Given the user is not an adult
    When the user tries to withdraw 10 euros
    Then the withdrawal is not allowed
    
  Scenario: Non-adult user successfully sends money under 20 euros
    Given the user is not an adult
    When the user sends 15 euros
    Then the money is successfully sent