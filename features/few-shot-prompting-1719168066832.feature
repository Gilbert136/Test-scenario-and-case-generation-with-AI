
Feature: Money Transactions for Adults and Non-Adults

Background:
  Given a user is either an adult or a non-adult

Scenario: Adult user can withdraw money 
  Given the user is an adult 
  When the user tries to withdraw money 
  Then the withdrawal is successful

Scenario: Adult user can send money 
  Given the user is an adult 
  When the user tries to send money 
  Then the money transfer is successful

Scenario: Non-adult user cannot withdraw money 
  Given the user is a non-adult 
  When the user tries to withdraw money 
  Then the withdrawal is unsuccessful

Scenario: Non-adult user cannot send more than 20 euros 
  Given the user is a non-adult 
  When the user tries to send more than 20 euros 
  Then the transaction is blocked

Scenario: Adult user can send any amount of money 
  Given the user is an adult 
  When the user tries to send any amount of money 
  Then the money transfer is successful

Scenario: Non-adult user cannot send any amount of money 
  Given the user is a non-adult 
  When the user tries to send any amount of money 
  Then the transaction is blocked

