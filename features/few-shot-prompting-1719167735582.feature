Feature: Money Transactions for Adults and Non-Adults

  Background: 
    Given a user is an adult 
          
  @withdraw 
  Scenario: Adult user successfully withdraws money 
    When the adult user withdraws 50 euros 
    Then the withdrawal is successful 
          
  @send 
  Scenario: Adult user successfully sends money 
    When the adult user sends 30 euros 
    Then the money transfer is successful 
          
  @send_high_amount 
  Scenario: Adult user successfully sends a high amount of money 
    When the adult user sends 100 euros 
    Then the money transfer is successful 
          
  @send_over_limit 
  Scenario: Non-adult user trying to send over 20 euros is prevented 
    Given the user is not an adult 
    When the non-adult user tries to send 25 euros 
    Then the transaction is blocked 
          
  @send_negative_amount 
  Scenario: User trying to send a negative amount is prevented 
    Given the user is an adult 
    When the user tries to send -10 euros 
    Then the transaction is blocked 
          
  @send_non_adult_negative_amount 
  Scenario: Non-adult user trying to send a negative amount is prevented 
    Given the user is not an adult 
    When the non-adult user tries to send -5 euros 
    Then the transaction is blocked      @withdraw_negative_amount 
  Scenario: User trying to withdraw a negative amount is prevented 
    Given the user is an adult 
    When the user tries to withdraw -10 euros 
    Then the transaction is blocked 
          
  @withdraw_non_adult 
  Scenario: Non-adult user trying to withdraw money is prevented 
    Given the user is not an adult 
    When the non-adult user tries to withdraw 20 euros 
    Then the transaction is blocked 
          
  @send_zero_amount 
  Scenario: User trying to send zero amount is prevented 
    Given the user is an adult 
    When the user tries to send 0 euros 
    Then the transaction is blocked 
          
  @withdraw_zero_amount 
  Scenario: User trying to withdraw zero amount is prevented 
    Given the user is an adult 
    When the user tries to withdraw 0 euros 
    Then the transaction is blocked 