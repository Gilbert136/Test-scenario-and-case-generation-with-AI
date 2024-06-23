Feature: Money Transactions for Adults and Non-Adults

  Background: 
    Given a user is an adult 

  @send 
  Scenario Outline: Sending money as an adult
    Given the user is an adult
    When the user sends <amount> euros
    Then the money transfer is successful

    @test @positive 
    Examples: 
      | amount | 
      | 10     | 
      | 50     | 

  @withdraw 
  Scenario: Withdrawing money as an adult
    Given the user is an adult
    When the user withdraws money
    Then the withdrawal is successful

  @send 
  Scenario Outline: Sending money as a non-adult
    Given the user is not an adult
    When the user tries to send <amount> euros
    Then the transaction should fail

    @test @negative 
    Examples: 
      | amount | 
      | 25     | 
      | 30     | 

  @withdraw 
  Scenario: Withdrawing money as a non-adult
    Given the user is not an adult
    When the user tries to withdraw money
    Then the withdrawal should fail

  @send 
  Scenario Outline: Non-adult user sending more than 20 euros
    Given the user is not an adult
    When the user tries to send <amount> euros
    Then the transaction should be limited

    @test @negative 
    Examples: 
      | amount | 
      | 25     | 
      | 30     | 

  @send 
  Scenario Outline: Adult user sending any amount
    Given the user is an adult
    When the user sends <amount> euros
    Then the money transfer is successful

    @test @positive 
    Examples: 
      | amount | 
      | 100    | 
      | 500    | 

  @withdraw 
  Scenario: Non-adult user withdrawing money
    Given the user is not an adult
    When the user tries to withdraw money
    Then the withdrawal should be restricted

  @send 
  Scenario: Adult user sending money without any amount limit
    Given the user is only an adult
    When the user sends any amount of money
    Then the money transfer is successful

  @withdraw 
  Scenario: Adult user withdrawing money without any restrictions
    Given the user is only an adult
    When the user withdraws money
    Then the withdrawal is successful

  @send
  Scenario Outline: Adult user sending more than 20 euros as non-adult
    Given the user is not an adult
    And the user is only an adult
    When the user tries to send <amount> euros
    Then the transaction should be successful
    
    @test
    Examples:
      | amount |
      | 25     |
      | 30     |
  Feature: Money Transactions for Adults and Non-Adults

  Background: 
    Given a user is an adult 

  @send 
  Scenario Outline: Sending money as an adult
    Given the user is an adult
    When the user sends <amount> euros
    Then the money transfer is successful

    @test @positive 
    Examples: 
      | amount | 
      | 10     | 
      | 50     | 

  @withdraw 
  Scenario: Withdrawing money as an adult
    Given the user is an adult
    When the user withdraws money
    Then the withdrawal is successful

  @send 
  Scenario Outline: Sending money as a non-adult
    Given the user is not an adult
    When the user tries to send <amount> euros
    Then the transaction should fail

    @test @negative 
    Examples: 
      | amount | 
      | 25     | 
      | 30     | 

  @withdraw 
  Scenario: Withdrawing money as a non-adult
    Given the user is not an adult
    When the user tries to withdraw money
    Then the withdrawal should fail

  @send 
  Scenario Outline: Non-adult user sending more than 20 euros
    Given the user is not an adult
    When the user tries to send <amount> euros
    Then the transaction should be limited

    @test @negative 
    Examples: 
      | amount | 
      | 25     | 
      | 30     | 

  @send 
  Scenario Outline: Adult user sending any amount
    Given the user is an adult
    When the user sends <amount> euros
    Then the money transfer is successful

    @test @positive 
    Examples: 
      | amount | 
      | 100    | 
      | 500    | 

  @withdraw 
  Scenario: Non-adult user withdrawing money
    Given the user is not an adult
    When the user tries to withdraw money
    Then the withdrawal should be restricted

  @send 
  Scenario: Adult user sending money without any amount limit
    Given the user is only an adult
    When the user sends any amount of money
    Then the money transfer is successful

  @withdraw 
  Scenario: Adult user withdrawing money without any restrictions
    Given the user is only an adult
    When the user withdraws money
    Then the withdrawal is successful

  @send
  Scenario Outline: Adult user with insufficient funds
    Given the user is an adult
    And the user has <balance> euros
    When the user tries to send <amount> euros
    Then the transaction should fail due to insufficient funds
    
    @test
    Examples:
      | balance | amount |
      | 20      | 25     |
      | 30      | 40     |