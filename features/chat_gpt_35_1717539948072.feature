**Feature: Money Transactions for Adult Users**

As an adult user, I want to be able to send and withdraw money.

**Scenario 1: Adult user sends money**
- Given an adult user with a verified account
- When the user chooses to send money to another user
- Then the transaction should be successful

**Scenario 2: Adult user withdraws money**
- Given an adult user with a verified account
- When the user chooses to withdraw money from their account
- Then the withdrawal should be successful

**Scenario 3: Non-adult user attempts to send money**
- Given a non-adult user trying to send money
- When the non-adult user tries to initiate a transaction
- Then the transaction should be blocked

**Scenario 4: Non-adult user attempts to withdraw money**
- Given a non-adult user trying to withdraw money
- When the non-adult user attempts to withdraw money
- Then the withdrawal should be blocked

**Scenario 5: Adult user sends money successfully**
- Given an adult user with sufficient balance
- And a valid recipient
- When the user initiates a money transfer
- Then the recipient should receive the money

**Scenario 6: Adult user withdraws money successfully**
- Given an adult user with sufficient balance
- When the user requests a withdrawal
- Then the user's account balance should decrease by the withdrawn amount

**Scenario 7: Non-adult user tries to send money and fails**
- Given a non-adult user trying to send money
- When the non-adult user attempts a transaction
- Then the transaction should be denied

**Scenario 8: Non-adult user tries to withdraw money and fails**
- Given a non-adult user trying to withdraw money
- When the non-adult user attempts to withdraw money
- Then the withdrawal should be denied