
Feature: Money Transactions for Adults and Non-Adults

Scenario: Sending money by an adult
  Given an adult with enough balance in their account
  When they send money to another account
  Then the receiver should successfully receive the money
  
Scenario: Withdrawing money by an adult
  Given an adult with enough balance in their account
  When they withdraw money from their account
  Then the withdrawal should be successful
  
Scenario: Sending money by a non-adult
  Given a non-adult with enough balance in their account
  When they try to send money to another account
  Then the transaction should be declined
  
Scenario: Withdrawing money by a non-adult
  Given a non-adult with enough balance in their account
  When they try to withdraw money from their account
  Then the withdrawal should be declined
  
Scenario: Sending money with insufficient balance
  Given an adult with insufficient balance in their account
  When they try to send money to another account
  Then the transaction should be declined
  
Scenario: Withdrawing money with insufficient balance
  Given an adult with insufficient balance in their account
  When they try to withdraw money from their account
  Then the withdrawal should be declined


These test scenarios cover a range of positive and negative cases for sending and withdrawing money by both adults and non-adults.