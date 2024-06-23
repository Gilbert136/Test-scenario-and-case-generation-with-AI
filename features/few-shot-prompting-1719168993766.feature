Feature: Money Transactions for Adults and Non-Adults

  Background: 
    Given a user is an adult 

  @withdraw 
  Scenario Outline: Adult user withdraws money successfully
    Given the user is an adult 
    When the user withdraws <amount> euros 
    Then the withdrawal is successful
          
    Examples:
      | amount |
      | 50     |
      | 100    |
          
  @send 
  Scenario Outline: Adult user sends money successfully
    Given the user is an adult 
    When the user sends <amount> euros 
    Then the money transfer is successful
          
    Examples:
      | amount |
      | 30     |
      | 50     |
          
  @non_adult_send_over_limit 
  Scenario Outline: Non-adult user tries to send over 20 euros
    Given the user is not an adult 
    When the user tries to send <amount> euros 
    Then the transaction is rejected
          
    Examples:
      | amount |
      | 25     |
      | 30     |
          
  @adult_send_any_amount 
  Scenario: Adult user can send any amount of money
    Given the user is only an adult 
    When the user sends any amount of money 
    Then the money transfer is successful

  @non_adult_withdraw 
  Scenario: Non-adult user tries to withdraw money
    Given the user is not an adult 
    When the user tries to withdraw money 
    Then the transaction is rejected
          
  @adult_withdraw 
  Scenario Outline: Adult user withdraws any amount of money
    Given the user is an adult 
    When the user withdraws <amount> euros 
    Then the withdrawal is successful

    Examples:
      | amount |
      | 50     |
      | 100    |