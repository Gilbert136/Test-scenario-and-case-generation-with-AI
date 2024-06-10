Feature: Money Transactions for Adult and Non-Adult

    Scenario: Adult User Sending Money
        Given my account balance is 100 euros
        When I send 50 euros to another user
        Then the transaction is successful
        And my account balance is now 50 euros
