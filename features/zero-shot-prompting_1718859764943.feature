**Feature:** Money Transactions

**Scenario 1:** Adults sending money
**Given** a user is an adult
**When** the user sends money to another user
**Then** the transaction should be successful

**Scenario 2:** Adults withdrawing money
**Given** a user is an adult
**When** the user withdraws money from their account
**Then** the withdrawal should be processed successfully

**Scenario 3:** Non-adults sending money 
**Given** a user is a non-adult
**When** the user tries to send money to another user
**Then** the transaction should be declined

**Scenario 4:** Non-adults withdrawing money
**Given** a user is a non-adult
**When** the user tries to withdraw money from their account
**Then** the withdrawal should be declined

**Scenario 5:** Insufficient balance for sending money
**Given** a user has insufficient balance in their account
**When** the user tries to send money to another user
**Then** the transaction should be declined due to insufficient funds

**Scenario 6:** Incorrect recipient details for sending money
**Given** a user is trying to send money
**When** the recipient details are entered incorrectly
**Then** the transaction should fail due to incorrect recipient details