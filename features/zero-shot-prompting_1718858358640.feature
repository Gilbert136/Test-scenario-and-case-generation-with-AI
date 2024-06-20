**Feature:** Money Transactions

**Scenario:** Sending money as an adult  
**Given** the sender is an adult  
**When** the sender sends money to a recipient  
**Then** the recipient should receive the money successfully  

**Scenario:** Sending money as a non-adult  
**Given** the sender is a non-adult  
**When** the sender tries to send money to a recipient  
**Then** the transaction should be declined  

**Scenario:** Withdrawing money as an adult  
**Given** the account holder is an adult  
**When** the account holder makes a withdrawal  
**Then** the withdrawal should be successful  

**Scenario:** Withdrawing money as a non-adult  
**Given** the account holder is a non-adult  
**When** the account holder tries to make a withdrawal  
**Then** the withdrawal should be declined  

**Scenario:** Insufficient funds for sending money  
**Given** the sender has insufficient funds  
**When** the sender tries to send money to a recipient  
**Then** the transaction should be declined  

**Scenario:** Incorrect recipient account information  
**Given** the sender enters incorrect recipient account information  
**When** the sender tries to send money  
**Then** the transaction should not be processed  

**Scenario:** Sending money to a non-existent account  
**Given** the sender tries to send money to a non-existent account  
**When** the transaction is initiated  
**Then** the transaction should fail  

**Scenario:** Attempting to withdraw beyond account limit  
**Given** the account holder attempts to withdraw an amount beyond their account limit  
**When** the withdrawal is attempted  
**Then** the transaction should be declined  

**Scenario:** Unauthorized access to account  
**Given** someone unauthorized tries to withdraw money from an account  
**When** the unauthorized withdrawal is attempted  
**Then** the transaction should be declined and alert authorities  

**Scenario:** Transaction fees for sending money  
**Given** there are transaction fees associated with sending money  
**When** the sender initiates a transaction  
**Then** the fees should be deducted from the sender's account  

**Scenario:** Processing time for withdrawals  
**Given** a withdrawal request is made  
**When** the withdrawal request is processed  
**Then** the funds should be available within the specified processing time  

**Scenario:** Maximum transaction limits  
**Given** there are maximum transaction limits set for sending money  
**When** the sender tries to make a transaction exceeding the limit  
**Then** the transaction should be declined  

**Scenario:** Age verification for adult transactions  
**Given** an adult tries to make a transaction  
**When** age verification is required  
**Then** the transaction should proceed only after successful age verification  