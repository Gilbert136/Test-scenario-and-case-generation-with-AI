Feature: Money Transactions for Adults and Non-Adults

Scenario: User is an adult and withdraws money successfully
  Given the user is an adult
  When the user withdraws money
  Then the withdrawal is successful

Scenario: User is an adult and sends money successfully
  Given the user is an adult
  When the user sends money
  Then the money transfer is successful

Scenario: User is not an adult and tries to send more than 20 euros
  Given the user is not an adult
  When the user tries to send more than 20 euros
  Then the transaction is rejected

Scenario: User is an adult and tries to send any amount
  Given the user is an adult
  When the user sends any amount of money
  Then the money transfer is successful

Scenario: User is not an adult and tries to withdraw money
  Given the user is not an adult
  When the user tries to withdraw money
  Then the transaction is rejected

Scenario: User is an adult and withdraws any amount
  Given the user is an adult
  When the user withdraws any amount of money
  Then the withdrawal is successful