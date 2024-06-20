
Feature: Money Transactions for Business

Scenario: Positive test scenario for adults sending money
  Given an adult with a verified account
  When the adult sends money to another adult
  Then the transaction is processed successfully

Scenario: Negative test scenario for adults sending money with insufficient balance
  Given an adult with a verified account
  And the adult has insufficient balance
  When the adult tries to send money
  Then the transaction fails with an insufficient balance error

Scenario: Positive test scenario for adults withdrawing money
  Given an adult with a verified account
  When the adult withdraws money
  Then the withdrawal is successful

Scenario: Negative test scenario for adults withdrawing more than available balance
  Given an adult with a verified account
  And the adult tries to withdraw more money than available balance
  When the adult attempts a withdrawal
  Then the withdrawal fails due to insufficient funds

Scenario: Positive test scenario for non-adults receiving money
  Given a non-adult with a verified account
  When a transaction is made to the non-adult's account
  Then the non-adult receives the money successfully

Scenario: Negative test scenario for non-adults sending money
  Given a non-adult with a verified account
  When the non-adult tries to send money
  Then the transaction fails as non-adults are not allowed to send money
Feature: Money Transactions for Business

Scenario: Positive test scenario for adults sending money
  Given an adult with a verified account
  When the adult sends money to another adult
  Then the transaction is processed successfully

Scenario: Negative test scenario for adults sending money with insufficient balance
  Given an adult with a verified account
  And the adult has insufficient balance
  When the adult tries to send money
  Then the transaction fails with an insufficient balance error

Scenario: Positive test scenario for adults withdrawing money
  Given an adult with a verified account
  When the adult withdraws money
  Then the withdrawal is successful

Scenario: Negative test scenario for adults withdrawing more than available balance
  Given an adult with a verified account
  And the adult tries to withdraw more money than available balance
  When the adult attempts a withdrawal
  Then the withdrawal fails due to insufficient funds

Scenario: Positive test scenario for non-adults receiving money
  Given a non-adult with a verified account
  When money is transferred to the non-adult's account
  Then the non-adult receives the money successfully

Scenario: Negative test scenario for non-adults sending money
  Given a non-adult with a verified account
  When the non-adult tries to send money
  Then the transaction fails as non-adults are not allowed to send money