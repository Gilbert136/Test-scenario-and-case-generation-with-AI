Scenario: Sending and Withdrawing Money for Adults and Non-Adults

Given a user is an adult
When the user withdraws money
Then the user should be able to withdraw money successfully

Given a user is an adult
And the user has sufficient funds
When the user sends money
Then the user should be able to send money successfully

Given a user is a non-adult
And the user attempts to send more than 20 euros
When the user tries to send money
Then the user should be blocked from sending money exceeding 20 euros

Given a user is a non-adult
When the user tries to send money
Then the user should not be able to send money

Given a user is an adult
And the user sends money
When the transaction is processed
Then the money should be successfully sent without any restrictions

Given a user is a non-adult
And the user tries to withdraw money
When the user attempts to withdraw
Then the user should not be able to withdraw money

Given a user is an adult
When the user tries to withdraw money
Then the user should be able to withdraw money successfully