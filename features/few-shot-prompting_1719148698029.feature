Feature: Money Transactions for Adults and Non-Adults

  Background: 
    Given a user is an adult 
          
  @withdraw 
  Scenario Outline: Adult user can withdraw money 
    Given the user is an adult 
    When the user withdraws <amount> euros 
    Then the withdrawal is successful 
          
    @test @withdraws 
    Examples: 
      | amount | 
      | 50     | 
      | 100    | 
          
  @send 
  Scenario Outline: Adult user can send money 
    Given the user is an adult 
    When the user sends <amount> euros 
    Then the money transfer is successful 
          
    @test @sends 
    Examples: 
      | amount | 
      | 30     | 
      | 50     | 
          
  @non_adult_send_over_limit 
  Scenario Outline: Non-adult user trying to send over 20 euros 
    Given the user is not an adult 
    When the user tries to send <amount> euros 
    Then the transaction is rejected 
          
    @test @non_adult_restricted_send 
    Examples: 
      | amount | 
      | 25     | 
      | 30     | 
          
  @adult_send_over_limit 
  Scenario Outline: Adult user sending over limit 
    Given the user is an adult 
    When the user sends <amount> euros 
    Then the money transfer is successful 
          
    @test @adult_unrestricted_send 
    Examples: 
      | amount | 
      | 100    | 
      | 200    |
          
  @non_adult_withdraw 
  Scenario Outline: Non-adult user trying to withdraw money 
    Given the user is not an adult 
    When the user tries to withdraw <amount> euros 
    Then the transaction is rejected 
          
    @test @non_adult_withdraws 
    Examples: 
      | amount | 
      | 20     | 
      | 50     |
          
  @adult_withdraw 
  Scenario Outline: Adult user can withdraw any amount 
    Given the user is an adult 
    When the user withdraws <amount> euros 
    Then the withdrawal is successful 
          
    @test @adult_withdraws 
    Examples: 
      | amount | 
      | 50     | 
      | 100    |
      