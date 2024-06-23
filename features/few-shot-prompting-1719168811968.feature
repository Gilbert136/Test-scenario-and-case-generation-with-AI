
Feature: Money Transactions for Adults and Non-Adults

  Background: 
    Given a user is an adult 
  
  @withdraw
  Scenario: Adult user withdraws money successfully
    When the user withdraws 50 euros
    Then the withdrawal is successful
  
  @send
  Scenario: Adult user sends money successfully
    When the user sends 30 euros
    Then the money transfer is successful

  @non_adult_send_over_limit
  Scenario: Non-adult user trying to send more than 20 euros
    Given the user is not an adult
    When the user tries to send 25 euros
    Then the transaction is rejected

  @adult_send_over_limit
  Scenario: Adult user sending over 20 euros successfully
    When the user sends 100 euros
    Then the money transfer is successful

  @non_adult_withdraw
  Scenario: Non-adult user trying to withdraw money
    Given the user is not an adult
    When the user tries to withdraw 20 euros
    Then the transaction is rejected

  @adult_withdraw
  Scenario: Adult user withdraws any amount
    When the user withdraws 50 euros
    Then the withdrawal is successful

