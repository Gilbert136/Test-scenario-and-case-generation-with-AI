Feature: Money Transactions for Adults and Non-Adults
  Background: 
    Given a user is an adult 
            
  @withdraw 
  Scenario Outline: Adult user can withdraw money 
    Given the user is an adult 
    When the user withdraws <amount> euros 
    Then the withdrawal is successful 
            
    @test @dev 
    Examples: 
      | amount | 
      | 50     | 
      | 100    | 
            
  @send 
  Scenario Outline: Adult user can send money 
    Given the user is an adult 
    When the user sends <amount> euros 
    Then the money transfer is successful 
            
    @test @dev 
    Examples: 
      | amount | 
      | 30     | 
      | 50     | 
            
  @block 
  Scenario Outline: Non-adult user sending over 20 euros is blocked 
    Given the user is not an adult 
    When the user tries to send <amount> euros 
    Then the transaction is blocked 
            
    @test @dev 
    Examples: 
      | amount | 
      | 25     | 
      | 30     |