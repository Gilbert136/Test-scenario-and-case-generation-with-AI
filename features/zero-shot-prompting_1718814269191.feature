
Feature: Money Transactions for Adults and Non-Adults

Scenario: Sending money as an adult
  Given the sender is an adult
  And the sender has sufficient balance in their account
  When they send money to another person
  Then the transaction should be successful

Scenario: Withdrawing money as an adult
  Given the account holder is an adult
  And the account has sufficient balance
  When they withdraw money from their account
  Then the withdrawal should be successful

Scenario: Sending money as a non-adult
  Given the sender is a non-adult
  When they try to send money to another person
  Then the transaction should fail
  And an error message should be displayed

Scenario: Withdrawing money as a non-adult
  Given the account holder is a non-adult
  When they try to withdraw money from their account
  Then the withdrawal should fail
  And an error message should be displayed

Scenario: Sending money with insufficient balance
  Given the sender is an adult
  And the sender has insufficient balance in their account
  When they try to send money to another person
  Then the transaction should fail
  And an error message should be displayed

Scenario: Withdrawing money with insufficient balance
  Given the account holder is an adult
  And the account has insufficient balance
  When they try to withdraw money from their account
  Then the withdrawal should fail
  And an error message should be displayed

These scenarios cover positive and negative cases for both adults and non-adults in sending and withdrawing money transactions.Feature: Money Transactions for Adults and Non-Adults

Scenario: Sending money as an adult
  Given the sender is an adult
  And the sender has sufficient balance in their account
  When they send money to another person
  Then the transaction should be successful

Scenario: Withdrawing money as an adult
  Given the account holder is an adult
  And the account has sufficient balance
  When they withdraw money from their account
  Then the withdrawal should be successful

Scenario: Sending money as a non-adult
  Given the sender is a non-adult
  When they try to send money to another person
  Then the transaction should fail
  And an error message should be displayed

Scenario: Withdrawing money as a non-adult
  Given the account holder is a non-adult
  When they try to withdraw money from their account
  Then the withdrawal should fail
  And an error message should be displayed

Scenario: Sending money with insufficient balance
  Given the sender is an adult
  And the sender has insufficient balance in their account
  When they try to send money to another person
  Then the transaction should fail
  And an error message should be displayed

Scenario: Withdrawing money with insufficient balance
  Given the account holder is an adult
  And the account has insufficient balance
  When they try to withdraw money from their account
  Then the withdrawal should fail
  And an error message should be displayed

Scenario: Attempting to send money to a non-adult
  Given the sender is an adult
  And the recipient is a non-adult
  When the sender tries to send money to the non-adult recipient
  Then the transaction should fail
  And an error message should be displayed

Scenario: Attempting to withdraw money as a non-adult
  Given the account holder is a non-adult
  When they try to withdraw money from their account
  Then the withdrawal should fail
  And an error message should be displayed

These additional scenarios cover cases where an adult tries to send money to a non-adult, and where a non-adult attempts to withdraw money, considering the different aspects of the transaction process for both age groups.Feature: Money Transactions for Adults and Non-Adults

Scenario: Sending money as an adult
  Given the sender is an adult
  And the sender has sufficient balance in their account
  When they send money to another person
  Then the transaction should be successful

Scenario: Withdrawing money as an adult
  Given the account holder is an adult
  And the account has sufficient balance
  When they withdraw money from their account
  Then the withdrawal should be successful

Scenario: Sending money as a non-adult
  Given the sender is a non-adult
  When they try to send money to another person
  Then the transaction should fail
  And an error message should be displayed

Scenario: Withdrawing money as a non-adult
  Given the account holder is a non-adult
  When they try to withdraw money from their account
  Then the withdrawal should fail
  And an error message should be displayed

Scenario: Sending money with insufficient balance
  Given the sender is an adult
  And the sender has insufficient balance in their account
  When they try to send money to another person
  Then the transaction should fail
  And an error message should be displayed

Scenario: Withdrawing money with insufficient balance
  Given the account holder is an adult
  And the account has insufficient balance
  When they try to withdraw money from their account
  Then the withdrawal should fail
  And an error message should be displayed

Scenario: Attempting to send money to a non-adult
  Given the sender is an adult
  And the recipient is a non-adult
  When the sender tries to send money to the non-adult recipient
  Then the transaction should fail
  And an error message should be displayed

Scenario: Attempting to withdraw money as a non-adult
  Given the account holder is a non-adult
  When they try to withdraw money from their account 
  Then the withdrawal should fail
  And an error message should be displayed

These scenarios cover various situations in sending and withdrawing money transactions for both adults and non-adults, ensuring that the system behaves as expected in different conditions.Feature: Money Transactions for Adults and Non-Adults

Scenario: Sending money as an adult
  Given the sender is an adult
  And the sender has sufficient balance in their account
  When they send money to another person
  Then the transaction should be successful

Scenario: Withdrawing money as an adult
  Given the account holder is an adult
  And the account has sufficient balance
  When they withdraw money from their account
  Then the withdrawal should be successful

Scenario: Sending money as a non-adult
  Given the sender is a non-adult
  When they try to send money to another person
  Then the transaction should fail
  And an error message should be displayed

Scenario: Withdrawing money as a non-adult
  Given the account holder is a non-adult
  When they try to withdraw money from their account
  Then the withdrawal should fail
  And an error message should be displayed

Scenario: Sending money with insufficient balance
  Given the sender is an adult
  And the sender has insufficient balance in their account
  When they try to send money to another person
  Then the transaction should fail
  And an error message should be displayed

Scenario: Withdrawing money with insufficient balance
  Given the account holder is an adult
  And the account has insufficient balance
  When they try to withdraw money from their account
  Then the withdrawal should fail
  And an error message should be displayed

Scenario: Attempting to send money to a non-adult
  Given the sender is an adult
  And the recipient is a non-adult
  When the sender tries to send money to the non-adult recipient
  Then the transaction should fail
  And an error message should be displayed

Scenario: Attempting to withdraw money as a non-adult
  Given the account holder is a non-adult
  When they try to withdraw money from their account
  Then the withdrawal should fail
  And an error message should be displayed

Scenario: Sending a large amount of money as an adult
  Given the sender is an adult
  And the sender has a large amount of money in their account
  When they send a high value amount to another person
  Then the transaction should be successful

Scenario: Sending money with a decimal value as an adult
  Given the sender is an adult
  And the sender has a balance with decimal value
  When they send money with a decimal value to another person
  Then the transaction should be successful

These additional scenarios cover edge cases such as sending a large amount of money, sending money with decimal values, and further testing the transactions for both adults and non-adults in different scenarios.