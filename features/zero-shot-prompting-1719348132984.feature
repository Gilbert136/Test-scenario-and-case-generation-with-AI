Scenario: Sending money to a non-existent account
  Given the sender has sufficient funds
  When the sender tries to send money to a non-existent account
  Then the transfer should be denied due to invalid recipient
  
Scenario: Attempting to withdraw a negative amount
  Given the requester has a negative withdrawal amount
  When the requester tries to initiate a withdrawal
  Then the withdrawal request should be denied due to invalid amount
  
Scenario: Sending money to a frozen account
  Given the sender has sufficient funds
  And the recipient's account is frozen
  When the sender tries to initiate a money transfer to the frozen account
  Then the transfer should be denied due to account status
  
Scenario: Withdrawing money from a frozen account
  Given the requester has sufficient funds
  And the requester's account is frozen
  When the requester tries to withdraw money from the frozen account
  Then the withdrawal should be denied due to account status
  
Scenario: Sending a large amount of money by a non-adult
  Given the sender is a non-adult
  And the sender has a large amount of funds to send
  When the sender tries to initiate a money transfer
  Then the transfer should be denied due to sender's age limitation
  
Scenario: Attempting to withdraw funds from a locked account
  Given the requester has sufficient funds
  And the requester's account is locked
  When the requester tries to withdraw money from the locked account
  Then the withdrawal should be denied due to account lock status