
Feature: Money transfer for adults and non-adults

Scenario: Sending money as an adult
  Given the sender is an adult
  And the sender has sufficient funds in their account
  When they initiate a money transfer
  Then the transfer is successful

Scenario: Sending money as a non-adult
  Given the sender is a non-adult
  When they try to initiate a money transfer
  Then the transfer is not allowed
  And an error message is displayed

Scenario: Withdrawing money as an adult
  Given the account holder is an adult
  And they have sufficient balance in their account
  When they request a withdrawal
  Then the withdrawal is processed successfully

Scenario: Withdrawing money as a non-adult
  Given the account holder is a non-adult
  When they try to request a withdrawal
  Then the withdrawal is not allowed
  And an error message is displayed

Scenario: Sending money with insufficient funds
  Given the sender is an adult
  And they have insufficient funds in their account
  When they try to initiate a money transfer
  Then the transfer fails
  And an error message is displayed

Scenario: Withdrawing more money than the account balance
  Given the account holder is an adult
  And their account balance is lower than the requested withdrawal amount
  When they try to request a withdrawal
  Then the withdrawal fails
  And an error message is displayed
Scenario: Sending money to a non-existing account
  Given the sender is an adult
  And they have sufficient funds in their account
  When they try to send money to a non-existing account
  Then the transfer fails
  And an error message is displayed

Scenario: Sending money to a blocked account
  Given the sender is an adult
  And they have sufficient funds in their account
  And the recipient's account is blocked
  When they try to send money to the blocked account
  Then the transfer fails
  And an error message is displayed

Scenario: Withdrawing money from a frozen account
  Given the account holder is an adult
  And their account is frozen
  When they try to request a withdrawal
  Then the withdrawal is not allowed
  And an error message is displayed

Scenario: Sending money to a non-adult recipient
  Given the sender is an adult
  And they have sufficient funds in their account
  And the recipient is a non-adult
  When they try to send money to the non-adult recipient
  Then the transfer fails
  And an error message is displayed

Scenario: Sending money exceeding the daily limit
  Given the sender is an adult
  And they have exceeded the daily transfer limit
  When they try to initiate a money transfer
  Then the transfer is not allowed
  And an error message is displayed

Scenario: Withdrawing money outside of banking hours
  Given the account holder is an adult
  And they try to request a withdrawal outside of banking hours
  When they try to withdraw money
  Then the withdrawal is not processed
  And an error message is displayed